import 'package:http/http.dart' as http;

import '../model/Post.dart';

class RemoteService{

  final String _url = "https://owlbot.info/api/v4/dictionary/";
  final String _token = "c99413a763f9861f62fad84a38adf948c9e50b71";

  Future<Post?> getSearchData(String value) async {

    http.Response response;
    response = await http.get(
        Uri.https(
            "owlbot.info", "/api/v4/dictionary/" + value),
        headers: {"Authorization": "Token " + _token});

    if(response.statusCode==200)
      {
        var json = response.body;
        return postFromJson(json);
      }
    return null;
  }
}