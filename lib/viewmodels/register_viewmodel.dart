import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:griyabayar/models/response_model.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final _apiService = APIService();

  TextEditingController emailUser = TextEditingController();
  TextEditingController passUser = TextEditingController();
  TextEditingController phoneUser = TextEditingController();
  TextEditingController fullnameUser = TextEditingController();

  Future<ResponseModel> register() async {
    notifyListeners();
    setBusy(true);
    final data = await _apiService.createUser(
        emailUser.text, phoneUser.text, fullnameUser.text, passUser.text);
    setBusy(false);
    return ResponseModel.fromJson(json.decode(data.body));
  }
}
