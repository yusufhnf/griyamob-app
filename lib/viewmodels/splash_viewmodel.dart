import 'dart:async';

import 'package:flutter/material.dart';
import 'package:griyabayar/configs/push_notification_service.dart';
import 'package:griyabayar/configs/shared_preferences.dart';
import 'package:griyabayar/locator.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();
  SplashViewModel({this.context});
  BuildContext context;
  // final _apiService = APIService();
  Future initial() async {
    await _pushNotificationService.subscribeToEvent();
    await _pushNotificationService.initialise(context);
    startLaunch();
    notifyListeners();
  }

  startLaunch() async {
    notifyListeners();
    var getID = await UserSharedPreference.getUser();
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushNamedAndRemoveUntil(
          context, getID == null ? '/landing' : '/home', (route) => false);
    });
  }
}
