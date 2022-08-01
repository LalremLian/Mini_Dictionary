import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/definition_page_controller.dart';
import 'package:lottie/lottie.dart';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class Definition extends StatelessWidget {
  Definition({Key? key}) : super(key: key);

  //late Stream stream;
  final definitionPageController = Get.find<DefinitionPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(4, 66, 113, 1),
        title: const Center(child: Text("Mini Dictionary")),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
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
                      contentPadding: EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (value) {
                      definitionPageController.getDefinition(value);
                    },
/*                    onChanged: (String value) {
                      if (definitionPageController.debounce.isActive) {
                        definitionPageController.debounce.cancel();
                      }
                      definitionPageController.debounce =
                          Timer(const Duration(milliseconds: 1000), () {
                        definitionPageController.search(value);
                      });
                    },*/
                  ),
                ),
              ),
              //.....................................................Search Icon
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  String a = definitionPageController.editingController.text;
                  definitionPageController.getDefinition(a);
                },
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
/*                  if (definitionPageController.definitionList == null) {
                    return const Center(
                      child: Text("Enter a search word"),
                    );
                  }*/
                  //.............................................Old ProgressBar
/*                  if (definitionPageController.isLoaded.value) {
                    return Center(
                      child: Lottie.asset('assets/searching.json'),
                    );
                  }*/
                  return Card(
                    color: Colors.grey[100],
                    child: ListBody(
                      children: <Widget>[
                        Container(
                          color: Colors.grey[300],
                          child: ListTile(
                            leading: definitionPageController.definitionList[index].definition == null
                                ? null
                                : Image.network(definitionPageController.definitionList[index].imageUrl,
                                    errorBuilder: (context, error, stackTrace) {
                                    return const SizedBox(
                                        height: 400, child: Text(''));
                                  }
                                    //height: 120,
                                    ),
                            title: Text(
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
    );
  }
}

/*class Defination extends GetxController {

  final definitionPageController = Get.find<DefinitionPageController>();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(4, 66, 113, 1),
        title: const Center(child: Text("Mini Dictionary")),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    //.................................Search Action In keyboard
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (value) {
                      _search();
                    },
                    onChanged: (String text) {
                      if (_debounce.isActive) _debounce.cancel();
                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        _search();
                      });
                    },
                    controller: de,
                    decoration: const InputDecoration(
                      hintText: "Search for a word",
                      contentPadding: EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              //.....................................................Search Icon
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  _search();
                },
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
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: _stream,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: Text("Enter a search word"),
                );
              }

              if (snapshot.data == "waiting") {
                return Center(
                  child: Lottie.asset('assets/searching.json'),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data["definitions"].length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.grey[100],
                    child: ListBody(
                      children: <Widget>[
                        Container(
                          color: Colors.grey[300],
                          child: ListTile(
                            leading: snapshot.data["definitions"][index]
                            ["image_url"] ==
                                null
                                ? null
                                : Image.network(
                              snapshot.data["definitions"][index]
                              ["image_url"],
                              height: 120,
                            ),
                            title: Text(
                              _editTextController.text.trim() +
                                  " (" +
                                  snapshot.data["definitions"][index]["type"] +
                                  ")",
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
                                firstUpperCase(snapshot.data["definitions"]
                                [index]["definition"]),
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 10.0),
                              child: Text(
                                exampleHeading(snapshot.data["definitions"][index]
                                ["example"] ??
                                    ''),
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, bottom: 6.0, top: 4.0),
                              child: Text(
                                checkIfNull(snapshot.data["definitions"][index]
                                ["example"] ??
                                    ''),
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
            },
          ),
        ),
      ),
    );
  }*/
