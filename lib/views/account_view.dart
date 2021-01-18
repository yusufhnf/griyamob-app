import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/utils/strings.dart';
import 'package:griyabayar/viewmodels/account_viewmodel.dart';
import 'package:griyabayar/views/image_view.dart';
import 'package:griyabayar/views/showqrcode_view.dart';
import 'package:griyabayar/widgets/bottomsheet_message.dart';
import 'package:griyabayar/widgets/loading_progress.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.reactive(
        viewModelBuilder: () => AccountViewModel(),
        onModelReady: (model) => model.initial(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: AppStyle.primaryColor,
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
                title: Text("Akun Saya"),
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
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30)),
                        ),
                        child: model.isBusy || model.nameUser == null
                            ? LoadingProgress(
                                color: Colors.white,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return ImageView(
                                          imageSource: model.avatarPath ??
                                              Strings.defaultAvatar,
                                          isNetwork: model.avatarPath == null
                                              ? false
                                              : true,
                                        );
                                      }));
                                    },
                                    child: Hero(
                                      tag: "viewImage",
                                      child: Container(
                                        margin: EdgeInsets.only(right: 15.0),
                                        height: 90.0,
                                        width: 90.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: model.avatarPath == null
                                                    ? AssetImage(
                                                        Strings.defaultAvatar)
                                                    : NetworkImage(
                                                        model.avatarPath),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        model.nameUser,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                      Text(
                                        "+62${model.phoneUser}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      RaisedButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShowQRCodeView(
                                                        urlUser:
                                                            model.urlBarcode,
                                                        namaUser:
                                                            model.nameUser,
                                                      )),
                                            );
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          color: Colors.white,
                                          icon: Icon(
                                            LineIcons.qrcode,
                                            color: AppStyle.primaryColor,
                                          ),
                                          label: Text(
                                            "QR Code saya",
                                            style: TextStyle(
                                                color: AppStyle.primaryColor),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                      )),
                  Expanded(
                      flex: 8,
                      child: Container(
                        child: ListView(
                          children: [
                            Padding(
                                child: ListTile(
                                  leading: Icon(
                                    LineIcons.info_circle,
                                    color: AppStyle.primaryColor,
                                  ),
                                  title: Text("Kebijakan Privasi"),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/privasi');
                                  },
                                ),
                                padding: EdgeInsets.only(
                                    top: 10, left: 10, right: 10)),
                            Divider(),
                            Padding(
                                child: ListTile(
                                  leading: Icon(LineIcons.sign_out,
                                      color: AppStyle.primaryColor),
                                  title: Text("Keluar"),
                                  onTap: () {
                                    BottomSheetMessage(
                                        context: context,
                                        image: AppStyle.sadAnimation,
                                        title: "Konfirmasi",
                                        detail: "Yakin ingin keluar akun?",
                                        buttonTitle1: "Keluar",
                                        buttonTitle2: "Kembali",
                                        buttonOnPressed1: () {
                                          model.logOutUser();
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              '/landing',
                                              (route) => false);
                                        },
                                        buttonOnPressed2: () {
                                          Navigator.of(context).pop();
                                        }).displayBottomSheetButton();
                                  },
                                ),
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.0)),
                          ],
                        ),
                      ))
                ],
              ),
            ));
  }
}
