import 'package:flutter/material.dart';
import 'package:griyabayar/viewmodels/scanqr_viewmodel.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';

class ScanQRView extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanQRViewModel>.reactive(
      viewModelBuilder: () => ScanQRViewModel(context: context),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Scan QR Code"),
            backgroundColor: Colors.black26,
            elevation: 0.0,
            actions: [
              IconButton(
                  icon: Icon(model.flashIcon == false
                      ? Icons.flash_off_outlined
                      : Icons.flash_on_outlined),
                  onPressed: () {
                    model.onPressFlash();
                    model.controller.toggleFlash();
                  })
            ],
          ),
          extendBodyBehindAppBar: true,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: QRView(
              key: qrKey,
              onQRViewCreated: model.onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          )),
    );
  }
}
