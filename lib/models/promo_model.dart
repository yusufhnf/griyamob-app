// To parse this JSON data, do
//
//     final promoModel = promoModelFromJson(jsonString);

import 'dart:convert';

PromoModel promoModelFromJson(String str) =>
    PromoModel.fromJson(json.decode(str));

String promoModelToJson(PromoModel data) => json.encode(data.toJson());

class PromoModel {
  PromoModel({
    this.status,
    this.body,
  });

  int status;
  List<Body> body;

  factory PromoModel.fromJson(Map<String, dynamic> json) => PromoModel(
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
    this.idpromo,
    this.judul,
    this.detail,
    this.picture,
    this.date,
  });

  int idpromo;
  String judul;
  String detail;
  String picture;
  DateTime date;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        idpromo: json["idpromo"] == null ? null : json["idpromo"],
        judul: json["judul"] == null ? null : json["judul"],
        detail: json["detail"] == null ? null : json["detail"],
        picture: json["picture"] == null ? null : json["picture"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "idpromo": idpromo == null ? null : idpromo,
        "judul": judul == null ? null : judul,
        "detail": detail == null ? null : detail,
        "picture": picture == null ? null : picture,
        "date": date == null ? null : date.toIso8601String(),
      };
}
