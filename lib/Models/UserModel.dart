import 'dart:convert';
class User {


  String? email;
  String? password;
  User({
    this.email,
    this.password,

  });





  factory User.fromJson(Map<String, dynamic> json) => User(
    password: json["password"],
    email: json["email"],


  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "email": email,


  };

}