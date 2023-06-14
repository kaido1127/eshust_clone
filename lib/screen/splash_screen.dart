import 'package:eshust/controller/home_controller.dart';
import 'package:eshust/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final controller=Get.put(HomeController());
    Future.delayed(const Duration(milliseconds: 2000), ()  {
      Get.off(()=>LoginScreen());
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.red[900],
        child: Stack(
          children: [
            Positioned(
              top: mq.height * 0.27,
              left: mq.width * .3,
              width: mq.width * .4,
              child: Column(
                children: [
                  Image.asset('assets/images/hust_logo.png'),
                  SizedBox(height: mq.height*0.02,),
                  const Text(
                    'EsHUST',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 23),
                  ),
                ],
              ),
            ),
            Positioned(
                width: mq.width,
                bottom: mq.height * .1,
                child: const Text(
                  'FROM NTV 2023',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54),
                ))
          ],
        ),
      ),
    );
  }
}
