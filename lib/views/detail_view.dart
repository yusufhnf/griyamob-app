import 'package:flutter/material.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/views/image_view.dart';
import 'package:griyabayar/widgets/loading_progress.dart';

class DetailView extends StatelessWidget {
  DetailView({this.title, this.detail, this.datetime, this.image});
  final String title;
  final String detail;
  final String datetime;
  final String image;
  final StringFormat _format = StringFormat();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: title == null
          ? LoadingProgress()
          : CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: AppStyle.primaryColor,
                  title: Text("Detail"),
                  elevation: 0.0,
                  pinned: true,
                  snap: false,
                  floating: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.3,
                  flexibleSpace: FlexibleSpaceBar(
                      background: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ImageView(
                          imageSource: image ?? Strings.defaultAvatar,
                          isNetwork: image == null ? false : true,
                        );
                      }));
                    },
                    child: Hero(
                      tag: 'viewImage',
                      child: image == null
                          ? Image.asset(
                              Strings.defaultAvatar,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                    ),
                  )),
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding: AppStyle.screenPaddingAll,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          _format.convertTimeStamp(datetime),
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          detail,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
