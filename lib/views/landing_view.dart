import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/widgets/outline_rounded_button.dart';
import 'package:griyabayar/widgets/rounded_button.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppStyle.landing,
                Text(Strings.landingGreet, style: AppStyle.boldH1),
                Text(Strings.landingSubGreet, style: AppStyle.thinH2Light),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  child: RoundedButton(
                    color: Colors.white,
                    onPress: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    title: Strings.labelLogin,
                  ),
                  width: double.infinity,
                ),
                SizedBox(height: 12.0),
                SizedBox(
                  child: OutlineRoundedButton(
                    color: Colors.white,
                    label: Strings.labelRegister,
                    onPress: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                  width: double.infinity,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
