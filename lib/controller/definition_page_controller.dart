import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_dictionary/model/Post.dart';
import 'package:mini_dictionary/service/remote_services.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ad_helper.dart';

class DefinitionPageController extends GetxController {
  late TextEditingController editingController;

  var definitionList = <Definition>[].obs;

  var isLoaded = false.obs;

  String error = 'No Definition found.';

  @override
  void onInit() {
    super.onInit();
    editingController = TextEditingController();
    initBannerAd();
  }

  Future<void> getDefinition(String value) async {
    isLoaded(true);

    if (value.isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar("Enter something", "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 2000),
          forwardAnimationCurve: Curves.easeOutBack);
      isLoaded(false);
      return;
    }

    var response = await RemoteService().getSearchData(value);

    if (response != null) {
      definitionList.value = response.definitions;
      isLoaded(false);
    } else {
      Get.snackbar("Definition not found.", "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 2000),
          forwardAnimationCurve: Curves.easeOutBack);

      isLoaded(false);
      definitionList.clear();
    }

/*    print("Controller -----------");
    print(definitonList);*/
  }

  String firstUpperCase(String str) {
    String a = str.substring(0, 1);

    a = a.toUpperCase();
    String b = str.substring(1);

    return a + b;
  }

  String checkIfNull(String str) {
    if (str != '') {
      String a = str.substring(0, 1);

      a = a.toUpperCase();
      String b = str.substring(1);

      return a + b;
    }
    return str;
  }

  String exampleHeading(String str) {
    if (str != '') {
      str = "Example : ";
    }
    return str;
  }

  late BannerAd bannerAd;
  var isAdLoaded = false.obs;

  void initBannerAd() {
    print('Ad Caleed --');
    // isAdLoaded(true);
    bannerAd = BannerAd(
        size: AdSize.banner,
        // adUnitId: 'ca-app-pub-9980622067720306/1073776155',
        // adUnitId: BannerAd.testAdUnitId,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {

            isAdLoaded(true);
          },
          onAdFailedToLoad: (ad, error){
            if (kDebugMode) {
              print('Failed to load a banner ad: ${error.message}');
            }
            ad.dispose();
          }
        ),
        request: AdRequest());

    bannerAd.load();
  }
}


