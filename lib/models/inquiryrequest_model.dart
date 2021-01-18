// To parse this JSON data, do
//
//     final inquiryRequest = inquiryRequestFromJson(jsonString);

import 'dart:convert';

InquiryRequest inquiryRequestFromJson(String str) =>
    InquiryRequest.fromJson(json.decode(str));

String inquiryRequestToJson(InquiryRequest data) => json.encode(data.toJson());

class InquiryRequest {
  InquiryRequest({
    this.clientId,
    this.kodeProduk,
    this.nomorPelanggan,
    this.action,
  });

  String clientId;
  String kodeProduk;
  String nomorPelanggan;
  String action;

  factory InquiryRequest.fromJson(Map<String, dynamic> json) => InquiryRequest(
        clientId: json["ClientId"] == null ? null : json["ClientId"],
        kodeProduk: json["KodeProduk"] == null ? null : json["KodeProduk"],
        nomorPelanggan:
            json["NomorPelanggan"] == null ? null : json["NomorPelanggan"],
        action: json["Action"] == null ? null : json["Action"],
      );

  Map<String, dynamic> toJson() => {
        "ClientId": clientId == null ? null : clientId,
        "KodeProduk": kodeProduk == null ? null : kodeProduk,
        "NomorPelanggan": nomorPelanggan == null ? null : nomorPelanggan,
        "Action": action == null ? null : action,
      };
}
