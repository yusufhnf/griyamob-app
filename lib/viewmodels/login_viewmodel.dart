import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:griyabayar/models/login_model.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final _apiService = APIService();

  TextEditingController emailUser = TextEditingController();
  TextEditingController passUser = TextEditingController();

  Future<LoginModel> login() async {
    notifyListeners();
    setBusy(true);
    final data = await _apiService.loginUser(emailUser.text, passUser.text);
    setBusy(false);
    return LoginModel.fromJson(json.decode(data.body));
  }
}
