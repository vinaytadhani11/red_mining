import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:redbtc_mining_app/models/sokect_model.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'dart:async';

class HomeController extends GetxController {
  StreamSocket streamSocket = StreamSocket();
  IO.Socket? socket;
  RxBool isMiningStart = false.obs;
  final socketIoModel = Rx<SocketIoModel?>(null);

  sokectIO() {
    socket = IO.io("http://157.230.176.42:8080", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket?.connect();
    socket?.onConnect((_) {
      socket?.emit('connectUser', [AppSharedPreference.getUserKey, ApiConstants.APP_ID.toString()]);
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
}

class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}
