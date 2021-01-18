import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingProgress extends StatelessWidget {
  LoadingProgress({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingBouncingLine.circle(
        backgroundColor: color ?? AppStyle.primaryColor,
      ),
    );
  }
}
