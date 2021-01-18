// To parse this JSON data, do
//
//     final pdamModel = pdamModelFromJson(jsonString);

import 'dart:convert';

PdamModel pdamModelFromJson(String str) => PdamModel.fromJson(json.decode(str));

String pdamModelToJson(PdamModel data) => json.encode(data.toJson());

class PdamModel {
  PdamModel({
    this.status,
    this.body,
  });

  int status;
  List<Body> body;

  factory PdamModel.fromJson(Map<String, dynamic> json) => PdamModel(
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
    this.idpdam,
    this.namapdam,
  });

  int idpdam;
  String namapdam;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        idpdam: json["idpdam"] == null ? null : json["idpdam"],
        namapdam: json["namapdam"] == null ? null : json["namapdam"],
      );

  Map<String, dynamic> toJson() => {
        "idpdam": idpdam == null ? null : idpdam,
        "namapdam": namapdam == null ? null : namapdam,
      };
}
