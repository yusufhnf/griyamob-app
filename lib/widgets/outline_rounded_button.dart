import 'package:flutter/material.dart';

class OutlineRoundedButton extends StatelessWidget {
  OutlineRoundedButton({this.color, this.label, this.onPress});

  final Color color;
  final String label;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: Text(
        label,
        style: TextStyle(color: color),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: color)),
    );
  }
}
