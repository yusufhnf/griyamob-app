import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/widgets/rounded_button.dart';

class BottomSheetMessage {
  BottomSheetMessage(
      {this.context,
      this.title,
      this.detail,
      this.image,
      this.buttonOnPressed1,
      this.buttonOnPressed2,
      this.buttonTitle1,
      this.buttonTitle2});

  BuildContext context;
  String title;
  String detail;
  String buttonTitle1;
  String buttonTitle2;
  VoidCallback buttonOnPressed1;
  VoidCallback buttonOnPressed2;
  final image;

  void displayBottomSheet() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0))),
        builder: (builder) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            // height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                image,
                Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: AppStyle.primaryColor),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      detail,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RoundedButton(
                        title: buttonTitle1,
                        color: AppStyle.primaryColor,
                        onPress: buttonOnPressed1,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  void displayBottomSheetButton() {
    showModalBottomSheet(
        context: context,
        enableDrag: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0))),
        builder: (builder) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            // height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                image,
                Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: AppStyle.primaryColor),
                    ),
                    Text(
                      detail,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RoundedButton(
                          title: buttonTitle1,
                          color: AppStyle.primaryColor,
                          onPress: buttonOnPressed1),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: RoundedButton(
                          title: buttonTitle2,
                          color: AppStyle.primaryColor,
                          onPress: buttonOnPressed2),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
