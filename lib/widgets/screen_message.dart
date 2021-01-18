import 'package:flutter/material.dart';

class ScreenMessage extends StatelessWidget {
  ScreenMessage({this.image, this.label});

  final Widget image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [image, SizedBox(height: 20.0), Text(label)],
      ),
    );
  }
}
