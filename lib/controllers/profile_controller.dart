import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/models/change_pass_model.dart';
import 'package:redbtc_mining_app/models/update_user_model.dart';
import 'package:redbtc_mining_app/models/userInfoModel.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final currentPassTC = TextEditingController();
  final newPassTC = TextEditingController();
  final confirmPassTC = TextEditingController();
  final firstNameTC = TextEditingController();
  final lastNameTC = TextEditingController();
  final emailTC = TextEditingController();
  String? country;
  final isObscure1 = true.obs;
  final isObscure2 = true.obs;
  final isObscure3 = true.obs;
  final userInfoModel = Rx<UserInfoModel?>(null);
  final updateUser = Rx<UpdateUserModel?>(null);
  Api api = Api();

  updatePasswordAPI() async {
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.changePassword, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
        "user_key": AppSharedPreference.getUserKey.toString(),
        "current_password": currentPassTC.text,
        "new_password": newPassTC.text,
      });
      isLoading.value = false;
      log(response.body);
      if (response.statusCode == 200) {
        ChangePasswordModel changePasswordModel;
        changePasswordModel = ChangePasswordModel.fromJson(jsonDecode(response.body));
        if (changePasswordModel.status == true) {
          Get.back();
          AppFunction.showSnackBar(title: "success", message: changePasswordModel.message ?? "");
          currentPassTC.clear();
          newPassTC.clear();
          confirmPassTC.clear();
        } else {
          AppFunction.showSnackBar(title: "Error", message: changePasswordModel.message ?? "");
          log(response.statusCode.toString());
        }
        // userInfoModel.value = UserInfoModel.fromJson();
      } else {
        AppFunction.showSnackBar(title: "Error", message: response.reasonPhrase);
        log(response.statusCode.toString());
      }
    } catch (error) {
      isLoading.value = false;
      AppFunction.showSnackBar(title: "Error", message: error.toString());
      print(error);
    }
  }

  getUserInfo() async {
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.getUserInfo, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
        "user_key": AppSharedPreference.getUserKey.toString(),
      });
      isLoading.value = false;
      log(response.body);
      if (response.statusCode == 200) {
        userInfoModel.value = UserInfoModel.fromJson(jsonDecode(response.body));
        log(response.body);
        if (userInfoModel.value?.success == true) {
          log(response.statusCode.toString());
          firstNameTC.text = userInfoModel.value?.data?.firstName ?? "";
          lastNameTC.text = userInfoModel.value?.data?.lastName ?? "";
          emailTC.text = userInfoModel.value?.data?.email ?? "";
          country = userInfoModel.value?.data?.country ?? "";
        } else {
          log(userInfoModel.value?.message ?? "");
          AppFunction.showSnackBar(title: "Error", message: userInfoModel.value?.message ?? "");
        }
      } else {
        AppFunction.showSnackBar(title: "Error", message: response.reasonPhrase);
        log(response.statusCode.toString());
      }
    } catch (error) {
      isLoading.value = false;
      AppFunction.showSnackBar(title: "Error", message: error.toString());
      print(error);
    }
  }

  updateUserProfile() async {
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.userInfoEditV2, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
        "user_key": AppSharedPreference.getUserKey.toString(),
        "first_name": firstNameTC.text,
        "last_name": lastNameTC.text,
        "country": country,
      });
      isLoading.value = false;
      log(response.body);
      if (response.statusCode == 200) {
        updateUser.value = UpdateUserModel.fromJson(jsonDecode(response.body));
        log(response.body);
        if (updateUser.value?.success == true) {
          log(response.statusCode.toString());
          AppFunction.showSnackBar(title: "success", message: updateUser.value?.message ?? "");
          firstNameTC.text = updateUser.value?.data?.firstName ?? "";
          lastNameTC.text = updateUser.value?.data?.lastName ?? "";
          emailTC.text = updateUser.value?.data?.email ?? "";
        } else {
          log(updateUser.value?.message ?? "");
          AppFunction.showSnackBar(title: "Error", message: updateUser.value?.message ?? "");
        }
      } else {
        AppFunction.showSnackBar(title: "Error", message: response.reasonPhrase);
        log(response.statusCode.toString());
      }
    } catch (error) {
      isLoading.value = false;
      AppFunction.showSnackBar(title: "Error", message: error.toString());
      print(error);
    }
  }
}
