import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:line_icons/line_icons.dart';

class ListTileTitle extends StatelessWidget {
  ListTileTitle({this.label, this.onPressed});

  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: AppStyle.primaryColor),
      ),
      trailing: IconButton(
        icon: Icon(
          LineIcons.chevron_circle_right,
          color: AppStyle.primaryColor,
        ),
        onPressed: onPressed == null ? () {} : onPressed,
      ),
    );
  }
}
