import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/widgets/bottomsheet_message.dart';

class MenuUtamaItem extends StatelessWidget {
  final String icon;
  final String navigateTo;
  final String label;

  const MenuUtamaItem({Key key, this.icon, this.navigateTo, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo != null
            ? Navigator.pushNamed(context, navigateTo)
            : BottomSheetMessage(
                    buttonOnPressed1: () => Navigator.of(context).pop(),
                    buttonTitle1: "Kembali",
                    image: AppStyle.sadAnimation,
                    title: "Menu belum ada",
                    detail: "Fitur sedang dalam pengerjaan",
                    context: context)
                .displayBottomSheet();
      },
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icon,
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      label,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
