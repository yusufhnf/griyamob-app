// To parse this JSON data, do
//
//     final inquiryModel = inquiryModelFromJson(jsonString);

import 'dart:convert';

InquiryModel inquiryModelFromJson(String str) =>
    InquiryModel.fromJson(json.decode(str));

String inquiryModelToJson(InquiryModel data) => json.encode(data.toJson());

class InquiryModel {
  InquiryModel({
    this.sessionId,
    this.status,
    this.errorMessage,
    this.kodeProduk,
    this.nomorPelanggan,
    this.nama,
    this.alamat,
    this.golongan,
    this.tagihan,
    this.total,
    this.clientId,
    this.namaProduk,
  });

  String sessionId;
  String status;
  String errorMessage;
  String kodeProduk;
  String nomorPelanggan;
  String nama;
  String alamat;
  String golongan;
  List<Tagihan> tagihan;
  int total;
  String clientId;
  String namaProduk;

  factory InquiryModel.fromJson(Map<String, dynamic> json) => InquiryModel(
        sessionId: json["SessionId"] == null ? null : json["SessionId"],
        status: json["Status"] == null ? null : json["Status"],
        errorMessage:
            json["ErrorMessage"] == null ? null : json["ErrorMessage"],
        kodeProduk: json["KodeProduk"] == null ? null : json["KodeProduk"],
        nomorPelanggan:
            json["NomorPelanggan"] == null ? null : json["NomorPelanggan"],
        nama: json["Nama"] == null ? null : json["Nama"],
        alamat: json["Alamat"] == null ? null : json["Alamat"],
        golongan: json["Golongan"] == null ? null : json["Golongan"],
        tagihan: json["Tagihan"] == null
            ? null
            : List<Tagihan>.from(
                json["Tagihan"].map((x) => Tagihan.fromJson(x))),
        total: json["Total"] == null ? null : json["Total"],
        clientId: json["ClientId"] == null ? null : json["ClientId"],
        namaProduk: json["NamaProduk"] == null ? null : json["NamaProduk"],
      );

  Map<String, dynamic> toJson() => {
        "SessionId": sessionId == null ? null : sessionId,
        "Status": status == null ? null : status,
        "ErrorMessage": errorMessage == null ? null : errorMessage,
        "KodeProduk": kodeProduk == null ? null : kodeProduk,
        "NomorPelanggan": nomorPelanggan == null ? null : nomorPelanggan,
        "Nama": nama == null ? null : nama,
        "Alamat": alamat == null ? null : alamat,
        "Golongan": golongan == null ? null : golongan,
        "Tagihan": tagihan == null
            ? null
            : List<dynamic>.from(tagihan.map((x) => x.toJson())),
        "Total": total == null ? null : total,
        "ClientId": clientId == null ? null : clientId,
        "NamaProduk": namaProduk == null ? null : namaProduk,
      };
}

class Tagihan {
  Tagihan({
    this.periode,
    this.meterLalu,
    this.meterKini,
    this.pemakaian,
    this.standAngkat,
    this.hargaAir,
    this.biayaAdmin,
    this.danaMeter,
    this.denda,
    this.total,
  });

  String periode;
  int meterLalu;
  int meterKini;
  int pemakaian;
  int standAngkat;
  int hargaAir;
  int biayaAdmin;
  int danaMeter;
  int denda;
  int total;

  factory Tagihan.fromJson(Map<String, dynamic> json) => Tagihan(
        periode: json["Periode"] == null ? null : json["Periode"],
        meterLalu: json["MeterLalu"] == null ? null : json["MeterLalu"],
        meterKini: json["MeterKini"] == null ? null : json["MeterKini"],
        pemakaian: json["Pemakaian"] == null ? null : json["Pemakaian"],
        standAngkat: json["StandAngkat"] == null ? null : json["StandAngkat"],
        hargaAir: json["HargaAir"] == null ? null : json["HargaAir"],
        biayaAdmin: json["BiayaAdmin"] == null ? null : json["BiayaAdmin"],
        danaMeter: json["DanaMeter"] == null ? null : json["DanaMeter"],
        denda: json["Denda"] == null ? null : json["Denda"],
        total: json["Total"] == null ? null : json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "Periode": periode == null ? null : periode,
        "MeterLalu": meterLalu == null ? null : meterLalu,
        "MeterKini": meterKini == null ? null : meterKini,
        "Pemakaian": pemakaian == null ? null : pemakaian,
        "StandAngkat": standAngkat == null ? null : standAngkat,
        "HargaAir": hargaAir == null ? null : hargaAir,
        "BiayaAdmin": biayaAdmin == null ? null : biayaAdmin,
        "DanaMeter": danaMeter == null ? null : danaMeter,
        "Denda": denda == null ? null : denda,
        "Total": total == null ? null : total,
      };
}
