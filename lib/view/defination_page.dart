import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_dictionary/widget/drawer_widget.dart';
import '../controller/definition_page_controller.dart';
import 'package:lottie/lottie.dart';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Definition extends StatelessWidget {

  Definition({Key? key}) : super(key: key){
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();

    definitionPageController.initBannerAd();
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final definitionPageController = Get.find<DefinitionPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Mini Dictionary'),
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            size: 30, // Changing Drawer Icon Size
          ),
          onPressed: () {
            if(scaffoldKey.currentState!.isDrawerOpen){
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            }else{
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        backgroundColor: const Color.fromRGBO(4, 66, 113, 1),
        // title: const Text("Mini Dictionary"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    //.................................Search Action In keyboard
                    textInputAction: TextInputAction.search,
                    controller: definitionPageController.editingController,
                    decoration: const InputDecoration(
                      hintText: "Search for a word",
                      contentPadding: EdgeInsets.only(left: 24.0,bottom: 8.0),
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (value) {
                      definitionPageController.getDefinition(value);
                    },
                  ),
                ),
              ),
              //.....................................................Search Icon
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    String a = definitionPageController.editingController.text;
                    definitionPageController.getDefinition(a);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      //................................................DoubleBack Functionality
      body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: Obx(() {
            if (definitionPageController.isLoaded.value) {
              return Center(
                child: Lottie.asset('assets/searching.json'),
              );
            } else if(definitionPageController.definitionList.isEmpty) {
              return const Center(
                child: Text("Enter a search word"),
              );
            }

            else {
              return ListView.builder(
                itemCount: definitionPageController.definitionList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.grey[100],
                    child: ListBody(
                      children: <Widget>[
                        Container(
                          color: Colors.grey[300],
                          child: ListTile(
                            leading: definitionPageController.definitionList[index].definition == null
                                ? null : Image.network(definitionPageController.definitionList[index].imageUrl,
                                    errorBuilder: (context, error, stackTrace) {
                                    return
                                      Text(
                                        definitionPageController.editingController.text.trim() +
                                            " (" + definitionPageController.definitionList[index].type + ")",
                                        style: const TextStyle(fontSize: 16),
                                      );
                                  }
                                    ),
                            title: Text(definitionPageController.definitionList[index].imageUrl == ''
                                ? '' :
                                definitionPageController.editingController.text.trim() +
                                    " (" + definitionPageController.definitionList[index].type + ")",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 8.0, left: 8.0, bottom: 4.0),
                              child: Text(
                                "Definition :",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 4.0),
                              child: Text(
                                definitionPageController.firstUpperCase(definitionPageController.definitionList[index].definition),
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 10.0),
                              child: Text(
                                definitionPageController.exampleHeading(definitionPageController.definitionList[index].example ?? ''),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, bottom: 6.0, top: 4.0),
                              child: Text(
                                definitionPageController.checkIfNull(definitionPageController.definitionList[index].example ?? ''),
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          })),

      bottomNavigationBar: Obx(
          ()=> definitionPageController.isAdLoaded.value ? Container(
            height: definitionPageController.bannerAd.size.height.toDouble(),
            width: definitionPageController.bannerAd.size.height.toDouble(),
            child: AdWidget(ad: definitionPageController.bannerAd),
          ) : const SizedBox(),
      )
    );
  }
}

