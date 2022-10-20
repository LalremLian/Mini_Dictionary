import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          
          Column(children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(4, 76, 113, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 55.0, left: 40.0),
                    child: Image(image: AssetImage("assets/app_icon.png"),
                      height: 60,alignment: Alignment.topLeft),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Mini Dictionary",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                  )

                ],
              )
            )
          ],),
/*          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(4, 66, 113, 1),
            ),
            currentAccountPicture: CircleAvatar(
              foregroundImage: AssetImage("assets/app_icon.png"),
            ),
            accountName: Text("Mini Dictionary"),
            accountEmail: Text(""),
          ) ,*/

          Expanded(
            child: Column(
              children: [
/*                ListTile(
                  leading: const Icon(Icons.rss_feed),
                  title: const Text("Feed"),
                  onTap: () {
                    Get.toNamed("/iconChangerScreen");
                  },
                ),*/

                ListTile(
                  leading: const Icon(Icons.info_outline_rounded),
                  title: const Text("About"),
                  onTap: () {
                    Get.toNamed("/aboutUsScreen");
                  },
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('VERSION 1.0.0',
                  style: TextStyle(fontSize: 8.0),),
              ))
        ],
      )

    );
  }
}