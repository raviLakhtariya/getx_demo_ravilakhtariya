// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

List<PostResponse> postFromJson(String str) => List<PostResponse>.from(json.decode(str).map((x) => PostResponse.fromJson(x)));

String postToJson(List<PostResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostResponse {
  PostResponse({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId,id;
  String? title,body;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
    userId: json["userId"] == null ? 0 : json["userId"],
    id: json["id"] == null ? 0 : json["id"],
    title: json["title"] == null ? "" : json["title"],
    body: json["body"] == null ? "" : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? 0 : userId,
    "id": id == null ? 0 : id,
    "title": title == null ? "" : title,
    "body": body == null ? "" : body,
  };
}
