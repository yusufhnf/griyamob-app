import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:griyabayar/services/api_service.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/viewmodels/home_viewmodel.dart';
import 'package:griyabayar/views/detail_view.dart';
import 'package:griyabayar/widgets/listtile_title.dart';
import 'package:griyabayar/widgets/loading_animation.dart';
import 'package:griyabayar/widgets/loading_progress.dart';
import 'package:griyabayar/widgets/screen_message.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initial(),
        builder: (context, model, child) => model.isBusy
            ? LoadingAnimation()
            : Scaffold(
                resizeToAvoidBottomPadding: false,
                appBar: AppBar(
                  title: Text("GriyaMobile"),
                  actions: [
                    IconButton(
                      icon: Icon(LineIcons.bell),
                      onPressed: () {
                        Navigator.pushNamed(context, '/notifikasi');
                      },
                      tooltip: "Notifikasi",
                    ),
                  ],
                  elevation: 0.0,
                  backgroundColor: AppStyle.primaryColor,
                ),
                body: RefreshIndicator(
                  onRefresh: model.initial,
                  color: Colors.white,
                  backgroundColor: Colors.orange,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.32,
                                width: double.infinity,
                                padding: AppStyle.screenPadding,
                                decoration: BoxDecoration(
                                  color: AppStyle.primaryColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    model.busy(model.result)
                                        ? Center(
                                            child: LoadingBouncingLine.circle(
                                              backgroundColor: Colors.white,
                                            ),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${model.greeting}, \n${model.namaUser}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 20.0),
                                              ),
                                              SizedBox(height: 20.0),
                                              Text(Strings.labelSaldoAnda,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                              Text(
                                                model.saldo.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30.0),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        .12,
                                    bottom: 15.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: AppStyle.screenPadding,
                                      child: GridView.count(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          childAspectRatio:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.5),
                                          crossAxisCount: 4,
                                          children: model.menuUtamaItem),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: ListTileTitle(
                                        label: "Promo untukmu",
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/promo');
                                        },
                                      ),
                                    ),
                                    Container(
                                        width: double.infinity,
                                        height: 140.0,
                                        child: model.busy(model.promoResult)
                                            ? LoadingProgress()
                                            : model.promoResult.body.isEmpty
                                                ? ScreenMessage(
                                                    label: Strings.noData,
                                                  )
                                                : CarouselSlider.builder(
                                                    itemCount: 4,
                                                    options: CarouselOptions(
                                                      aspectRatio: 16 / 9,
                                                      enlargeCenterPage: true,
                                                      autoPlay: true,
                                                    ),
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Container(
                                                      margin:
                                                          EdgeInsets.all(5.0),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DetailView(
                                                                          datetime: model
                                                                              .promoResult
                                                                              .body[index]
                                                                              .date
                                                                              .toString(),
                                                                          title: model
                                                                              .promoResult
                                                                              .body[index]
                                                                              .judul,
                                                                          detail: model
                                                                              .promoResult
                                                                              .body[index]
                                                                              .detail,
                                                                          image: model.promoResult.body[index].picture == null
                                                                              ? null
                                                                              : "${APIService().url}${model.promoResult.body[index].picture}",
                                                                        )),
                                                          );
                                                        },
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5.0)),
                                                            child: Stack(
                                                              children: <
                                                                  Widget>[
                                                                model
                                                                            .promoResult
                                                                            .body[
                                                                                index]
                                                                            .picture ==
                                                                        null
                                                                    ? Image.asset(
                                                                        Strings
                                                                            .defaultAvatar)
                                                                    : Image.network(
                                                                        "${APIService().url}${model.promoResult.body[index].picture}",
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        width:
                                                                            1000.0),
                                                                Positioned(
                                                                  bottom: 0.0,
                                                                  left: 0.0,
                                                                  right: 0.0,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Color.fromARGB(
                                                                              200,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          Color.fromARGB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0)
                                                                        ],
                                                                        begin: Alignment
                                                                            .bottomCenter,
                                                                        end: Alignment
                                                                            .topCenter,
                                                                      ),
                                                                    ),
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10.0,
                                                                        horizontal:
                                                                            20.0),
                                                                    child: Text(
                                                                      model
                                                                          .promoResult
                                                                          .body[
                                                                              index]
                                                                          .judul,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            20.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    ),
                                                  ))
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .24,
                                  right: 16.0,
                                  left: 16.0),
                              child: Container(
                                height: 110.0,
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 4.0,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: GridView.count(
                                      physics: NeverScrollableScrollPhysics(),
                                      crossAxisSpacing: 2.0,
                                      shrinkWrap: true,
                                      crossAxisCount: 4,
                                      children: model.menuSaldoItem,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ));
  }
}
