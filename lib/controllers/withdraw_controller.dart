import 'dart:developer';

import 'package:get/get.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';

class WithdrawController extends GetxController {
  final isLoading = false.obs;
  final loaderList = true.obs;
  Api api = Api();

  withdrawApiCalling() async {
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.addPlan, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
        "user_key": AppSharedPreference.getUserKey.toString(),
        "amount": "1",
        "address": "test",
        "status": "Success",
        "coin_name": "BTC",
      });
      isLoading.value = false;
      log(response.body);
      if (response.statusCode == 200) {
        // upGradePlanModel = UpGradePlanModel.fromJson(jsonDecode(response.body));
        // if (upGradePlanModel.success == true) {
        //   log(response.statusCode.toString());
        //   updata.value = upGradePlanModel.data ?? [];
        // } else {
        //   log(upGradePlanModel.message ?? "");
        //   AppFunction.showSnackBar(title: "Error", message: upGradePlanModel.message ?? "");
        // }
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

  withdrawHistoryAPI() async {
    try {
      final response = await api.post(ApiConstants.withdrawHistory, bodyData: {
        "user_key": AppSharedPreference.getUserKey.toString(),
        "appId": ApiConstants.APP_ID.toString(),
        "pageNumber": "1",
        "item_count": "50"
      });
      loaderList.value = false;
      log(response.body);
      if (response.statusCode == 200) {
        // upGradePlanModel = UpGradePlanModel.fromJson(jsonDecode(response.body));
        // if (upGradePlanModel.success == true) {
        //   log(response.statusCode.toString());
        //   updata.value = upGradePlanModel.data ?? [];
        // } else {
        //   log(upGradePlanModel.message ?? "");
        //   AppFunction.showSnackBar(title: "Error", message: upGradePlanModel.message ?? "");
        // }
      } else {
        AppFunction.showSnackBar(title: "Error", message: response.reasonPhrase);
        log(response.statusCode.toString());
      }
    } catch (error) {
      loaderList.value = false;
      AppFunction.showSnackBar(title: "Error", message: error.toString());
      print(error);
    }
  }
}
