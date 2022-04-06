
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/Post.dart';
class RemoteService{

  final String _url = "https://owlbot.info/api/v4/dictionary/";
  final String _token = "YOUR API KEY HERE";

  final TextEditingController _controller = TextEditingController();

  /*Future<Post?> getPosts() async
  {
    var client = http.Client();

    var uri = Uri.parse(_url + _controller.text.trim());
    var response = await client.get(uri , headers: {"Authorization": "Token " + _token});
    if(response.statusCode == 200)
    {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }*/
  Future<Post?> getPosts() async
  {
    if(_controller.text.isEmpty)
    var client = http.Client();

    var uri = Uri.parse(_url + _controller.text.trim());
    var response = await client.get(uri , headers: {"Authorization": "Token " + _token});
    if(response.statusCode == 200)
    {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }

  search() async {
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
}