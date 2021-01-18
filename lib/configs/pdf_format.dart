import 'dart:io';
import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFFormat {
  PDFFormat(
      {this.context,
      this.nomorpelanggan,
      this.nama,
      this.alamat,
      this.golongan,
      this.noref,
      this.periode,
      this.hargaair,
      this.admin,
      this.detail,
      this.denda,
      this.terbilang,
      this.total});
  String nomorpelanggan,
      nama,
      alamat,
      golongan,
      noref,
      detail,
      periode,
      hargaair,
      admin,
      denda,
      total;
  int terbilang;

  var dir;

  BuildContext context;
  final doc = pw.Document();

  void pdfKuitansiPDAM() async {
    doc.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(children: [
                      // pw.Image(image, height: 80.0, width: 80.0),
                      pw.Text("BUKTI PEMBAYARAN",
                          style: pw.TextStyle(
                              fontSize: 24.0, fontWeight: pw.FontWeight.bold)),
                    ]),
                    pw.Divider(),
                    pw.SizedBox(height: 30.0),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Nomor Pelanggan",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(nomorpelanggan)
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Nama",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(nama)
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Alamat",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(alamat)
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Golongan",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(golongan)
                        ]),
                    pw.Text("DETAIL",
                        style: pw.TextStyle(
                            fontSize: 18.0, fontWeight: pw.FontWeight.bold)),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Noref",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(noref)
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Periode",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(periode)
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Harga Air",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(hargaair)
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Biaya Admin",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(admin)
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Denda",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(denda)
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Total",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(total)
                        ]),
                  ])),
    );

    final file = File('$noref.pdf');
    file.writeAsBytesSync(doc.save());
  }

  Future pdfKuitansi() async {
    var numerik = Numerik(terbilang);
    dir = await getTemporaryDirectory();

    doc.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(children: [
                      // pw.Image(image, height: 80.0, width: 80.0),
                      pw.Text("BUKTI PEMBAYARAN",
                          style: pw.TextStyle(
                              fontSize: 24.0, fontWeight: pw.FontWeight.bold)),
                    ]),
                    pw.Divider(),
                    pw.SizedBox(height: 30.0),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Noref",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(noref ?? "Loading")
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Detail",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(detail ?? "Loading")
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Tanggal",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(periode ?? "Loading")
                        ]),
                    pw.SizedBox(height: 30.0),
                    pw.Text("Detail",
                        style: pw.TextStyle(
                            fontSize: 18.0, fontWeight: pw.FontWeight.bold)),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Jumlah",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(total ?? "Loading")
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Terbilang",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(
                              numerik.terbilang().toUpperCase() + " RUPIAH" ??
                                  "Loading")
                        ]),
                  ])),
    );
    final file = File('${dir.path}/$noref.pdf');
    await file.writeAsBytes(doc.save());
    await Printing.sharePdf(bytes: doc.save(), filename: '$noref.pdf');
  }
}
