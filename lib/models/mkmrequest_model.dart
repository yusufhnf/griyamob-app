// To parse this JSON data, do
//
//     final mkmRequest = mkmRequestFromJson(jsonString);

import 'dart:convert';

MkmRequest mkmRequestFromJson(String str) =>
    MkmRequest.fromJson(json.decode(str));

String mkmRequestToJson(MkmRequest data) => json.encode(data.toJson());

class MkmRequest {
  MkmRequest({
    this.sessionId,
    this.kodeProduk,
    this.nomorPelanggan,
    this.tagihan,
    this.totalTagihan,
    this.clientId,
    this.action,
    this.totalAdmin,
    this.mcc,
  });

  String sessionId;
  String kodeProduk;
  String nomorPelanggan;
  List<Tagihan> tagihan;
  int totalTagihan;
  String clientId;
  String action;
  String totalAdmin;
  String mcc;

  factory MkmRequest.fromJson(Map<String, dynamic> json) => MkmRequest(
        sessionId: json["SessionId"] == null ? null : json["SessionId"],
        kodeProduk: json["KodeProduk"] == null ? null : json["KodeProduk"],
        nomorPelanggan:
            json["NomorPelanggan"] == null ? null : json["NomorPelanggan"],
        tagihan: json["Tagihan"] == null
            ? null
            : List<Tagihan>.from(
                json["Tagihan"].map((x) => Tagihan.fromJson(x))),
        totalTagihan:
            json["TotalTagihan"] == null ? null : json["TotalTagihan"],
        clientId: json["ClientId"] == null ? null : json["ClientId"],
        action: json["Action"] == null ? null : json["Action"],
        totalAdmin: json["TotalAdmin"] == null ? null : json["TotalAdmin"],
        mcc: json["MCC"] == null ? null : json["MCC"],
      );

  Map<String, dynamic> toJson() => {
        "SessionId": sessionId == null ? null : sessionId,
        "KodeProduk": kodeProduk == null ? null : kodeProduk,
        "NomorPelanggan": nomorPelanggan == null ? null : nomorPelanggan,
        "Tagihan": tagihan == null
            ? null
            : List<dynamic>.from(tagihan.map((x) => x.toJson())),
        "TotalTagihan": totalTagihan == null ? null : totalTagihan,
        "ClientId": clientId == null ? null : clientId,
        "Action": action == null ? null : action,
        "TotalAdmin": totalAdmin == null ? null : totalAdmin,
        "MCC": mcc == null ? null : mcc,
      };
}

class Tagihan {
  Tagihan({
    this.periode,
    this.total,
  });

  String periode;
  int total;

  factory Tagihan.fromJson(Map<String, dynamic> json) => Tagihan(
        periode: json["Periode"] == null ? null : json["Periode"],
        total: json["Total"] == null ? null : json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "Periode": periode == null ? null : periode,
        "Total": total == null ? null : total,
      };
}
