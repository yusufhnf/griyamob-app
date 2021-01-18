import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivasiWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppStyle.primaryColor,
        elevation: 0.0,
        title: Text("Kebijakan Privasi"),
      ),
      body: WebView(
        initialUrl: 'https://info.griyabayar.com/privasi.html',
      ),
    );
  }
}
