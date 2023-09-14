import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/firebase_options.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';
import 'view/Auth/login_screen.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: const Login_Screen(),
      // home: const HomePage(),
    );
  }
}
