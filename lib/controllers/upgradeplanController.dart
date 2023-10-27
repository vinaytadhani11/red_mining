import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/Widget/purchased_popup.dart';
import 'package:redbtc_mining_app/models/add_plan_model.dart';
import 'package:redbtc_mining_app/models/upGradePlan_model.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';
import 'package:redbtc_mining_app/view/home_page.dart';

class upgradePlanController extends GetxController {
  final isLoading = true.obs;
  Api api = Api();
  RxList<UPData> updata = <UPData>[].obs;
  final selectData = Rxn<UPData>();
  getUpGradePlan() async {
    UpGradePlanModel upGradePlanModel;
    try {
      final response = await api.post(ApiConstants.plans, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
      });
      isLoading.value = false;
      log(response.body);
      if (response.statusCode == 200) {
        upGradePlanModel = UpGradePlanModel.fromJson(jsonDecode(response.body));
        if (upGradePlanModel.success == true) {
          log(response.statusCode.toString());
          updata.value = upGradePlanModel.data ?? [];
        } else {
          log(upGradePlanModel.message ?? "");
          AppFunction.showSnackBar(title: "Error", message: upGradePlanModel.message ?? "");
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

  addPlan() async {
    AddPlanModel addPlanModel;
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.addPlan, bodyData: {
        "appId": ApiConstants.APP_ID.toString(),
        "userId": AppSharedPreference.getUserKey.toString(),
        "planId": selectData.value?.id.toString(),
      });
      isLoading.value = false;
      log(response.body);

      if (response.statusCode == 200) {
        addPlanModel = AddPlanModel.fromJson(jsonDecode(response.body));
        if (addPlanModel.status == 200) {
          Get.dialog(barrierColor: Colors.grey.shade800.withOpacity(.3), PurchasedNetPopup(onTap: () {
            Get.off(() => const HomePage());
          }), barrierDismissible: false);
        } else {
          AppFunction.showSnackBar(title: "Error", message: addPlanModel.message ?? "");
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
