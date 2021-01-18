// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.body,
  });

  int status;
  List<Body> body;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"] == null ? null : json["status"],
        body: json["body"] == null
            ? null
            : List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "body": body == null
            ? null
            : List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class Body {
  Body({
    this.fullname,
    this.phone,
    this.email,
    this.saldo,
    this.avatar,
    this.joined,
  });

  String fullname;
  String phone;
  String email;
  int saldo;
  String avatar;
  DateTime joined;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        fullname: json["fullname"] == null ? null : json["fullname"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        saldo: json["saldo"] == null ? null : json["saldo"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        joined: json["joined"] == null ? null : DateTime.parse(json["joined"]),
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname == null ? null : fullname,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "saldo": saldo == null ? null : saldo,
        "avatar": avatar == null ? null : avatar,
        "joined": joined == null ? null : joined.toIso8601String(),
      };
}
