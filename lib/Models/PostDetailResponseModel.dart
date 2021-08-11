// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

PostDetailResponse FromJson(String str) => PostDetailResponse.fromJson(json.decode(str));

String ToJson(PostDetailResponse data) => json.encode(data.toJson());

class PostDetailResponse {
  PostDetailResponse({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId,id;
  String? title,body;

  factory PostDetailResponse.fromJson(Map<String, dynamic> json) => PostDetailResponse(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "body": body == null ? null : body,
  };
}
