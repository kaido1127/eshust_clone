import 'package:eshust/apis/apis.dart';
import 'package:eshust/controller/home_controller.dart';
import 'package:eshust/controller/login_controller.dart';
import 'package:eshust/helper/my_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _controller=LoginController();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final homeController=Get.find<HomeController>();
    return Scaffold(
      body: Container(
        color: Colors.red[900],
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, mq.height * 0.15, 0, 0),
              child: Column(
                children: [
                  SizedBox(
                      width: mq.width*0.25,
                      child: Image.asset('assets/images/hust_logo.png')),
                  SizedBox(height:mq.height*0.02),
                  const Text(
                    'EsHUST Login',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            //Image.asset('images/logo.jpg',scale: 0.5,),
            //SizedBox(height: mq.height*0.07,),
            Expanded(
              child:Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _controller.userNameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white54),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorStyle: const TextStyle(color: Colors.blue),
                            filled: true,
                            fillColor: Colors.red[900],
                            labelText: 'Tên đăng nhập',
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập tên đăng nhập';
                            } else if (value.length < 6) {
                              return 'Tên đăng nhập phải có độ dài từ 6 kí tự';
                            } else if (RegExp(r'[đĐơƠưƯ]').hasMatch(value)) {
                              return 'Tên đăng nhập không hợp lệ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _controller.passController,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white54),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorStyle: const TextStyle(color: Colors.blue),
                            filled: true,
                            fillColor: Colors.red[900],
                            labelText: 'Mật khẩu',
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Vui lòng nhập mật khẩu';
                            else if (value.length < 8) return 'Mật khẩu phải có độ dài từ 8 kí tự';
                            return null;
                          },
                        ),
                        const SizedBox(height: 25,),
                        ElevatedButton.icon(
                          onPressed: () async {
                            MyDialogs.showProgressBar(context);
                            await homeController.getStudent();
                            Get.back();
                            _controller.login();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[200],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              minimumSize:
                              Size(mq.width*0.5 , mq.height * 0.07)),
                          icon: const Icon(
                            Icons.login,
                            size: 20,
                          ),
                          label: const Text(
                            'Đăng nhập',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                  onTap: (){
                    _launchUrl('van17122003',);
                  },
                  child: Image.asset(
                    'assets/images/facebook_logo.png',
                    width: mq.width * 0.12,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
Future<void> _launchUrl(String link) async {
  Uri url = Uri.http('www.facebook.com',link);
  if (!await launchUrl(url,mode: LaunchMode.externalNonBrowserApplication)) {
    throw Exception('Could not launch $url');
  }
}
