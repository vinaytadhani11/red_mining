import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:redbtc_mining_app/models/leaderboard_model.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';

class LeaderboardController extends GetxController {
  final isLoading = false.obs;
  Api api = Api();
  RxList<Users> userData = <Users>[].obs;

  getLeaderboard() async {
    LeaderboardModel leaderboardModel;
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.getUser, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
      });
      isLoading.value = false;
      if (response.statusCode == 200) {
        leaderboardModel = LeaderboardModel.fromJson(jsonDecode(response.body));
        if (leaderboardModel.success == true) {
          log(response.statusCode.toString());
          userData.value = leaderboardModel.data?.users ?? [];
        } else {
          log(leaderboardModel.message ?? "");
          AppFunction.showSnackBar(title: "Error", message: leaderboardModel.message ?? "");
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
