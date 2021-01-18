import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  LoadingAnimation({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppStyle.loading,
          SizedBox(
            height: 16.0,
          ),
          Text("Mohon Tunggu")
        ],
      ),
    );
  }
}
