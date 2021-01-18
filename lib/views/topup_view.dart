import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/models/response_model.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/utils/validation.dart';
import 'package:griyabayar/viewmodels/topup_viewmodel.dart';
import 'package:griyabayar/widgets/bottomsheet_message.dart';
import 'package:griyabayar/widgets/loading_progress.dart';
import 'package:griyabayar/widgets/money_textfield.dart';
import 'package:griyabayar/widgets/rounded_button.dart';
import 'package:griyabayar/widgets/screen_message.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

class TopUpView extends StatelessWidget with Validation {
  final StringFormat _format = StringFormat();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopUpViewModel>.reactive(
      viewModelBuilder: () => TopUpViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: AppStyle.primaryColor,
          elevation: 0.0,
          title: Text(Strings.titleTopup),
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
                flex: 3,
                child: Container(
                    width: double.infinity,
                    padding: AppStyle.screenPaddingAll,
                    decoration: BoxDecoration(
                      color: AppStyle.primaryColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(30)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          MoneyTextField(
                              label: Strings.labelMasukkanNominal,
                              icon: LineIcons.at,
                              controller: model.nominal,
                              validator: (value) =>
                                  validateNominal(value, model.saldo)),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: RoundedButton(
                                title: Strings.labelTopupButton,
                                color: Colors.white,
                                onPress: () {
                                  if (_formKey.currentState.validate()) {
                                    model
                                        .sendRequest()
                                        .then((ResponseModel response) {
                                      if (response.status != 0) {
                                        return BottomSheetMessage(
                                                buttonOnPressed1: () =>
                                                    Navigator.of(context).pop(),
                                                image: AppStyle
                                                    .paymentFailedAnimation,
                                                buttonTitle1: "Kembali",
                                                title: "Permintaan Gagal",
                                                detail: response.body,
                                                context: context)
                                            .displayBottomSheet();
                                      } else {
                                        model.getAllTopup();
                                        return BottomSheetMessage(
                                                buttonOnPressed1: () => Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        '/home',
                                                        (route) => false),
                                                buttonTitle1: "Kembali ke Home",
                                                title: "Permintaan Sukses",
                                                image: AppStyle
                                                    .successCheckAnimation,
                                                detail: response.body,
                                                context: context)
                                            .displayBottomSheet();
                                      }
                                    }).catchError((error) {
                                      return BottomSheetMessage(
                                              buttonOnPressed1: () =>
                                                  Navigator.of(context).pop(),
                                              buttonTitle1: "Kembali",
                                              image: AppStyle.sadAnimation,
                                              title: "Registrasi Gagal",
                                              detail: "Terjadi kesalahan",
                                              context: context)
                                          .displayBottomSheet();
                                    });
                                  }
                                }),
                          )
                        ],
                      ),
                    ))),
            Expanded(
                flex: 8,
                child: RefreshIndicator(
                  onRefresh: model.initial,
                  color: Colors.white,
                  backgroundColor: Colors.orange,
                  child: Container(
                    child: model.busy(model.topupResult)
                        ? LoadingProgress()
                        : model.topupResult.body.isEmpty
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
                                        itemCount:
                                            model.topupResult.body.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: AppStyle.screenPaddingAll,
                                            child: ListTile(
                                              leading: AppStyle.getIconTopup(
                                                  model.topupResult.body[index]
                                                      .status),
                                              title: Text(
                                                  AppStyle.getStatusTopup(model
                                                      .topupResult
                                                      .body[index]
                                                      .status)),
                                              trailing: Text(
                                                _format.getRupiahCurrency(model
                                                    .topupResult
                                                    .body[index]
                                                    .jumlah),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Text(model
                                                  .topupResult.body[index].waktu
                                                  .toString()
                                                  .substring(0, 16)),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
