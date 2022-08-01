// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.definitions,
    required this.word,
    required this.pronunciation,
  });

  List<Definition> definitions;
  String word;
  String pronunciation;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    definitions: List<Definition>.from(json["definitions"].map((x) => Definition.fromJson(x))),
    word: json["word"],
    pronunciation: (json["pronunciation"] == null? "": json["pronunciation"]),
  );

  Map<String, dynamic> toJson() => {
    "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
    "word": word,
    "pronunciation": pronunciation,
  };
}

class Definition {
  Definition({
    required this.type,
    required this.definition,
    required this.example,
    required this.imageUrl,
    required this.emoji,
  });

  String type;
  String definition;
  String example;
  String imageUrl;
  String emoji;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
    type: json["type"],
    definition: json["definition"],
    example: (json["example"] == null? "": json["example"]),
    imageUrl: (json["image_url"] == null? "": json["image_url"]),
    emoji: (json["emoji"] == null? "": json["emoji"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "definition": definition,
    "example": example,
    "image_url": imageUrl,
    "emoji": emoji,
  };
}
