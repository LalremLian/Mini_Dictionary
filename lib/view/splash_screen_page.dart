import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:mini_dictionary/controller/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  SplashScreenController splashScreenController = Get.put(SplashScreenController());

  SplashScreen({Key? key}) : super(key: key){
    splashScreenController.checkLogin();
  }

  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Lottie.asset('assets/book.json'),
        )
    );
  }
}