import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mini_dictionary/view/defination_page.dart';
import 'package:mini_dictionary/view/splash_screen_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final String _token = "c99413a763f9861f62fad84a38adf948c9e50b71";

  final TextEditingController _controller = TextEditingController();

  late StreamController _streamController;
  late Stream _stream;

  late Timer _debounce;
  String error = 'No Defination found.';

  _search() async {
    if (_controller.text.isEmpty) {
      _streamController.add(null);
      return;
    }

    _streamController.add("waiting");
    Response response = await get(Uri.https("owlbot.info", "/api/v4/dictionary/"+ _controller.text.trim()),
        headers: {"Authorization": "Token " + _token});

    if(response.statusCode == 200)
      {
        _streamController.add(json.decode(response.body));
      }
      error = "sdf";
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
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
                    //.............................................Search Action
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (value){
                      _search();
                    },
                    onChanged: (String text) {
                      if (_debounce.isActive) _debounce.cancel();
                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        _search();
                      });
                    },
                    controller: _controller,
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
      body: Container(
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
              return const Center(
                child: CircularProgressIndicator(),
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
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Defination()
                                )
                            );
                          },
                          child: ListTile(
                            leading: snapshot.data["definitions"][index]["image_url"] == null
                                ? null
                                : Image.network(snapshot.data["definitions"][index]["image_url"],height: 120,),
                            /*CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data["definitions"][index]["image_url"]),
                            ),*/
                            title: Text(_controller.text.trim() + " (" + snapshot.data["definitions"][index]["type"] + ")"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Definition :\n" + snapshot.data["definitions"][index]["definition"]),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0,),
                        child: Text("Example :\n"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                        child: Text(snapshot.data["definitions"][index]["example"]),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}