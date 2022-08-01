import 'package:get/get.dart';
import 'package:mini_dictionary/binding/definition_binding.dart';
import 'package:mini_dictionary/view/splash_screen_page.dart';

import '../view/defination_page.dart';

appRoutes() => [
  GetPage(
    name: '/splashScreen',
    page: () => const SplashScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/definitionScreen',
    page: () => Definition(),
    middlewares: [MyMiddelware()],
    binding: DefinitionBinding(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}