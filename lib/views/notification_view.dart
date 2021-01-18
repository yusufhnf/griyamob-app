import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/viewmodels/notification_viewmodel.dart';
import 'package:griyabayar/views/detail_view.dart';
import 'package:griyabayar/widgets/custom_listitem.dart';
import 'package:griyabayar/widgets/loading_progress.dart';
import 'package:griyabayar/widgets/screen_message.dart';
import 'package:stacked/stacked.dart';

class NotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationViewModel>.reactive(
      viewModelBuilder: () => NotificationViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppStyle.primaryColor,
          elevation: 0.0,
          title: Text("Notifikasi"),
        ),
        body: RefreshIndicator(
          onRefresh: model.initial,
          color: Colors.white,
          backgroundColor: Colors.orange,
          child: model.busy(model.result)
              ? LoadingProgress()
              : model.result.body.isEmpty
                  ? ScreenMessage(
                      image: AppStyle.nodataAnimation,
                      label: Strings.noData,
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              shrinkWrap: true,
                              itemCount: model.result.body.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: AppStyle.screenPaddingAll,
                                    child: CustomListItem(
                                      image: model.result.body[index].image ==
                                              null
                                          ? null
                                          : "${APIService().url}${model.result.body[index].image}",
                                      title: model.result.body[index].title,
                                      detail: model.result.body[index].detail,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailView(
                                                    datetime: model.result
                                                        .body[index].waktu
                                                        .toString(),
                                                    title: model.result
                                                        .body[index].title,
                                                    detail: model.result
                                                        .body[index].detail,
                                                    image: model
                                                                .result
                                                                .body[index]
                                                                .image ==
                                                            null
                                                        ? null
                                                        : "${APIService().url}${model.result.body[index].image}",
                                                  )),
                                        );
                                      },
                                    ));
                              }),
                        )
                      ],
                    ),
        ),
      ),
    );
  }
}
