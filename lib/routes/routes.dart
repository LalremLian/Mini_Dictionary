import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mini_dictionary/binding/definition_binding.dart';
import 'package:mini_dictionary/view/About%20Us.dart';
import 'package:mini_dictionary/view/onboarding_page.dart';
import 'package:mini_dictionary/view/privacy_policy.dart';
import 'package:mini_dictionary/view/splash_screen_page.dart';

import 'package:mini_dictionary/view/defination_page.dart';

appRoutes() => [
  GetPage(
    name: '/splashScreen',
    page: () => SplashScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/definitionScreen',
    page: () => Definition(),
    middlewares: [MyMiddelware()],
    binding: DefinitionBinding(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/aboutUsScreen',
    page: () => AboutUs(),
    middlewares: [MyMiddelware()],

  ),
  GetPage(
    name: '/onBoarding',
    page: () => OnBoardingPage(),
    middlewares: [MyMiddelware()],
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/privacyPolicy',
    page: () => PrivatePolicy(),
    middlewares: [MyMiddelware()],

  ),
];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    if (kDebugMode) {
      print(page?.name);
    }
    return super.onPageCalled(page);
  }
}