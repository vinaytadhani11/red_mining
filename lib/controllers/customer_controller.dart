import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:redbtc_mining_app/models/catagory_model.dart';
import 'package:redbtc_mining_app/models/creat_category_model.dart';
import 'package:redbtc_mining_app/models/send_message_model.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_picker/image_picker.dart';

class CustomerController extends GetxController {
  final isLoading = true.obs;
  final ticketTitleTC = TextEditingController();
  final sendMessageTC = TextEditingController();
  final descriptionTC = TextEditingController();
  RxList<Category> categoryList = <Category>[].obs;
  RxList<Message> messageList = <Message>[].obs;
  RxList<QueryS> query = <QueryS>[].obs;
  RxString descLength = "".obs;
  RxString selectCType = "".obs;
  RxString selectStatus = "".obs;
  Rx<String?> selectCategory = Rx<String?>(null);
  final selectedImage = Rx<File?>(null);
  final sendImage = Rx<File?>(null);
  TargetPlatform? platform;
  XFile? pickedFile;
  XFile? sendPickedFile;
  Api api = Api();
  ScrollController scrollController = ScrollController();

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
      query.value = selectCatogoryModel.data?.query ?? [];
    } catch (error) {
      isLoading.value = false;
      AppFunction.showSnackBar(title: "Error", message: error.toString());
      print(error);
    }
  }

  getMessageList(int queryID, int isMessage) async {
    try {
      // isLoading.value = isMessage == 0 ? true : false;
      String image64 = "";
      if (sendImage.value != null) {
        final bytes = io.File(sendImage.value?.path ?? "").readAsBytesSync();
        image64 = base64Encode(bytes);
      }
      final response = await api.post(ApiConstants.sendMessageNew, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
        "user_key": AppSharedPreference.getUserKey.toString(),
        "query_id": queryID.toString(),
        "is_message": isMessage.toString(),
        "description": sendMessageTC.text,
        "photo": image64
      });
      isLoading.value = false;
      log(response.body);
      MessageModel messageModel;
      messageModel = MessageModel.fromJson(jsonDecode(response.body));

      messageList.value = messageModel.data?.message ?? [];
      sendMessageTC.clear();
      SchedulerBinding.instance.addPostFrameCallback((_) {
        scrollController.jumpTo(
          scrollController.position.maxScrollExtent,
        );
      });
      // query.value = selectCatogoryModel.data?.query ?? [];
    } catch (error) {
      isLoading.value = false;
      AppFunction.showSnackBar(title: "Error", message: error.toString());
      print(error);
    }
  }

  createCategoryAPI() async {
    try {
      isLoading.value = true;
      String? image64;
      if (selectedImage.value != null) {
        final bytes = io.File(selectedImage.value?.path ?? "").readAsBytesSync();
        image64 = base64Encode(bytes);
      }

      isLoading.value = true;
      final response = await api.post(ApiConstants.createQueryNew, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
        "user_key": AppSharedPreference.getUserKey.toString(),
        "title": ticketTitleTC.text,
        "description": descriptionTC.text,
        "category_id": selectCategory.value,
        "photo": image64 ?? "",
      });
      isLoading.value = false;
      log(response.body);
      CreatedCategoryModel selectCatogoryModel;
      selectCatogoryModel = CreatedCategoryModel.fromJson(jsonDecode(response.body));
      log(selectCatogoryModel.message ?? "");
      AppFunction.showSnackBar(title: "success", message: selectCatogoryModel.message ?? "");
      ticketTitleTC.clear();
      descriptionTC.clear();
      getCategoryAPI();
      selectedImage.value = null;
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

  void sendSelectImage(ImageSource source) async {
    sendPickedFile = await ImagePicker().pickImage(source: source);

    if (sendPickedFile != null) {
      File? pickFile = File(sendPickedFile?.path ?? "");

      sendImage.value = pickFile;
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

  void sendShowPhotoOptione() {
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
                  sendSelectImage(ImageSource.gallery);

                  Get.back();
                },
                leading: const Icon(Icons.photo_library_outlined, color: Colors.white),
                title: const Text('Select from Gallery', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)),
              ),
              ListTile(
                onTap: () {
                  sendSelectImage(ImageSource.camera);
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
