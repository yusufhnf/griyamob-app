import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/viewmodels/statistik_viewmodel.dart';
import 'package:griyabayar/widgets/loading_animation.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:stacked/stacked.dart';

class StatistikView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatistikViewModel>.reactive(
      viewModelBuilder: () => StatistikViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Statistik"),
          backgroundColor: AppStyle.primaryColor,
        ),
        backgroundColor: AppStyle.primaryColor,
        body: model.busy(model.resultUser)
            ? Center(
                child: LoadingBouncingLine.circle(
                  backgroundColor: Colors.white,
                ),
              )
            : Container(
                height: double.infinity,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: Text(
                        model.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("+62" + model.nomorTelepon,
                          style: TextStyle(color: Colors.white)),
                      leading: CircleAvatar(
                        backgroundImage: model.avatar == null
                            ? AssetImage(Strings.defaultAvatar)
                            : NetworkImage(model.avatar),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5.0),
                      child: Text(
                        "Transaksi Bulan Ini",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                      child: AspectRatio(
                        aspectRatio: 4 / 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jumlah Transaksi Bulan ini",
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          model.countTransaksi,
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              color: AppStyle.primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: double.infinity,
                                      child: AspectRatio(
                                        aspectRatio: 3 / 2,
                                        child: Card(
                                          color: Colors.green,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pemasukan",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Text(
                                                    StringFormat()
                                                        .getRupiahCurrency(
                                                            model.pemasukan),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: double.infinity,
                                      child: AspectRatio(
                                        aspectRatio: 3 / 2,
                                        child: Card(
                                          color: Colors.red,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pengeluaran",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Text(
                                                    StringFormat()
                                                        .getRupiahCurrency(
                                                            model.pengeluaran),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5.0),
                      child: Text(
                        "Statistik Transaksi Bulanan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                      child: AspectRatio(
                        aspectRatio: 3 / 3,
                        child: Card(
                          color: Colors.orange,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: model.busy(model.resultStatistik)
                                ? Center(
                                    child: LoadingAnimation(
                                      color: Colors.white,
                                    ),
                                  )
                                : BezierChart(
                                    bezierChartScale: BezierChartScale.MONTHLY,
                                    fromDate: model.fromDate,
                                    toDate: model.toDate,
                                    selectedDate: model.toDate,
                                    config: BezierChartConfig(
                                      verticalIndicatorStrokeWidth: 3.0,
                                      verticalIndicatorColor: Colors.black26,
                                      showVerticalIndicator: true,
                                      verticalIndicatorFixedPosition: false,
                                      backgroundColor: Colors.orange,
                                      footerHeight: 30.0,
                                    ),
                                    series: [
                                      BezierLine(
                                        label: "Debet",
                                        lineColor: Colors.green,
                                        onMissingValue: (dateTime) {
                                          return 0.0;
                                        },
                                        data: model.resultDataPointDebet,
                                      ),
                                      BezierLine(
                                        label: "Kredit",
                                        lineColor: Colors.red,
                                        onMissingValue: (dateTime) {
                                          return 0.0;
                                        },
                                        data: model.resultDataPointKredit,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
