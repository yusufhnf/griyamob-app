import 'package:flutter/material.dart';
import 'package:griyabayar/models/response_model.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/utils/validation.dart';
import 'package:griyabayar/viewmodels/register_viewmodel.dart';
import 'package:griyabayar/widgets/bottomsheet_message.dart';
import 'package:griyabayar/widgets/loading_animation.dart';
import 'package:griyabayar/widgets/rounded_button.dart';
import 'package:griyabayar/widgets/rounded_textfield.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatelessWidget with Validation {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
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
                    Strings.labelRegister,
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
                          top: MediaQuery.of(context).size.height - 390,
                          left: MediaQuery.of(context).size.width - 280,
                          child: Image.asset(
                            Strings.registerPic,
                            scale: 1.5,
                          )),
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RoundedTextField(
                                    label: "Nama Lengkap",
                                    controller: model.fullnameUser,
                                    icon: LineIcons.user,
                                    validator: (value) => validateName(value),
                                    obsecureText: false),
                                SizedBox(height: 15.0),
                                RoundedTextField(
                                    label: "Nomor Telepon",
                                    controller: model.phoneUser,
                                    prefixText: "+62 ",
                                    inputType: TextInputType.number,
                                    validator: (value) => validatePhone(value),
                                    obsecureText: false),
                                SizedBox(height: 15.0),
                                RoundedTextField(
                                    label: "Email",
                                    controller: model.emailUser,
                                    icon: LineIcons.at,
                                    inputType: TextInputType.emailAddress,
                                    validator: (value) => validateEmail(value),
                                    obsecureText: false),
                                SizedBox(height: 15.0),
                                RoundedTextField(
                                    label: "Password",
                                    controller: model.passUser,
                                    icon: LineIcons.lock,
                                    validator: (value) =>
                                        validatePassword(value),
                                    obsecureText: true),
                                SizedBox(height: 30.0),
                                SizedBox(
                                  width: double.infinity,
                                  child: RoundedButton(
                                      title: "Daftar",
                                      color: AppStyle.primaryColor,
                                      onPress: () async {
                                        FocusScope.of(context).unfocus();
                                        if (_formKey.currentState.validate()) {
                                          model
                                              .register()
                                              .then((ResponseModel response) {
                                            if (response.status != 0) {
                                              return BottomSheetMessage(
                                                      buttonOnPressed1: () =>
                                                          Navigator.of(context)
                                                              .pop(),
                                                      image:
                                                          AppStyle.sadAnimation,
                                                      buttonTitle1: "Kembali",
                                                      title: "Registrasi Gagal",
                                                      detail: response.body,
                                                      context: context)
                                                  .displayBottomSheet();
                                            } else {
                                              return BottomSheetMessage(
                                                      buttonOnPressed1: () =>
                                                          Navigator
                                                              .pushNamedAndRemoveUntil(
                                                                  context,
                                                                  '/landing',
                                                                  (route) =>
                                                                      false),
                                                      buttonTitle1:
                                                          "Kembali ke Halaman Awal",
                                                      title:
                                                          "Registrasi Sukses",
                                                      image: AppStyle
                                                          .successCheckListAnimation,
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
                                                    image:
                                                        AppStyle.sadAnimation,
                                                    title: "Registrasi Gagal",
                                                    detail: "Terjadi kesalahan",
                                                    context: context)
                                                .displayBottomSheet();
                                          });

                                          /* return AlertShow(
                                        context: context,
                                        image: AppStyle.success,
                                        title: "Registrasi Sukses",
                                        detail:
                                            "Silakan masuk menggunakan akun anda",
                                        button: [
                                          DialogButton(
                                            child: Text(
                                              "Kembali ke Login",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            color: AppStyle.primaryColor,
                                          ),
                                        ]).showAlertPopup(); */
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
