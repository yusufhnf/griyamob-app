import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/viewmodels/verification_viewmodel.dart';
import 'package:griyabayar/widgets/bottomsheet_message.dart';
import 'package:griyabayar/widgets/loading_animation.dart';
import 'package:griyabayar/widgets/rounded_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';

class VerificationView extends StatelessWidget {
  VerificationView({this.phoneNumber, this.idUser});
  final String phoneNumber;
  final String idUser;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerificationViewModel>.reactive(
      viewModelBuilder: () => VerificationViewModel(
          context: context, phone: phoneNumber, id: idUser),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => model.isBusy
          ? LoadingAnimation()
          : Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: AppStyle.primaryColor, //change your color here
                ),
                title: Text(
                  "Verifikasi Nomor Telepon",
                  style: TextStyle(color: AppStyle.primaryColor),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              resizeToAvoidBottomPadding: false,
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Kode Verifikasi akan segera dikirim ke Nomor Ponsel anda",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        PinCodeTextField(
                          length: 6,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.fade,
                          cursorColor: Colors.black,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            selectedFillColor: Colors.transparent,
                            selectedColor: Colors.orange,
                            inactiveColor: AppStyle.primaryColor,
                            inactiveFillColor: Colors.transparent,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: true,
                          controller: model.smsCode,
                          onCompleted: (v) {
                            print("Completed");
                          },
                          onChanged: (code) {
                            if (code.length == 6) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            }
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            return true;
                          },
                          appContext: context,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          model.timeTimer.toString(),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tidak menerima kode? ",
                              textAlign: TextAlign.center,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Kirim ulang",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppStyle.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RoundedButton(
                          title: "VERIFIKASI",
                          color: AppStyle.primaryColor,
                          onPress: model.smsCode.text.length < 6
                              ? null
                              : () {
                                  model.onFormSubmitted();
                                  if (model.message != null) {
                                    return BottomSheetMessage(
                                            buttonOnPressed1: () =>
                                                Navigator.of(context).pop(),
                                            image: AppStyle.sadAnimation,
                                            buttonTitle1: "Kembali",
                                            title: "Verifikasi Gagal",
                                            detail: model.message,
                                            context: context)
                                        .displayBottomSheet();
                                  }
                                }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
