import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:griyabayar/configs/shared_preferences.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/models/response_model.dart';
import 'package:griyabayar/models/topup_model.dart';
import 'package:griyabayar/models/user_model.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:stacked/stacked.dart';

class TopUpViewModel extends BaseViewModel {
  final _apiService = APIService();
  final StringFormat _format = StringFormat();
  TextEditingController nominal = TextEditingController();
  TopupModel topupResult;
  int _saldo = 0;
  var _id;

  int get saldo => _saldo;

  Future initial() async {
    setBusy(true);
    getAllTopup();
    getSaldo();
    notifyListeners();
    setBusy(false);
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

  Future<TopupModel> getAllTopup() async {
    setBusy(true);
    setBusyForObject(topupResult, true);
    _id = await UserSharedPreference.getUser();
    final data = await _apiService.getAllTopup(_id);
    topupResult = topupModelFromJson(data.body);
    setBusyForObject(topupResult, false);
    setBusy(false);
    notifyListeners();
    return topupResult;
  }

  Future<ResponseModel> sendRequest() async {
    setBusy(true);
    _id = await UserSharedPreference.getUser();
    final data = await _apiService.requestTopup(
        _id, _format.getNumberOnly(nominal.text));
    setBusy(false);
    notifyListeners();
    return responseModelFromJson(data.body);
  }
}
