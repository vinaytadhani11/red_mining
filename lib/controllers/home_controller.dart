import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/models/sokect_model.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';
import 'package:redbtc_mining_app/view/Auth/login_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'dart:async';

class HomeController extends GetxController {
  IO.Socket? socket;
  RxBool isMiningStart = false.obs;
  RxBool isBig = false.obs;
  RxBool isConnecting = false.obs;
  final socketIoModel = Rx<SocketIoModel?>(null);

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
    isMiningStart.value == false
        ? socket?.on('mine', (newMessage) {
            log(jsonEncode(newMessage));
            socketIoModel.value = SocketIoModel.fromJson(newMessage);
            isMiningStart.value = socketIoModel.value?.isMiningStart ?? false;
          })
        : disposeMining();
    Future.delayed(const Duration(milliseconds: 50), () {
      isBig.value = false;
    });
  }

  disposeMining() {
    isMiningStart.value = false;
    socket?.clearListeners();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(const Login_Screen(), transition: Transition.zoom);
  }
}
