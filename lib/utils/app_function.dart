import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppFunction {
  static void showSnackBar({
    required String title,
    required String message,
    SnackPosition? snackPosition,
  }) {
    Get.snackbar(
      title, message,
      snackPosition: snackPosition ?? SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      borderRadius: 8,
      backgroundColor: title.toLowerCase().contains('success') ? Colors.green : Colors.red,
      // : title.toLowerCase().contains('error')
      //     ? Colors.red
      //     : Colors.black45,
      animationDuration: const Duration(milliseconds: 500),
      barBlur: 10,
      colorText: Colors.white,
      isDismissible: false,
    );
  }
}
