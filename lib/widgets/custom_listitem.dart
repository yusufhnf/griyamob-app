import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';

class CustomListItem extends StatelessWidget {
  CustomListItem({this.image, this.title, this.detail, this.onTap});

  final String image;
  final String title;
  final String detail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: image == null
                          ? AssetImage(Strings.defaultAvatar)
                          : NetworkImage(image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppStyle.primaryColor),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: AppStyle.primaryColor),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                Text(
                  detail,
                  style: TextStyle(fontSize: 10.0),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
