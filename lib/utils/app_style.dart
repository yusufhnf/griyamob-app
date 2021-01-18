import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppStyle {
  static Color primaryColor = Color.fromRGBO(32, 71, 152, 1.0);

  //TextStyle
  static TextStyle boldH1 = TextStyle(color: Colors.white, fontSize: 35.0);
  static TextStyle thinH2Light = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20.0);
  static TextStyle thinH2Dark = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 20.0);

  static TextStyle helperYellow =
      TextStyle(fontSize: 12.0, color: Colors.yellow);
  //Padding
  static EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 16.0);
  static EdgeInsets screenPaddingAll =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0);

  //Sizedbox
  static SizedBox paddingSameObjectColumn = SizedBox(height: 15.0);
  static SizedBox paddingDifferentObjectColumn = SizedBox(height: 30.0);
  static SizedBox paddingSameObjectRow = SizedBox(height: 5.0);
  static SizedBox paddingDifferentObjectRow = SizedBox(height: 10.0);

  static LottieBuilder sadAnimation = LottieBuilder.asset(
    'assets/lottie/sad-failed.json',
    height: 150.0,
  );

  static LottieBuilder nodataAnimation = LottieBuilder.asset(
    'assets/lottie/nodata.json',
    fit: BoxFit.scaleDown,
  );

  static LottieBuilder paymentFailedAnimation = LottieBuilder.asset(
    'assets/lottie/payment-failed.json',
    height: 150.0,
  );

  static LottieBuilder successCheckAnimation = LottieBuilder.asset(
    'assets/lottie/cross-success.json',
    height: 150.0,
  );

  static LottieBuilder successCheckListAnimation = LottieBuilder.asset(
    'assets/lottie/checklist-success.json',
    height: 150.0,
  );

  static LottieBuilder loading = LottieBuilder.asset(
    'assets/lottie/loading.json',
    fit: BoxFit.scaleDown,
  );

  static LottieBuilder landing = LottieBuilder.asset(
    'assets/lottie/landing.json',
    fit: BoxFit.scaleDown,
  );

  static Icon getIconTopup(int value) {
    switch (value) {
      case 0:
        return Icon(
          Icons.timelapse_outlined,
          size: 35.0,
          color: Colors.grey,
        );
        break;
      case 1:
        return Icon(
          Icons.check_circle_outlined,
          size: 35.0,
          color: Colors.green,
        );
        break;
      default:
        return Icon(
          Icons.remove_circle_outline_rounded,
          size: 35.0,
          color: Colors.red,
        );
    }
  }

  static String getStatusTopup(int value) {
    switch (value) {
      case 0:
        return "DALAM KONFIRMASI";
        break;
      case 1:
        return "DITERIMA";
        break;
      default:
        return "DITOLAK";
    }
  }

  static TextStyle getStatusAction(String value) {
    switch (value) {
      case "D":
        return TextStyle(fontWeight: FontWeight.bold, color: Colors.green);
        break;
      default:
        return TextStyle(fontWeight: FontWeight.bold, color: Colors.red);
    }
  }

  //Gradient
  static LinearGradient blueToDarkBlue = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xff021B79), Color(0xff0575E6)]);
}
