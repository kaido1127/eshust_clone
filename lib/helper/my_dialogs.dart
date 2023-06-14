import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialogs{
  static void showProgressBar(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const Center(
          child: CircularProgressIndicator(),
        ));
  }
  static sucess({required String msg}) {
    Get.snackbar('Success', msg,
        colorText: Colors.white, backgroundColor: Colors.red.withOpacity(0.8));
  }

  static error({required String msg}) {
    Get.snackbar('Error', msg,
        colorText: Colors.red, backgroundColor: Colors.white.withOpacity(0.8));
  }

  static info({required String msg}) {
    Get.snackbar('Info', msg, colorText: Colors.white);
  }
}