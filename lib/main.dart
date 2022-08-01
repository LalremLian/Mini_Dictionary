import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_dictionary/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Route Management',
      initialRoute: '/splashScreen',
      getPages: appRoutes(),
    );
  }
}