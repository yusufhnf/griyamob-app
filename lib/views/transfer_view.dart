import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/models/response_model.dart';
import 'package:griyabayar/models/userfull_model.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/utils/validation.dart';
import 'package:griyabayar/viewmodels/transfer_viewmodel.dart';
import 'package:griyabayar/widgets/bottomsheet_message.dart';
import 'package:griyabayar/widgets/loading_animation.dart';
import 'package:griyabayar/widgets/loading_progress.dart';
import 'package:griyabayar/widgets/money_textfield.dart';
import 'package:griyabayar/widgets/rounded_button.dart';
import 'package:griyabayar/widgets/screen_message.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

class TransferView extends StatelessWidget with Validation {
  TransferView({this.isScanQR = false, this.url});
  final StringFormat _format = StringFormat();
  final bool isScanQR;
  final String url;
  final _formKey = GlobalKey<FormState>();
  final _nominalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransferViewModel>.reactive(
      viewModelBuilder: () => TransferViewModel(url: url),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => model.isBusy
          ? LoadingAnimation()
          : Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                title: Text("Transfer"),
                elevation: 0.0,
                backgroundColor: AppStyle.primaryColor,
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
                    flex: 12,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              isScanQR == true
                                  ? SizedBox()
                                  : Column(
                                      children: [
                                        Form(
                                          key: _formKey,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: TextFormField(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) =>
                                                      validatePhone(value),
                                                  controller: model.phoneUser,
                                                  decoration: InputDecoration(
                                                      prefixText: "+62 ",
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.0),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5.0)),
                                                        borderSide: BorderSide(
                                                            color: AppStyle
                                                                .primaryColor),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5.0)),
                                                        borderSide: BorderSide(
                                                            color: AppStyle
                                                                .primaryColor),
                                                      ),
                                                      hintStyle: TextStyle(
                                                          color: AppStyle
                                                              .primaryColor),
                                                      fillColor: Colors.white24,
                                                      hintText:
                                                          "Nomor Telepon (+62)"),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight:
                                                                  Radius
                                                                      .circular(
                                                                          5.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          5.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0))),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12.0),
                                                  onPressed: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    if (_formKey.currentState
                                                        .validate()) {
                                                      model.getUser().then(
                                                          (UserFullModel
                                                              response) {
                                                        if (response.status !=
                                                            0) {
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
                                                                      "Cek Nomor Gagal",
                                                                  detail:
                                                                      "Nomor tidak terdaftar",
                                                                  context:
                                                                      context)
                                                              .displayBottomSheet();
                                                        }
                                                      });
                                                    }
                                                  },
                                                  color: AppStyle.primaryColor,
                                                  child: Icon(
                                                    Icons.search_outlined,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 30.0)
                                      ],
                                    ),
                              model.idUserTarget == null
                                  ? SizedBox()
                                  : model.busy(model.resultUser)
                                      ? LoadingProgress()
                                      : model.resultUser.body.isEmpty
                                          ? ScreenMessage(
                                              image: AppStyle.nodataAnimation,
                                              label: "Tidak ada Pengguna",
                                            )
                                          : Form(
                                              key: _nominalKey,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Transfer Kepada:"),
                                                  SizedBox(
                                                    height: 15.0,
                                                  ),
                                                  Text(
                                                    model.resultUser.body[0]
                                                        .fullname,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppStyle
                                                            .primaryColor),
                                                  ),
                                                  Text(
                                                    "+62" +
                                                        model.resultUser.body[0]
                                                            .phone,
                                                  ),
                                                  SizedBox(
                                                    height: 15.0,
                                                  ),
                                                  Text("Nominal Transfer: "),
                                                  SizedBox(
                                                    height: 15.0,
                                                  ),
                                                  MoneyTextField(
                                                      textColor:
                                                          AppStyle.primaryColor,
                                                      backgroundColor:
                                                          Colors.black12,
                                                      label: Strings
                                                          .labelMasukkanNominal,
                                                      icon: LineIcons.at,
                                                      onChanged: (value) =>
                                                          model.updateNominal(
                                                              value),
                                                      controller:
                                                          model.nominalUser,
                                                      validator: (value) =>
                                                          validateNominal(value,
                                                              model.saldo)),
                                                  SizedBox(
                                                    height: 15.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  model.resultUser == null || model.resultUser.body.isEmpty
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: double.infinity,
                            child: RoundedButton(
                                title: "TRANSFER",
                                color: AppStyle.primaryColor,
                                onPress: model.nominalUser.text.isEmpty
                                    ? null
                                    : () {
                                        if (_nominalKey.currentState
                                            .validate()) {
                                          model
                                              .transfer()
                                              .then((ResponseModel response) {
                                            if (response.status != 0) {
                                              return BottomSheetMessage(
                                                      buttonOnPressed1: () =>
                                                          Navigator.of(context)
                                                              .pop(),
                                                      image: AppStyle
                                                          .paymentFailedAnimation,
                                                      buttonTitle1: "Kembali",
                                                      title: "Transfer Gagal",
                                                      detail: response.body,
                                                      context: context)
                                                  .displayBottomSheet();
                                            } else {
                                              return BottomSheetMessage(
                                                      buttonOnPressed1: () =>
                                                          Navigator
                                                              .pushNamedAndRemoveUntil(
                                                                  context,
                                                                  '/home',
                                                                  (route) =>
                                                                      false),
                                                      buttonTitle1:
                                                          "Kembali ke Home",
                                                      title: "Transfer Sukses",
                                                      image: AppStyle
                                                          .successCheckAnimation,
                                                      detail: response.body,
                                                      context: context)
                                                  .displayBottomSheet();
                                            }
                                          }).catchError((error) {
                                            return BottomSheetMessage(
                                                    buttonOnPressed1: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    buttonTitle1: "Kembali",
                                                    image: AppStyle
                                                        .paymentFailedAnimation,
                                                    title: "Transfer Gagal",
                                                    detail: "Terjadi kesalahan",
                                                    context: context)
                                                .displayBottomSheet();
                                          });
                                        }
                                      }),
                          ),
                        )
                ],
              ),
            ),
    );
  }
}
