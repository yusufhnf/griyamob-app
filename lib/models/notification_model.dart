// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.status,
    this.body,
  });

  int status;
  List<Body> body;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        status: json["status"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class Body {
  Body({
    this.idannoucement,
    this.title,
    this.detail,
    this.adminIdadmin,
    this.waktu,
    this.image,
  });

  int idannoucement;
  String title;
  String detail;
  int adminIdadmin;
  DateTime waktu;
  String image;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        idannoucement: json["idannoucement"],
        title: json["title"],
        detail: json["detail"],
        adminIdadmin: json["admin_idadmin"],
        waktu: DateTime.parse(json["waktu"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "idannoucement": idannoucement,
        "title": title,
        "detail": detail,
        "admin_idadmin": adminIdadmin,
        "waktu": waktu.toIso8601String(),
        "image": image,
      };
}
