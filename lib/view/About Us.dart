import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  AboutUs({Key? key}) : super(key: key);

  late WebViewController webControl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(4, 66, 113, 1),
          title: const Text('About'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 22.0, bottom: 10.0),
                  child: Text(
                    'Mini Dictionary',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Version - 1.0.0 \n Build on October 10, 2022',
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'This app is essentially an English-to-English dictionary (Pocket Addition) primarily intended for educational purposes. This app was created with the intention of bringing knowledge to the user, as well as being useful in education and for the greater good.',
                    style: TextStyle(fontSize: 15.0, height: 1.2),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "All data of APIs are obtained with the Payam's permission. The developer assumes no responsibility for the accuracy of the App's data.",
                    style: TextStyle(fontSize: 15.0, height: 1.2),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Please don't hesitate to provide us with feedback on the Play Store if you have any questions or suggestions.",
                    style: TextStyle(fontSize: 15.0, height: 1.2),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/privacyPolicy');
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ));
  }

/*  Future<String> localLoader() async {
    url: new Uri.dataFromString('<html><body>hello world</body></html>', mimeType: 'text/html').toString()
    // return await rootBundle.loadString('assets/sample.html');
    String data =  rootBundle.loadString('assets/sample.html') as String;
  }*/
}

