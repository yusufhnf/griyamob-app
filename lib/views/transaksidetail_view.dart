import 'package:flutter/material.dart';
import 'package:griyabayar/configs/pdf_format.dart';
import 'package:griyabayar/configs/string_format.dart';
import 'package:griyabayar/utils/app_style.dart';
import 'package:line_icons/line_icons.dart';

class TransaksiDetailView extends StatelessWidget {
  TransaksiDetailView(
      {this.title,
      this.detail,
      this.jumlah,
      this.tanggal,
      this.noref,
      this.action});
  final String title, detail, tanggal, noref, action;
  final int jumlah;
  final StringFormat _format = StringFormat();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppStyle.primaryColor,
        elevation: 0.0,
        title: Text("Detail Transaksi"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: AppStyle.screenPaddingAll,
            child: Column(
              children: [
                ListTile(
                  title: Text(title),
                  subtitle: Text(detail),
                  leading: CircleAvatar(
                    backgroundColor: AppStyle.primaryColor,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text("Jumlah"),
                  trailing: Text(
                    _format.getRupiahCurrency(jumlah),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: action == "D" ? Colors.green : Colors.red),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text("Tanggal Transaksi"),
                  trailing: Text(
                    _format.convertTimeStamp(tanggal),
                    textAlign: TextAlign.right,
                  ),
                ),
                ListTile(
                  title: Text("Noref"),
                  trailing: Text(
                    noref,
                    textAlign: TextAlign.right,
                  ),
                ),
                ListTile(
                  title: Text("Bagikan Bukti\nTransaksi"),
                  trailing: OutlineButton.icon(
                      onPressed: () async {
                        await PDFFormat(
                                context: context,
                                noref: noref,
                                detail: title + " - " + detail,
                                periode: tanggal,
                                terbilang: jumlah,
                                total: _format.getRupiahCurrency(jumlah))
                            .pdfKuitansi();
                      },
                      textColor: Colors.green,
                      borderSide: BorderSide(color: Colors.green),
                      icon: Icon(LineIcons.share_square_o),
                      label: Text("Bagikan")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
