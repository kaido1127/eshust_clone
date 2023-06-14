import 'package:eshust/helper/my_dialogs.dart';
import 'package:eshust/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final formKey=GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passController = TextEditingController();

  final RxBool isLoginLoading = false.obs;
  final RxBool isLoginSuccess = false.obs;

  void login()  {
    Get.off(HomeScreen());
    MyDialogs.sucess(msg: 'EsHUST xin chào <3');
  }
}