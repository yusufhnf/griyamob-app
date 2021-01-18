// To parse this JSON data, do
//
//     final userFullModel = userFullModelFromJson(jsonString);

import 'dart:convert';

UserFullModel userFullModelFromJson(String str) =>
    UserFullModel.fromJson(json.decode(str));

String userFullModelToJson(UserFullModel data) => json.encode(data.toJson());

class UserFullModel {
  UserFullModel({
    this.status,
    this.body,
  });

  int status;
  List<Body> body;

  factory UserFullModel.fromJson(Map<String, dynamic> json) => UserFullModel(
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
    this.idusers,
    this.fullname,
    this.phone,
    this.email,
    this.saldo,
    this.avatar,
  });

  int idusers;
  String fullname;
  String phone;
  String email;
  int saldo;
  String avatar;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        idusers: json["idusers"] == null ? null : json["idusers"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        saldo: json["saldo"] == null ? null : json["saldo"],
        avatar: json["avatar"] == null ? null : json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "idusers": idusers == null ? null : idusers,
        "fullname": fullname == null ? null : fullname,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "saldo": saldo == null ? null : saldo,
        "avatar": avatar == null ? null : avatar,
      };
}
