import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/Widget/check_interenetpopup.dart';
import 'package:redbtc_mining_app/firebase_options.dart';
import 'package:redbtc_mining_app/splash_screen/splash_screen.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';

Future<void> initService() async {
  AppSharedPreference.init();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initService();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  if (fcmToken != null) AppSharedPreference.setFCMToken(fcmToken);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;
  // This widget is the root of your application.

  @override
  void initState() {
    initConnectivity();
    connectivitySubscription = connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  // @override
  // void dispose() {
  //   connectivitySubscription?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffC1120E),
        ),
        fontFamily: 'IBMPlexSans',
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      Get.dialog(barrierColor: Colors.grey.shade800.withOpacity(.3), CheckInterNetPopup(onTap: () {
        Get.back();
        initConnectivity();
      }), barrierDismissible: false);
    }
  }
}
