import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:redbtc_mining_app/models/minig_history_model.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';

class MiningHistoryController extends GetxController {
  final isLoading = false.obs;
  MiningHistory? miningHistory;
  RxList<DailyMiningHistory> miniList = <DailyMiningHistory>[].obs;
  Api api = Api();

  getMiningHistory() async {
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.getMining, bodyData: {
        "user_key": AppSharedPreference.getUserKey,
        "appId": ApiConstants.APP_ID.toString(),
        // "pageNumber": "1",
      });
      isLoading.value = false;
      log(response.body);
      if (response.statusCode == 200) {
        miningHistory = MiningHistory.fromJson(jsonDecode(response.body));
        miniList.value = miningHistory?.data?.dailyMiningHistory ?? [];
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
