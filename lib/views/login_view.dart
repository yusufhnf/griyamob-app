import 'package:flutter/material.dart';
import 'package:griyabayar/models/login_model.dart';
import 'package:griyabayar/viewmodels/login_viewmodel.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/utils/validation.dart';
import 'package:griyabayar/views/verification_view.dart';
import 'package:griyabayar/widgets/bottomsheet_message.dart';
import 'package:griyabayar/widgets/loading_animation.dart';
import 'package:griyabayar/widgets/rounded_button.dart';
import 'package:griyabayar/widgets/rounded_textfield.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget with Validation {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (model) => null,
        builder: (context, model, child) => model.isBusy
            ? LoadingAnimation()
            : Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: AppStyle.primaryColor, //change your color here
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  centerTitle: true,
                  title: Text(
                    Strings.titleLogin,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppStyle.primaryColor),
                  ),
                ),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                          top: MediaQuery.of(context).size.height - 350,
                          left: MediaQuery.of(context).size.width - 320,
                          child: Image.asset(
                            Strings.loginPic,
                            scale: 6.0,
                          )),
                      SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(Strings.loginSubtitle,
                                  style: AppStyle.thinH2Dark),
                              SizedBox(height: 30.0),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    RoundedTextField(
                                        inputType: TextInputType.emailAddress,
                                        label: Strings.labelEmail,
                                        icon: LineIcons.at,
                                        controller: model.emailUser,
                                        validator: (value) =>
                                            validateEmail(value),
                                        obsecureText: false),
                                    SizedBox(height: 15.0),
                                    RoundedTextField(
                                        inputType: TextInputType.text,
                                        label: Strings.labelPassword,
                                        controller: model.passUser,
                                        validator: validatePassword,
                                        icon: LineIcons.lock,
                                        obsecureText: true),
                                    SizedBox(height: 30.0),
                                    SizedBox(
                                      width: double.infinity,
                                      child: RoundedButton(
                                          title: Strings.labelLogin,
                                          color: AppStyle.primaryColor,
                                          onPress: () {
                                            FocusScope.of(context).unfocus();
                                            if (_formKey.currentState
                                                .validate()) {
                                              model.login().then(
                                                  (LoginModel response) async {
                                                if (response.status != 0) {
                                                  if (response.status == 1000) {
                                                    return BottomSheetMessage(
                                                            buttonOnPressed1:
                                                                () => Navigator
                                                                        .of(
                                                                            context)
                                                                    .pop(),
                                                            image: AppStyle
                                                                .sadAnimation,
                                                            buttonTitle1:
                                                                "Kembali",
                                                            title:
                                                                "Login Gagal",
                                                            detail:
                                                                "Email/Password Salah",
                                                            context: context)
                                                        .displayBottomSheet();
                                                  } else {
                                                    return BottomSheetMessage(
                                                            buttonOnPressed1:
                                                                () => Navigator
                                                                        .of(
                                                                            context)
                                                                    .pop(),
                                                            image: AppStyle
                                                                .sadAnimation,
                                                            buttonTitle1:
                                                                "Kembali",
                                                            title:
                                                                "Login Gagal",
                                                            detail:
                                                                "Pengguna belum terdaftar",
                                                            context: context)
                                                        .displayBottomSheet();
                                                  }
                                                } else {
                                                  /* await UserSharedPreference
                                                .setUser(response.body
                                                    .toString());
                                            Navigator
                                                .pushNamedAndRemoveUntil(
                                                    context,
                                                    '/home',
                                                    (route) => false); */
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            VerificationView(
                                                              phoneNumber:
                                                                  response
                                                                      .body[0]
                                                                      .phone,
                                                              idUser: response
                                                                  .body[0]
                                                                  .idusers
                                                                  .toString(),
                                                            )),
                                                  );
                                                }
                                              }).catchError((error) {
                                                return BottomSheetMessage(
                                                        buttonOnPressed1: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(),
                                                        buttonTitle1: "Kembali",
                                                        image: AppStyle
                                                            .sadAnimation,
                                                        title: "Login Gagal",
                                                        detail:
                                                            "Terjadi kesalahan",
                                                        context: context)
                                                    .displayBottomSheet();
                                              });
                                            }
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
