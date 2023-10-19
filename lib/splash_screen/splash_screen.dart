import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';
import 'package:redbtc_mining_app/view/Auth/login_screen.dart';
import 'package:redbtc_mining_app/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? userExists;

  checkUserInfo() {
    userExists = AppSharedPreference.getLogin;
  }

  @override
  void initState() {
    checkUserInfo();
    Timer(const Duration(seconds: 2), () {
      try {
        userExists == true ? Get.offAll(() => const HomePage()) : Get.offAll(() => const Login_Screen());
      } catch (e) {
        log(e.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/splash.png"), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
