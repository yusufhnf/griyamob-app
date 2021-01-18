import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/widgets/bottomsheet_message.dart';

class MenuSaldoItem extends StatelessWidget {
  final String navigateTo;
  final String label;
  final IconData icon;

  const MenuSaldoItem({Key key, this.navigateTo, this.label, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            size: MediaQuery.of(context).size.width * 0.1,
            color: AppStyle.primaryColor,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            label,
            style: TextStyle(color: AppStyle.primaryColor),
          )
        ],
      ),
    );
  }
}
