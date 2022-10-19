import 'dart:async';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {

  void checkLogin() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLoggedIn = (prefs.getBool('isLoggedIn') == null)
        ? false
        : prefs.getBool('isLoggedIn');

    Timer(
        const Duration(seconds: 3),
        () => {
              if (isLoggedIn == true)
                {Get.offAllNamed('/definitionScreen')}
              else
                Get.offAllNamed('/onBoarding')
            });
  }
}
