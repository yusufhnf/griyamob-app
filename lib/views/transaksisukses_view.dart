import 'package:flutter/material.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:griyabayar/widgets/outline_rounded_button.dart';
import 'package:griyabayar/widgets/rounded_button.dart';
import 'package:line_icons/line_icons.dart';

class TransaksiSuksesView extends StatelessWidget {
  // final String detail, jumlah, saldo;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushNamedAndRemoveUntil(
            context, '/home', (route) => false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppStyle.primaryColor,
          centerTitle: true,
          title: Text("Transaksimu Sukses"),
        ),
        backgroundColor: AppStyle.primaryColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: Icon(
                    LineIcons.check,
                    color: Colors.white,
                    size: 110.0,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Detail:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Pembayaran PDAM Periode Juni 2020"),
                          SizedBox(height: 20.0),
                          Text(
                            "Jumlah:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Rp. 50.000"),
                          SizedBox(height: 20.0),
                          Text(
                            "Sisa Saldo:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Rp. 500.000"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: RoundedButton(
                          title: "BAGIKAN STRUK",
                          color: Colors.white,
                          onPress: () {}),
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      width: double.infinity,
                      child: OutlineRoundedButton(
                          label: "KEMBALI KE HOME",
                          color: Colors.white,
                          onPress: () {}),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
