import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/widgets/screen_message.dart';
import 'package:line_icons/line_icons.dart';

class DompetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppStyle.primaryColor,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: Icon(LineIcons.bell),
              onPressed: () {
                Navigator.pushNamed(context, '/notifikasi');
              },
              tooltip: "Notifikasi",
            ),
          ],
          title: Text("Dompet"),
        ),
        body: ScreenMessage(
          image: SvgPicture.asset(
            'assets/images/undraw_under_construction_46pa.svg',
            height: 150.0,
          ),
          label: "Masih dalam pengembangan, Ditunggu ya! :)",
        ));
  }
}
