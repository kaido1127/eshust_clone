
import 'package:eshust/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late Size mq;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      /*darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 10),
      ),*/
      theme: ThemeData(
        appBarTheme: AppBarTheme(centerTitle: true, elevation: 10,color: Colors.red[900]),
      ),
      title: 'EsHust',
      home: SplashScreen(),
    );
  }
}
extension AppTheme on ThemeData{
  Color? get iConColor=> Colors.red[700];
}
