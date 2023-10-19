import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';
import 'package:redbtc_mining_app/view/Auth/login_screen.dart';
import 'package:redbtc_mining_app/view/home_page.dart';

class RegController extends GetxController {
  final fNameTC = TextEditingController();
  final lNameTC = TextEditingController();
  final emailTC = TextEditingController();
  final passTC = TextEditingController();
  final confPassTC = TextEditingController();
  final referralTC = TextEditingController();
  final isObscure = true.obs;
  final isObscureCon = true.obs;
  final regFormKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  Api api = Api();

  signUpWithEmailPassword() async {
    if (regFormKey.currentState?.validate() ?? false) {
      try {
        isLoading.value = true;
        var value = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTC.text, password: passTC.text);
        if (kDebugMode) {
          print(value.user?.displayName ?? "");
          print(value.user?.email ?? "");
          print(value.user?.uid ?? "");
        }
        signUpWithEmailPasswordServer();
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          AppFunction.showSnackBar(title: "Error", message: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          AppFunction.showSnackBar(title: "Error", message: 'The account already exists for that email.');
          print('The account already exists for that email.');
        }
      } catch (e) {
        isLoading.value = false;
        print(e);
      }
    }
  }

  signUpWithEmailPasswordServer() async {
    try {
      final response = await api.post(ApiConstants.signUp, bodyData: {
        "first_name": fNameTC.text,
        "last_name": lNameTC.text,
        "email": emailTC.text,
        "password": passTC.text,
        "password_confirmation": confPassTC.text,
        "country": "India",
        "referral_code": referralTC.text,
        "app_id": ApiConstants.APP_ID.toString(),
        "device_token": AppSharedPreference.getFCMToken,
      });
      isLoading.value = false;
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        if (jsonBody["success"] == true) {
          log(response.statusCode.toString());
          AppSharedPreference.setUid(jsonBody["data"]["UID"]);
          AppSharedPreference.setUserKey(jsonBody["data"]["user_key"]);
          AppSharedPreference.setString(SP.referral, jsonBody["data"]["referral_code"]);
          AppSharedPreference.setEmail(jsonBody["data"]["email"]);
          Get.offAll(() => const Login_Screen(), transition: Transition.topLevel);
          fNameTC.clear();
          emailTC.clear();
          passTC.clear();
          confPassTC.clear();
          AppFunction.showSnackBar(title: "Success", message: "Register Successfully");
        } else {
          log(jsonBody["message"].toString());
          AppFunction.showSnackBar(title: "Error", message: jsonBody["message"]);
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
