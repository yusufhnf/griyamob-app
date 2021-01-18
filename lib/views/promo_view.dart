import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/views/detail_view.dart';
import 'package:griyabayar/widgets/custom_listitem.dart';
import 'package:griyabayar/widgets/loading_progress.dart';
import 'package:griyabayar/widgets/screen_message.dart';
import 'package:stacked/stacked.dart';
import 'package:griyabayar/viewmodels/promo_viewmodel.dart';

class PromoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PromoViewModel>.reactive(
      viewModelBuilder: () => PromoViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppStyle.primaryColor,
          elevation: 0.0,
          title: Text("Promo untukmu"),
        ),
        body: RefreshIndicator(
          onRefresh: model.initial,
          color: Colors.white,
          backgroundColor: Colors.orange,
          child: model.busy(model.resultPromo)
              ? LoadingProgress()
              : model.resultPromo.body.isEmpty
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
                              itemCount: model.resultPromo.body.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: AppStyle.screenPaddingAll,
                                    child: CustomListItem(
                                      image: model.resultPromo.body[index]
                                                  .picture ==
                                              null
                                          ? null
                                          : "${APIService().url}${model.resultPromo.body[index].picture}",
                                      title:
                                          model.resultPromo.body[index].judul,
                                      detail:
                                          model.resultPromo.body[index].detail,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailView(
                                                    datetime: model.resultPromo
                                                        .body[index].date
                                                        .toString(),
                                                    title: model.resultPromo
                                                        .body[index].judul,
                                                    detail: model.resultPromo
                                                        .body[index].detail,
                                                    image: model
                                                                .resultPromo
                                                                .body[index]
                                                                .picture ==
                                                            null
                                                        ? null
                                                        : "${APIService().url}${model.resultPromo.body[index].picture}",
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
