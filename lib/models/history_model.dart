// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  HistoryModel({
    this.status,
    this.body,
  });

  int status;
  List<Body> body;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
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
    this.idriwayattranksaksi,
    this.action,
    this.jumlah,
    this.noref,
    this.datetime,
    this.detail,
    this.usersIdusers,
    this.sumbertarget,
  });

  int idriwayattranksaksi;
  String action;
  int jumlah;
  String noref;
  DateTime datetime;
  String detail;
  int usersIdusers;
  String sumbertarget;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        idriwayattranksaksi: json["idriwayattranksaksi"] == null
            ? null
            : json["idriwayattranksaksi"],
        action: json["action"] == null ? null : json["action"],
        jumlah: json["jumlah"] == null ? null : json["jumlah"],
        noref: json["noref"] == null ? null : json["noref"],
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        detail: json["detail"] == null ? null : json["detail"],
        usersIdusers:
            json["users_idusers"] == null ? null : json["users_idusers"],
        sumbertarget:
            json["sumbertarget"] == null ? null : json["sumbertarget"],
      );

  Map<String, dynamic> toJson() => {
        "idriwayattranksaksi":
            idriwayattranksaksi == null ? null : idriwayattranksaksi,
        "action": action == null ? null : action,
        "jumlah": jumlah == null ? null : jumlah,
        "noref": noref == null ? null : noref,
        "datetime": datetime == null ? null : datetime.toIso8601String(),
        "detail": detail == null ? null : detail,
        "users_idusers": usersIdusers == null ? null : usersIdusers,
        "sumbertarget": sumbertarget == null ? null : sumbertarget,
      };
}
