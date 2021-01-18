import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {@required this.title, @required this.color, @required this.onPress});

  final String title;
  final Color color;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.0,
      onPressed: onPress,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: color == AppStyle.primaryColor
                ? Colors.white
                : AppStyle.primaryColor),
      ),
    );
  }
}
