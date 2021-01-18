// To parse this JSON data, do
//
//     final topupModel = topupModelFromJson(jsonString);

import 'dart:convert';

TopupModel topupModelFromJson(String str) =>
    TopupModel.fromJson(json.decode(str));

String topupModelToJson(TopupModel data) => json.encode(data.toJson());

class TopupModel {
  TopupModel({
    this.status,
    this.body,
  });

  int status;
  List<Body> body;

  factory TopupModel.fromJson(Map<String, dynamic> json) => TopupModel(
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
    this.idtopup,
    this.waktu,
    this.jumlah,
    this.status,
    this.usersIdusers,
    this.adminIdadmin,
  });

  int idtopup;
  DateTime waktu;
  int jumlah;
  int status;
  int usersIdusers;
  dynamic adminIdadmin;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        idtopup: json["idtopup"] == null ? null : json["idtopup"],
        waktu: json["waktu"] == null ? null : DateTime.parse(json["waktu"]),
        jumlah: json["jumlah"] == null ? null : json["jumlah"],
        status: json["status"] == null ? null : json["status"],
        usersIdusers:
            json["users_idusers"] == null ? null : json["users_idusers"],
        adminIdadmin: json["admin_idadmin"],
      );

  Map<String, dynamic> toJson() => {
        "idtopup": idtopup == null ? null : idtopup,
        "waktu": waktu == null ? null : waktu.toIso8601String(),
        "jumlah": jumlah == null ? null : jumlah,
        "status": status == null ? null : status,
        "users_idusers": usersIdusers == null ? null : usersIdusers,
        "admin_idadmin": adminIdadmin,
      };
}
