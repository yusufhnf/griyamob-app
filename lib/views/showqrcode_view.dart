import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowQRCodeView extends StatelessWidget {
  ShowQRCodeView({this.urlUser, this.namaUser});
  final String urlUser;
  final String namaUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Saya"),
        backgroundColor: AppStyle.primaryColor,
        elevation: 0,
      ),
      backgroundColor: AppStyle.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Tunjukkan QR Code ini untuk Transfer sesama GriyaMobile",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: QrImage(
                    embeddedImage: AssetImage(Strings.defaultAvatar),
                    data: urlUser,
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  namaUser,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
