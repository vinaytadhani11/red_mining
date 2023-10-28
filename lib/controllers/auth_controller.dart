import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';
import 'package:redbtc_mining_app/view/Auth/forget_screen.dart';
import 'package:redbtc_mining_app/view/home_page.dart';

class AuthController extends GetxController {
  final emailTC = TextEditingController();
  final passTC = TextEditingController();
  final isObscure = true.obs;
  final logInFormKey = GlobalKey<FormState>();
  Api api = Api();
  final isLoading = false.obs;

  Future<UserCredential> signInWithGoogleFirebase() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithGoogle() async {
    try {
      isLoading.value = true;
      FirebaseAuth.instance.currentUser;
      final firebaseUser = await signInWithGoogleFirebase();
      print(firebaseUser.user?.displayName ?? "");
      print(firebaseUser.user?.email ?? "");
      print(firebaseUser.user?.uid ?? "");
      loginApiCalling("2");
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  signInWithEmailPassword() async {
    if (logInFormKey.currentState?.validate() ?? false) {
      // FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTC.text, password: passTC.text).then((value) {
      //   print(value.user?.displayName ?? "");
      //   print(value.user?.email ?? "");
      //   print(value.user?.uid ?? "");
      //   loginApiCalling(1);
      //   // Get.to(() => Forget_Password(), transition: Transition.rightToLeftWithFade);
      //   //   Get.offAll(() => HomePage(), transition: Transition.topLevel);
      // }).catchError((e) {
      //   print(e);
      // });
      try {
        isLoading.value = true;
        FirebaseAuth.instance.currentUser;
        final firebaseUser = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTC.text, password: passTC.text);
        print(firebaseUser.user?.displayName ?? "");
        print(firebaseUser.user?.email ?? "");
        print(firebaseUser.user?.uid ?? "");
        loginApiCalling("1");
      } catch (e) {
        isLoading.value = false;
        print(e);
      }
    }
  }

  loginApiCalling(String loginWith) async {
    try {
      final response = await api.post(ApiConstants.login, bodyData: {
        "login_with": loginWith,
        "email": emailTC.text,
        "app_id": ApiConstants.APP_ID.toString(),
      });
      isLoading.value = false;
      if (response.statusCode == 200) {
        log(response.body);
        final jsonBody = jsonDecode(response.body);

        if (jsonBody["success"] == true) {
          log(response.statusCode.toString());
          AppSharedPreference.setUid(jsonBody["data"]["UID"]);
          AppSharedPreference.setUserKey(jsonBody["data"]["user_key"]);
          Get.offAll(() => HomePage(), transition: Transition.topLevel);
          emailTC.clear();
          passTC.clear();
          AppFunction.showSnackBar(title: "Success", message: jsonBody["message"]);
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
