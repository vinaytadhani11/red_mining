import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:redbtc_mining_app/models/catagory_model.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_picker/image_picker.dart';

class CustomerController extends GetxController {
  final isLoading = false.obs;
  final ticketTitleTC = TextEditingController();
  final descriptionTC = TextEditingController();
  RxList<Category> categoryList = <Category>[].obs;
  RxString descLength = "".obs;
  Rx<String?> selectCategory = Rx<String?>(null);
  final selectedImage = Rx<File?>(null);
  TargetPlatform? platform;
  XFile? pickedFile;
  Api api = Api();

  getCategoryAPI() async {
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.categoryNEW, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
        "user_key": AppSharedPreference.getUserKey.toString(),
      });
      isLoading.value = false;
      log(response.body);
      SelectCatogoryModel selectCatogoryModel;
      selectCatogoryModel = SelectCatogoryModel.fromJson(jsonDecode(response.body));
      log(response.body);
      categoryList.value = selectCatogoryModel.data?.category ?? [];
    } catch (error) {
      isLoading.value = false;
      AppFunction.showSnackBar(title: "Error", message: error.toString());
      print(error);
    }
  }

  Future<bool> checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.manageExternalStorage;
      // ignore: unrelated_type_equality_checks
      if (status != PermissionStatus.granted) {
        final result = await Permission.manageExternalStorage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      final status = await Permission.storage;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    }
    return false;
  }

  void selectImage(ImageSource source) async {
    pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      File? pickFile = File(pickedFile?.path ?? "");

      selectedImage.value = pickFile;
      log(pickFile.toString());
    }
  }

  void showPhotoOptione() {
    Get.dialog(
        barrierColor: Colors.grey.shade800.withOpacity(.3),
        AlertDialog(
          backgroundColor: Colors.black,
          title: const Text("Upload picture", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  selectImage(ImageSource.gallery);
                  Get.back();
                },
                leading: const Icon(Icons.photo_library_outlined, color: Colors.white),
                title: const Text('Select from Gallery', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)),
              ),
              ListTile(
                onTap: () {
                  selectImage(ImageSource.camera);
                  Get.back();
                },
                leading: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                title: const Text(
                  'Take a photo',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ));
  }
}
