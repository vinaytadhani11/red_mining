import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/main.dart';
import 'package:redbtc_mining_app/models/change_pass_model.dart';
import 'package:redbtc_mining_app/models/sokect_model.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';
import 'package:redbtc_mining_app/view/Auth/login_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'dart:async';

class HomeController extends GetxController {
  IO.Socket? socket;
  RxBool isMiningStart = true.obs;
  RxBool isBig = false.obs;
  RxBool isConnecting = false.obs;
  final socketIoModel = Rx<SocketIoModel?>(null);
  Api api = Api();
  String? pointPerhr;
  
  getpointPerhr() {
    String? currentSpeed = socketIoModel.value?.currentSpeed;
    pointPerhr = (currentSpeed??"" * 0.00000001.toInt());
  }

  sokectIO() {
    socket = IO.io("http://157.230.176.42:8080", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket?.connect();

    socket?.onConnect((_) {
      socket?.emit('connectUser', [AppSharedPreference.getUserKey, ApiConstants.APP_ID.toString()]);
      isConnecting.value = true;
      print('Connection established');
      socket?.on('mine', (newMessage) {
        print('Start mining');
        // log(jsonEncode(newMessage));
        socketIoModel.value = SocketIoModel.fromJson(newMessage);
        currentPoint.value = socketIoModel.value?.mining ?? "";
        isMiningStart.value = socketIoModel.value?.isMiningStart ?? false;
      });
    });

    socket?.onDisconnect((_) {
      print('Connection Disconnection');
      isMiningStart.value = false;
    });
    socket?.onConnectError((err) => print(err));
    socket?.onError((err) => print(err));
  }

  sendMessage() {
    socket?.emit('startMining', [AppSharedPreference.getUserKey, ApiConstants.APP_ID.toString()]);
  }

  startingMining() {
    isBig.value = true;
    if (isMiningStart.value == false) {
      sendMessage();
      socket?.on('mine', (newMessage) {
        print('Start mining');
        // log(jsonEncode(newMessage));
        socketIoModel.value = SocketIoModel.fromJson(newMessage);
        isMiningStart.value = socketIoModel.value?.isMiningStart ?? false;
        currentPoint.value = socketIoModel.value?.mining ?? "";
      });
    } else {
      // disposeMining();
    }

    Future.delayed(const Duration(milliseconds: 50), () {
      isBig.value = false;
    });
  }

  // disposeMining() {
  //   isMiningStart.value = false;
  //   socket?.clearListeners();
  //   socket?.disconnect();
  // }

  Future<void> signOut() async {
    // await FirebaseAuth.instance.signOut();
    // Get.offAll(const Login_Screen(), transition: Transition.zoom);
    try {
      final response = await api.post(ApiConstants.logOUt, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
        "email": AppSharedPreference.getEmail.toString(),
        "user_key": AppSharedPreference.getUserKey.toString(),
      });
      log(response.body);
      if (response.statusCode == 200) {
        ChangePasswordModel changePasswordModel;
        changePasswordModel = ChangePasswordModel.fromJson(jsonDecode(response.body));
        if (changePasswordModel.status == true) {
          AppSharedPreference.setLogin(false);
          Get.offAll(const Login_Screen(), transition: Transition.zoom);
          AppFunction.showSnackBar(title: "success", message: changePasswordModel.message ?? "");
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
      AppFunction.showSnackBar(title: "Error", message: error.toString());
      print(error);
    }
  }
}
