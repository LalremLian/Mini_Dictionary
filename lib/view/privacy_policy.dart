import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class PrivatePolicy extends StatelessWidget {
  PrivatePolicy({Key? key}) : super(key: key);

  late WebViewController webControl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(4, 66, 113, 1),
        title: const Text('Privacy Policy'),
      ),
      body: WebView(
        initialUrl:
        'https://lalremlian.github.io/Mini_Dictionary_Policy/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          webControl = webViewController;
        },
      ),
    );

      /*WebView(
      initialUrl:
      'https://lalremlian.github.io/Mini_Dictionary_Policy/',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        webControl = webViewController;
      },
    );*/
  }
}
