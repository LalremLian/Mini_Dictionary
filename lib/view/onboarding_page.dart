import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:mini_dictionary/controller/onboarding_controller.dart';

import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  OnBoardingController onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Lottie.asset('assets/education.json',),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('You now have access to millions of words in the palm of your hand.',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),textAlign: TextAlign.center),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Learn new words every single day.',
              style: TextStyle(fontSize: 15.0,)),
            ),
            const Text('To begin immediately, click continue.'),
            InkWell(
              onTap: () {
                onBoardingController.setIsLoggedIn();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Lottie.asset('assets/continue_button.json',),
              ),
            ),
          ]
        )
    );
  }
}
