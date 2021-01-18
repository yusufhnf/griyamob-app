import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';

class ImageView extends StatelessWidget {
  ImageView({@required this.imageSource, this.isNetwork = true});

  final String imageSource;
  final bool isNetwork;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white24,
        iconTheme: IconThemeData(
          color: AppStyle.primaryColor, //change your color here
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
              tag: 'viewImage',
              child: isNetwork
                  ? Image.network(imageSource, fit: BoxFit.contain)
                  : Image.asset(imageSource, fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
