import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:griyabayar/configs/shared_preferences.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/models/response_model.dart';
import 'package:griyabayar/models/user_model.dart';
import 'package:griyabayar/models/userfull_model.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:stacked/stacked.dart';

class TransferViewModel extends BaseViewModel {
  TransferViewModel({this.url});
  APIService _apiService = APIService();
  TextEditingController phoneUser = TextEditingController();
  TextEditingController nominalUser = TextEditingController();
  final String url;
  final StringFormat _format = StringFormat();
  int _saldo = 0;
  var _id;
  String _namaUser;
  String _idUserTarget;
  String _nameUserTarget;
  UserFullModel resultUser;
  ResponseModel resultResponse;
  UserModel result;

  int get saldo => _saldo;
  String get idUserTarget => _idUserTarget;

  Future initial() async {
    setBusy(true);
    _id = await UserSharedPreference.getUser();
    await getSaldo();
    if (url != null) {
      await getUser();
    }
    setBusy(false);
  }

  void updateNominal(String value) {
    nominalUser.text;
    notifyListeners();
  }

  Future getSaldo() async {
    notifyListeners();
    setBusy(true);
    final data = await _apiService.getUser(_id);
    result = UserModel.fromJson(json.decode(data.body));
    _saldo = result.body[0].saldo;
    _namaUser = result.body[0].fullname;
    setBusy(false);
  }

  Future<UserFullModel> getUser() async {
    setBusy(true);
    setBusyForObject(resultUser, true);
    final data = await _apiService.getTransferUser(
        url ?? "${_apiService.baseURL}/getinfouser/${phoneUser.text}");
    resultUser = userFullModelFromJson(data.body);
    if (resultUser.body.isNotEmpty) {
      _idUserTarget = resultUser.body[0].idusers.toString();
      _nameUserTarget = resultUser.body[0].fullname;
    }
    setBusyForObject(resultUser, false);
    setBusy(false);
    notifyListeners();
    return resultUser;
  }

  Future<ResponseModel> transfer() async {
    setBusy(true);
    setBusyForObject(resultResponse, true);
    final data = await _apiService.transferTransaction(
        _id,
        _namaUser,
        _idUserTarget,
        _nameUserTarget,
        _format.getNumberOnly(nominalUser.text));
    resultResponse = responseModelFromJson(data.body);
    setBusyForObject(resultResponse, false);
    setBusy(false);
    notifyListeners();
    return resultResponse;
  }
}
