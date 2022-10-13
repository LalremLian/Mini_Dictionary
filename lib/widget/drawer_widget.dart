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
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(4, 66, 113, 1),
            ),
/*            currentAccountPicture: CircleAvatar(
              foregroundImage: AssetImage("images/profile.png"),
            ),*/
            accountName: Text("Mini Dictionary"),
            accountEmail: Text("Lalrem Lian B. Tlung"),
          ) ,

          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.rss_feed),
                  title: const Text("Feed"),
                  onTap: () {
                    Get.toNamed("/iconChangerScreen");
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.info_outline_rounded),
                  title: const Text("About Us"),
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
                child: Text('VERSION 1.0',
                  style: TextStyle(fontSize: 8.0),),
              ))
        ],
      )

    );
  }
}