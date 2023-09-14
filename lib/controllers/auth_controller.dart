import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redbtc_mining_app/view/Auth/forget_screen.dart';

class AuthController extends GetxController {
  final emailTC = TextEditingController();
  final passTC = TextEditingController();
  final isObscure = true.obs;
  final logInFormKey = GlobalKey<FormState>();

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
      FirebaseAuth.instance.currentUser;

      final firebaseUser = await signInWithGoogleFirebase();
      print(firebaseUser.user?.displayName ?? "");
      print(firebaseUser.user?.email ?? "");
      print(firebaseUser.user?.uid ?? "");
    } catch (e) {
      print(e);
    }
  }

  signInWithEmailPassword() {
    if (logInFormKey.currentState?.validate() ?? false) {
      FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTC.text, password: passTC.text).then((value) {
        print(value.user?.displayName ?? "");
        print(value.user?.email ?? "");
        print(value.user?.uid ?? "");

        // Get.to(() => Forget_Password(), transition: Transition.rightToLeftWithFade);
        //   Get.offAll(() => HomePage(), transition: Transition.topLevel);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
