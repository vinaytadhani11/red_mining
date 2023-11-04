import 'dart:convert';
import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redbtc_mining_app/models/forgot_password_model.dart';
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

  Api api = Api();
  final isLoading = false.obs;

  bool forIsObscure = true;
  final key = GlobalKey<FormState>();
  TextEditingController textEditConEmail = TextEditingController();
  TextEditingController textEditConPassword = TextEditingController();
  bool isPressed = true;
  final forgotPass = Rx<ForgotPasswordmodel?>(null);

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

  // signInWithGoogle() async {
  //   try {
  //     isLoading.value = true;
  //     FirebaseAuth.instance.currentUser;
  //     final firebaseUser = await signInWithGoogleFirebase();
  //     print(firebaseUser.user?.displayName ?? "");
  //     print(firebaseUser.user?.email ?? "");
  //     print(firebaseUser.user?.uid ?? "");
  //     loginApiCalling("2");
  //   } catch (e) {
  //     isLoading.value = false;
  //     print(e);
  //   }
  // }

  // signInWithEmailPassword() async {
  //   if (logInFormKey.currentState?.validate() ?? false) {
  //     // FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTC.text, password: passTC.text).then((value) {
  //     //   print(value.user?.displayName ?? "");
  //     //   print(value.user?.email ?? "");
  //     //   print(value.user?.uid ?? "");
  //     //   loginApiCalling(1);
  //     //   // Get.to(() => Forget_Password(), transition: Transition.rightToLeftWithFade);
  //     //   //   Get.offAll(() => HomePage(), transition: Transition.topLevel);
  //     // }).catchError((e) {
  //     //   print(e);
  //     // });
  //     try {
  //       isLoading.value = true;
  //       FirebaseAuth.instance.currentUser;
  //       final firebaseUser = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTC.text, password: passTC.text);
  //       print(firebaseUser.user?.displayName ?? "");
  //       print(firebaseUser.user?.email ?? "");
  //       print(firebaseUser.user?.uid ?? "");
  //       loginApiCalling("1");
  //     } catch (e) {
  //       isLoading.value = false;
  //       print(e);
  //     }
  //   }
  // }

  loginApiCalling() async {
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.loginNEW, bodyData: {
        // "login_with": loginWith,
        "email": emailTC.text,
        "app_id": ApiConstants.APP_ID.toString(),
        "password": passTC.text,
      });
      isLoading.value = false;
      if (response.statusCode == 200) {
        log(response.body);
        final jsonBody = jsonDecode(response.body);

        if (jsonBody["success"] == true) {
          log(response.statusCode.toString());
          AppSharedPreference.setUid(jsonBody["data"]["UID"]);
          AppSharedPreference.setUserKey(jsonBody["data"]["user_key"]);
          AppSharedPreference.setEmail(jsonBody["data"]["email"]);
          AppSharedPreference.setLogin(true);
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

  forgotPassword() async {
    try {
      isLoading.value = true;
      final response = await api.post(ApiConstants.forgotPassword, bodyData: {
        "app_id": ApiConstants.APP_ID.toString(),
        "email": textEditConEmail.text,
      });
      isLoading.value = false;
      log(response.body);
      if (response.statusCode == 200) {
        forgotPass.value = ForgotPasswordmodel.fromJson(jsonDecode(response.body));
        log(response.body);
        if (forgotPass.value?.status == true) {
          log(response.statusCode.toString());
          textEditConEmail.clear();
          AppFunction.showSnackBar(title: "success", message: forgotPass.value?.message ?? "");
        } else {
          log(forgotPass.value?.message ?? "");
          AppFunction.showSnackBar(title: "Error", message: forgotPass.value?.message ?? "");
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
