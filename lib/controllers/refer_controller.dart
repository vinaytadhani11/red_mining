import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/models/userInfoModel.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';

class ReferController extends GetxController {
  final isLoading = false.obs;
  Api api = Api();
  final userInfoModel = Rx<UserInfoModel?>(null);
  final getReferCode = TextEditingController();

  getUserInfo() async {
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.userInfo, bodyData: {
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

  getReferralsHistory() async {
    try {
      isLoading.value = true;

      final response = await api.post(ApiConstants.referralsHistory, bodyData: {
        "user_key": AppSharedPreference.getUserKey.toString(),
        "appId": ApiConstants.APP_ID.toString(),
        "pageNumber": "1",
        "item_count": "50"
      });
      isLoading.value = false;
      if (response.statusCode == 200) {
        log(response.body);
        final jsonBody = jsonDecode(response.body);
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
