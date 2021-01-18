import 'package:flutter/material.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/models/inquiry_model.dart';
import 'package:griyabayar/models/response_model.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/viewmodels/pdam_viewmodel.dart';
import 'package:griyabayar/widgets/bottomsheet_message.dart';
import 'package:griyabayar/widgets/custom_dropdown.dart';
import 'package:griyabayar/widgets/loading_animation.dart';
import 'package:griyabayar/widgets/rounded_button.dart';
import 'package:stacked/stacked.dart';

class PDAMView extends StatelessWidget {
  final StringFormat _format = StringFormat();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PdamViewModel>.reactive(
      viewModelBuilder: () => PdamViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => model.busy(model.resultPDAM) ||
              model.isBusy
          ? LoadingAnimation()
          : Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                backgroundColor: AppStyle.primaryColor,
                elevation: 0.0,
                title: Text("PDAM"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Row(
                      children: [
                        Icon(Icons.account_balance_wallet_outlined),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          _format.getRupiahCurrency(model.saldo),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: model.busy(model.resultPDAM)
                          ? LoadingAnimation(
                              color: Colors.white,
                            )
                          : Container(
                              width: double.infinity,
                              padding: AppStyle.screenPaddingAll,
                              decoration: BoxDecoration(
                                color: AppStyle.primaryColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(30)),
                              ),
                              child: Column(
                                children: [
                                  CustomDropdown(
                                      onChanged: (value) {
                                        model.onItemChanged(value);
                                      },
                                      label: model.namaPDAM ?? "Lokasi PDAM",
                                      listBuilder: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return Divider();
                                          },
                                          shrinkWrap: true,
                                          itemCount:
                                              model.newResultPDAM.body.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                model.kodePDAM = model
                                                    .newResultPDAM
                                                    .body[index]
                                                    .idpdam;
                                                model.setPDAM(model
                                                    .newResultPDAM
                                                    .body[index]
                                                    .namapdam);
                                                Navigator.of(context).pop();
                                              },
                                              title: Text(model.newResultPDAM
                                                  .body[index].namapdam),
                                            );
                                          })),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) =>
                                        model.onNopelChanged(value),
                                    controller: model.nopel,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        fillColor: Colors.white24,
                                        hintText: "Nomor Pelanggan"),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: RoundedButton(
                                        title: "CEK TAGIHAN",
                                        color: Colors.white,
                                        onPress: model.kodePDAM == null ||
                                                model.nopel.text.isEmpty
                                            ? null
                                            : () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                model.getInquiry().then(
                                                    (InquiryModel result) {
                                                  if (result.status != '0000') {
                                                    return BottomSheetMessage(
                                                            buttonOnPressed1: () =>
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(),
                                                            image: AppStyle
                                                                .paymentFailedAnimation,
                                                            buttonTitle1:
                                                                "Kembali",
                                                            title:
                                                                "Cek Tagihan Gagal",
                                                            detail: result
                                                                .errorMessage,
                                                            context: context)
                                                        .displayBottomSheet();
                                                  }
                                                });
                                              }),
                                  )
                                ],
                              ))),
                  Expanded(
                      flex: 6,
                      child: Container(
                        child: model.namaPelanggan == null
                            ? SizedBox()
                            : ListView(
                                shrinkWrap: true,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(model.namaPelanggan),
                                          subtitle: Text(
                                              "${model.nopel.text} - ${model.namaPDAM}"),
                                        ),
                                        SizedBox(height: 5.0),
                                        ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: model
                                                .resultInquiry.tagihan.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Card(
                                                  color: Colors.white,
                                                  elevation: 4.0,
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text("Periode"),
                                                              Text(
                                                                _format.convertPeriode(model
                                                                    .resultInquiry
                                                                    .tagihan[
                                                                        index]
                                                                    .periode),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 5.0),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text("Pemakaian"),
                                                              Text(
                                                                _format.getRupiahCurrency(model
                                                                    .resultInquiry
                                                                    .tagihan[
                                                                        index]
                                                                    .pemakaian),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 5.0),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "Harga Air:"),
                                                              Text(
                                                                _format.getRupiahCurrency(model
                                                                    .resultInquiry
                                                                    .tagihan[
                                                                        index]
                                                                    .hargaAir),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 5.0),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "Biaya Admin:"),
                                                              Text(
                                                                _format.getRupiahCurrency(model
                                                                    .resultInquiry
                                                                    .tagihan[
                                                                        index]
                                                                    .biayaAdmin),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 5.0),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "Total Tagihan"),
                                                              Text(
                                                                _format.getRupiahCurrency(model
                                                                    .resultInquiry
                                                                    .tagihan[
                                                                        index]
                                                                    .total),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .red),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      )),
                  model.namaPelanggan == null
                      ? SizedBox()
                      : Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total:"),
                                    Text(
                                      _format.getRupiahCurrency(
                                          model.totalInquiry),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 27.0,
                                          color: AppStyle.primaryColor),
                                    )
                                  ],
                                ),
                                RoundedButton(
                                    title: "Bayar",
                                    color: AppStyle.primaryColor,
                                    onPress: () {
                                      model
                                          .getPaymentAdvice()
                                          .then((ResponseModel result) {
                                        if (result.status != 0) {
                                          return BottomSheetMessage(
                                                  buttonOnPressed1: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  image: AppStyle
                                                      .paymentFailedAnimation,
                                                  buttonTitle1: "Kembali",
                                                  title: "Pembayaran Gagal",
                                                  detail: result.body,
                                                  context: context)
                                              .displayBottomSheet();
                                        } else {
                                          return BottomSheetMessage(
                                                  buttonOnPressed1: () => Navigator
                                                      .pushNamedAndRemoveUntil(
                                                          context,
                                                          '/home',
                                                          (route) => false),
                                                  buttonTitle1:
                                                      "Kembali ke Home",
                                                  title: "Pembayaran Sukses",
                                                  image: AppStyle
                                                      .successCheckAnimation,
                                                  detail: result.body,
                                                  context: context)
                                              .displayBottomSheet();
                                          /* Navigator.pushNamedAndRemoveUntil(context,
                                          '/transaksisukses', (route) => false); */
                                        }
                                      });
                                    })
                              ],
                            ),
                          ))
                ],
              ),
            ),
    );
  }
}
