import 'package:flutter/material.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/viewmodels/history_viewmodel.dart';
import 'package:griyabayar/views/transaksidetail_view.dart';
import 'package:griyabayar/widgets/loading_progress.dart';
import 'package:griyabayar/widgets/screen_message.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

class HistoryView extends StatelessWidget {
  final StringFormat _format = StringFormat();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HistoryViewModel>.reactive(
      viewModelBuilder: () => HistoryViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Riwayat Transaksi"),
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
          backgroundColor: AppStyle.primaryColor,
        ),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            RefreshIndicator(
              onRefresh: model.initial,
              color: Colors.white,
              backgroundColor: Colors.orange,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .08,
                        width: double.infinity,
                        padding: AppStyle.screenPadding,
                        decoration: BoxDecoration(
                          color: AppStyle.primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0)),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .07,
                              bottom: 15.0),
                          child: model.busy(model.historyResult)
                              ? LoadingProgress()
                              : model.historyResult.body.isEmpty
                                  ? ScreenMessage(
                                      label: Strings.noData,
                                      image: AppStyle.nodataAnimation,
                                    )
                                  : Column(
                                      children: [
                                        ListView.separated(
                                            separatorBuilder: (context, index) {
                                              return Divider();
                                            },
                                            shrinkWrap: true,
                                            itemCount:
                                                model.historyResult.body.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                                child: ListTile(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              TransaksiDetailView(
                                                                title: model
                                                                    .historyResult
                                                                    .body[index]
                                                                    .sumbertarget,
                                                                detail: model
                                                                    .historyResult
                                                                    .body[index]
                                                                    .detail,
                                                                jumlah: model
                                                                    .historyResult
                                                                    .body[index]
                                                                    .jumlah,
                                                                noref: model
                                                                    .historyResult
                                                                    .body[index]
                                                                    .noref,
                                                                tanggal: model
                                                                    .historyResult
                                                                    .body[index]
                                                                    .datetime
                                                                    .toString(),
                                                                action: model
                                                                    .historyResult
                                                                    .body[index]
                                                                    .action,
                                                              )),
                                                    );
                                                  },
                                                  title: Text(
                                                    model
                                                        .historyResult
                                                        .body[index]
                                                        .sumbertarget,
                                                  ),
                                                  subtitle: Text(
                                                    model.historyResult
                                                        .body[index].detail,
                                                  ),
                                                  trailing: Text(
                                                    _format.getRupiahCurrency(
                                                        model
                                                            .historyResult
                                                            .body[index]
                                                            .jumlah),
                                                    style: AppStyle
                                                        .getStatusAction(model
                                                            .historyResult
                                                            .body[index]
                                                            .action),
                                                  ),
                                                ),
                                              );
                                            })
                                      ],
                                    ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .02,
                          right: 16.0,
                          left: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 80.0,
                              child: Card(
                                color: Colors.white,
                                elevation: 4.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Pemasukan",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(_format.getRupiahCurrency(
                                              model.sumPemasukan)),
                                        ],
                                      ),
                                      Icon(
                                        LineIcons.sign_in,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 80.0,
                              child: Card(
                                color: Colors.white,
                                elevation: 4.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Pengeluaran",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(_format.getRupiahCurrency(
                                              model.sumPengeluaran)),
                                        ],
                                      ),
                                      Icon(
                                        LineIcons.sign_out,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
