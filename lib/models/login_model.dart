// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.body,
  });

  int status;
  List<Body> body;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    this.password,
    this.joined,
    this.status,
    this.saldo,
    this.avatar,
  });

  int idusers;
  String fullname;
  String phone;
  String email;
  String password;
  DateTime joined;
  int status;
  int saldo;
  String avatar;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        idusers: json["idusers"] == null ? null : json["idusers"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        joined: json["joined"] == null ? null : DateTime.parse(json["joined"]),
        status: json["status"] == null ? null : json["status"],
        saldo: json["saldo"] == null ? null : json["saldo"],
        avatar: json["avatar"] == null ? null : json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "idusers": idusers == null ? null : idusers,
        "fullname": fullname == null ? null : fullname,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "joined": joined == null ? null : joined.toIso8601String(),
        "status": status == null ? null : status,
        "saldo": saldo == null ? null : saldo,
        "avatar": avatar == null ? null : avatar,
      };
}
