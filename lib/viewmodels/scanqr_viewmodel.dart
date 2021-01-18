import 'package:flutter/material.dart';
import 'package:griyabayar/views/transfer_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';

class ScanQRViewModel extends BaseViewModel {
  ScanQRViewModel({this.context});
  BuildContext context;
  bool _flashIcon = false;
  QRViewController controller;
  var qrText = '';

  bool get flashIcon => _flashIcon;

  Future initial() async {
    controller.resumeCamera();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      qrText = scanData;
      notifyListeners();
      if (qrText.contains("/griyatest/users/getinfouser/")) {
        controller.dispose();
        return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TransferView(isScanQR: true, url: qrText)),
        );
      }
    });
  }

  void onPressFlash() {
    _flashIcon == false ? _flashIcon = true : _flashIcon = false;
    notifyListeners();
  }
}
