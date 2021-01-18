// To parse this JSON data, do
//
//     final statistikModel = statistikModelFromJson(jsonString);

import 'dart:convert';

StatistikModel statistikModelFromJson(String str) =>
    StatistikModel.fromJson(json.decode(str));

String statistikModelToJson(StatistikModel data) => json.encode(data.toJson());

class StatistikModel {
  StatistikModel({
    this.status,
    this.body,
  });

  int status;
  List<Body> body;

  factory StatistikModel.fromJson(Map<String, dynamic> json) => StatistikModel(
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
    this.datetime,
    this.action,
    this.totalnominal,
    this.totalaksi,
  });

  DateTime datetime;
  String action;
  int totalnominal;
  int totalaksi;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        action: json["action"] == null ? null : json["action"],
        totalnominal:
            json["totalnominal"] == null ? null : json["totalnominal"],
        totalaksi: json["totalaksi"] == null ? null : json["totalaksi"],
      );

  Map<String, dynamic> toJson() => {
        "datetime": datetime == null ? null : datetime.toIso8601String(),
        "action": action == null ? null : action,
        "totalnominal": totalnominal == null ? null : totalnominal,
        "totalaksi": totalaksi == null ? null : totalaksi,
      };
}
