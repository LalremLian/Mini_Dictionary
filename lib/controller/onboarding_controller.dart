import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController {

  void setIsLoggedIn() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    Get.offAllNamed('/definitionScreen');
  }
}
