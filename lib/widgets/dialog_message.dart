import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertShow {
  AlertShow({this.context, this.title, this.detail, this.image, this.button});

  BuildContext context;
  String title;
  String detail;
  final image;
  List<DialogButton> button;

  void showAlertPopup() async {
    Alert(
      image: image,
      style: AlertStyle(
          isCloseButton: false,
          animationType: AnimationType.grow,
          titleStyle: TextStyle(color: AppStyle.primaryColor)),
      context: context,
      buttons: button,
      title: title,
      desc: detail,
    ).show();
  }
}
