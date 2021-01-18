import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:griyabayar/configs/shared_preferences.dart';
import 'package:griyabayar/models/inquiry_model.dart';
import 'package:griyabayar/models/inquiryrequest_model.dart';
import 'package:griyabayar/models/mkmrequest_model.dart' as mkmReq;
import 'package:griyabayar/models/mkmrespond_model.dart';
import 'package:griyabayar/models/pdam_model.dart';
import 'package:griyabayar/models/response_model.dart';
import 'package:griyabayar/models/user_model.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:stacked/stacked.dart';

class PdamViewModel extends BaseViewModel {
  PdamViewModel({this.context});
  BuildContext context;
  final _apiService = APIService();
  PdamModel resultPDAM;
  PdamModel newResultPDAM;
  InquiryModel resultInquiry;
  MkmRespond resultPaymentAdvice;
  ResponseModel resultRespond;
  ResponseModel resultHistory;
  TextEditingController nopel = TextEditingController();
  String _namaPelanggan;
  int kodePDAM;
  String namaPDAM;
  int _saldo = 0;
  int _totalInquiry;

  int get saldo => _saldo;
  int get totalInquiry => _totalInquiry;
  String get namaPelanggan => _namaPelanggan;

  Future initial() async {
    setBusy(true);
    getSaldo();
    getPDAMList();
    setBusy(false);
  }

  void onNopelChanged(String value) {
    if (value.isEmpty) {
      nopel.text = null;
    }
    notifyListeners();
  }

  void onItemChanged(String value) {
    if (value.isNotEmpty) {
      newResultPDAM.body = resultPDAM.body
          .where((string) =>
              string.namapdam.toLowerCase().contains(value.toLowerCase()))
          .toList();
      notifyListeners();
    } else {
      newResultPDAM = resultPDAM;
    }
    notifyListeners();
  }

  Future<PdamModel> getPDAMList() async {
    setBusyForObject(resultPDAM, true);
    final data = await _apiService.getAllPDAM();
    setBusy(false);
    resultPDAM = pdamModelFromJson(data.body);
    newResultPDAM = resultPDAM;
    setBusyForObject(resultPDAM, false);
    notifyListeners();
    return resultPDAM;
  }

  void setPDAM(String value) {
    namaPDAM = value;
    notifyListeners();
  }

  Future<InquiryModel> getInquiry() async {
    setBusy(true);
    InquiryRequest request = InquiryRequest(
        clientId: "testuser",
        kodeProduk: kodePDAM.toString(),
        nomorPelanggan: nopel.text,
        action: "inquiry");
    final data = await _apiService.inquiryMKM(request);
    resultInquiry = inquiryModelFromJson(data.body);
    _totalInquiry = resultInquiry.total;
    _namaPelanggan = resultInquiry.nama;
    setBusy(false);
    notifyListeners();
    return resultInquiry;
  }

  Future getSaldo() async {
    notifyListeners();
    setBusy(true);
    var id = await UserSharedPreference.getUser();
    final data = await _apiService.getUser(id);
    UserModel result = UserModel.fromJson(json.decode(data.body));
    _saldo = result.body[0].saldo;
    setBusy(false);
  }

  Future<ResponseModel> getPaymentAdvice() async {
    setBusy(true);
    List<mkmReq.Tagihan> tagihan = [];
    for (var i in resultInquiry.tagihan) {
      tagihan.add(mkmReq.Tagihan(periode: i.periode, total: i.total));
    }
    mkmReq.MkmRequest request = mkmReq.MkmRequest(
        sessionId: resultInquiry.sessionId,
        kodeProduk: resultInquiry.kodeProduk,
        nomorPelanggan: resultInquiry.nomorPelanggan,
        tagihan: tagihan,
        totalTagihan: _totalInquiry,
        clientId: resultInquiry.clientId,
        action: "payment",
        totalAdmin: "2000",
        mcc: "6014");
    var id = await UserSharedPreference.getUser();
    final check =
        await _apiService.paymentTransaction(_totalInquiry.toString(), id);
    resultRespond = responseModelFromJson(check.body);
    if (resultRespond.status == 0) {
      final data = await _apiService.paymentAdviceMKM(request);
      resultPaymentAdvice = mkmRespondFromJson(data.body);
      if (resultPaymentAdvice.status != "0000") {
        return ResponseModel(status: 410, body: "Pembayaran Gagal");
      }
      for (var i in resultInquiry.tagihan) {
        final dataHistory = await _apiService.addHistory(
            i.total.toString(),
            id,
            "K",
            resultInquiry.sessionId,
            "Pembayaran PDAM - Periode ${i.periode}",
            resultInquiry.namaProduk);
        resultHistory = responseModelFromJson(dataHistory.body);
        if (resultHistory.status != 0) {
          return resultHistory;
        }
      }
    }
    setBusy(false);
    notifyListeners();
    return resultRespond;
  }

  /* void createPDF() async {
    final doc = pw.Document();
    var dir = await getTemporaryDirectory();
    pdf = await PDFFormat(
            context: context,
            noref: "tes",
            detail: "Bayar PDAM",
            periode: "tanggal",
            terbilang: 40000,
            total: "400000")
        .pdfKuitansi();
    final file = File('${dir.path}/haha.pdf');
    await file.writeAsBytes(pdf.save());
    await Printing.sharePdf(bytes: pdf.save(), filename: 'haha.pdf');
  } */
}
