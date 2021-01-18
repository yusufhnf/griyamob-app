// To parse this JSON data, do
//
//     final mkmRespond = mkmRespondFromJson(jsonString);

import 'dart:convert';

MkmRespond mkmRespondFromJson(String str) =>
    MkmRespond.fromJson(json.decode(str));

String mkmRespondToJson(MkmRespond data) => json.encode(data.toJson());

class MkmRespond {
  MkmRespond({
    this.sessionId,
    this.status,
    this.errorMessage,
    this.kodeProduk,
    this.clientId,
    this.namaProduk,
  });

  String sessionId;
  String status;
  String errorMessage;
  String kodeProduk;
  String clientId;
  String namaProduk;

  factory MkmRespond.fromJson(Map<String, dynamic> json) => MkmRespond(
        sessionId: json["SessionId"] == null ? null : json["SessionId"],
        status: json["Status"] == null ? null : json["Status"],
        errorMessage:
            json["ErrorMessage"] == null ? null : json["ErrorMessage"],
        kodeProduk: json["KodeProduk"] == null ? null : json["KodeProduk"],
        clientId: json["ClientId"] == null ? null : json["ClientId"],
        namaProduk: json["NamaProduk"] == null ? null : json["NamaProduk"],
      );

  Map<String, dynamic> toJson() => {
        "SessionId": sessionId == null ? null : sessionId,
        "Status": status == null ? null : status,
        "ErrorMessage": errorMessage == null ? null : errorMessage,
        "KodeProduk": kodeProduk == null ? null : kodeProduk,
        "ClientId": clientId == null ? null : clientId,
        "NamaProduk": namaProduk == null ? null : namaProduk,
      };
}
