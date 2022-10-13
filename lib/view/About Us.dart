import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(4, 66, 113, 1),
          title: const Text('About'),
        ),
        body:
            // Text('Mini Dictionary'),

            Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 22.0,bottom: 10.0),
              child: Text(
                'Mini Dictionary',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text('Version - 1.0 \n Build on October 10, 2022',
                style: TextStyle(),
                textAlign: TextAlign.center,),
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
                "All data and APIs are obtained with the Payam's permission. The developer assumes no responsibility for the accuracy of the App's data.",
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

            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'Copyright © 2022 Lalrem Lian B. Tlung',
                style: TextStyle(),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        )
/*      Column(
          children: const [
            Text('Mini Dictionary'),
            Text('version - 1.0 | Build on October 10, 2022'),
            Align(
              alignment: Alignment.bottomRight,
                child: Text('Copyright © 2022 Lalrem Lian B Tlung')),
          ],
        ),*/

        );
  }
}
