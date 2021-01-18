import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/widgets/rounded_button.dart';
import 'package:line_icons/line_icons.dart';

class CustomDropdown extends StatelessWidget {
  CustomDropdown(
      {this.label, this.listBuilder, this.onChanged, this.controller});
  final String label;
  final Widget listBuilder;
  final onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        onPressed: () {
          return showModalBottomSheet(
              isDismissible: false,
              context: context,
              enableDrag: false,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              builder: (builder) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /* Expanded(
                        flex: 1,
                        child: TextFormField(
                          autofocus: false,
                          controller: controller,
                          onChanged: onChanged,
                          decoration: InputDecoration(
                            prefixStyle:
                                TextStyle(color: AppStyle.primaryColor),
                            prefixIcon: Icon(LineIcons.search,
                                color: AppStyle.primaryColor),
                            hintText: label,
                            contentPadding:
                                EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ), */
                      Expanded(flex: 4, child: listBuilder),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: RoundedButton(
                                title: "Tutup",
                                color: AppStyle.primaryColor,
                                onPress: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
        },
        borderSide: BorderSide(color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
