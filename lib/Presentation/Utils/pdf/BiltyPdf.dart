import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'BiltyPdf.g.dart';

@riverpod
Future<File?> createBiltyPdf(CreateBiltyPdfRef ref,
    {required BuildContext context}) async {
  final pdf = pw.Document();
  final img = await rootBundle.load('assets/logo.png');
  final imageBytes = img.buffer.asUint8List();
  var hindiFont = await rootBundle.load('assets/fonts/Hind-Bold.ttf');
  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a3,
      build: (pw.Context buildContext) {
        return pw.Container(
          decoration: pw.BoxDecoration(border: pw.Border.all()),
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                    decoration: pw.BoxDecoration(border: pw.Border.all()),
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Center(
                              child: pw.Text("Bilty",
                                  style: pw.TextStyle(
                                      fontSize: Adaptive.sp(14),
                                      fontWeight: pw.FontWeight.normal))),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Center(
                              child: pw.Text("Ramkaran",
                                  style: pw.TextStyle(
                                      fontSize: Adaptive.sp(21),
                                      fontWeight: pw.FontWeight.bold))),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Center(
                              child: pw.Text("Contact No. : 9814141414",
                                  style: pw.TextStyle(
                                      fontSize: Adaptive.sp(14),
                                      fontWeight: pw.FontWeight.normal))),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Center(
                              child: pw.Text("हेड ऑिफस : morija Road Chomu",
                                  style: pw.TextStyle(
                                      font: pw.Font.ttf(hindiFont),
                                      fontSize: Adaptive.sp(14),
                                      fontWeight: pw.FontWeight.normal))),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Padding(
                              padding: pw.EdgeInsets.all(10),
                              child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Row(
                                      mainAxisSize: pw.MainAxisSize.min,
                                      children: [
                                        pw.Text("Bill NO.",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.Text(" 1002",
                                            style: pw.TextStyle(
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.normal))
                                      ]),
                                  pw.Row(
                                      mainAxisSize: pw.MainAxisSize.min,
                                      children: [
                                        pw.Text("तारीख :",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.Text(" 27/08/2024",
                                            style: pw.TextStyle(
                                                decoration:
                                                    pw.TextDecoration.underline,
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.normal))
                                      ]),
                                ],
                              )),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Padding(
                              padding: pw.EdgeInsets.symmetric(horizontal: 10),
                              child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Row(
                                      mainAxisSize: pw.MainAxisSize.min,
                                      children: [
                                        pw.Text("ड्राइवर का नाम:",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(16),
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.Text(" Pritam kumar(9881234567)",
                                            style: pw.TextStyle(
                                                decoration:
                                                    pw.TextDecoration.underline,
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(16),
                                                fontWeight:
                                                    pw.FontWeight.normal))
                                      ]),
                                  pw.Row(
                                      mainAxisSize: pw.MainAxisSize.min,
                                      children: [
                                        pw.Text("ड्रक नंबर:",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(16),
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.Text(" RJ14BT3060",
                                            style: pw.TextStyle(
                                                decoration:
                                                    pw.TextDecoration.underline,
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(16),
                                                fontWeight:
                                                    pw.FontWeight.normal))
                                      ]),
                                  pw.Row(
                                      mainAxisSize: pw.MainAxisSize.min,
                                      children: [
                                        pw.Text("माल की कीमत:",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(16),
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.Text(" 120000",
                                            style: pw.TextStyle(
                                                decoration:
                                                    pw.TextDecoration.underline,
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(16),
                                                fontWeight:
                                                    pw.FontWeight.normal))
                                      ]),
                                ],
                              )),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                  child: pw.Container(
                                      alignment: pw.Alignment.topLeft,
                                      height: 140,
                                      padding: pw.EdgeInsets.all(20),
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      child: pw.Column(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text("From",
                                                textAlign: pw.TextAlign.start,
                                                style: pw.TextStyle(
                                                    font:
                                                        pw.Font.ttf(hindiFont),
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        pw.FontWeight.bold)),
                                            pw.Text(
                                                "R K WarehouseAAU-Jodhpur-1,Khasra No.2051/28, KrishnaNagar, Shri KrishanNagar",
                                                style: pw.TextStyle(
                                                    font:
                                                        pw.Font.ttf(hindiFont),
                                                    fontSize: Adaptive.sp(16),
                                                    fontWeight:
                                                        pw.FontWeight.normal)),
                                          ]))),
                              // pw.SizedBox(width: 10),
                              // pw.Expanded(
                              //     child: pw.Column(
                              //         crossAxisAlignment:
                              //             pw.CrossAxisAlignment.center,
                              //         children: [
                              //       pw.Text(
                              //           "भेजने वाले का नाम : R K Warehouse Chomu(9874563219)",
                              //           textAlign: pw.TextAlign.center,
                              //           style: pw.TextStyle(
                              //               font: pw.Font.ttf(hindiFont),
                              //               fontSize: Adaptive.sp(16),
                              //               fontWeight: pw.FontWeight.normal)),
                              //       pw.Text(
                              //           "पाने वाले का नाम : Monika(2589632589)",
                              //           textAlign: pw.TextAlign.center,
                              //           style: pw.TextStyle(
                              //               font: pw.Font.ttf(hindiFont),
                              //               fontSize: Adaptive.sp(16),
                              //               fontWeight: pw.FontWeight.normal)),
                              //     ])),
                              pw.Expanded(
                                  child: pw.Container(
                                      height: 140,
                                      padding: pw.EdgeInsets.all(20),
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      child: pw.Column(
                                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                                          children: [
                                        pw.Text("To",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.Text(
                                            "Netaji Subhash Marg,Chandni Chowk, New Delhi",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(16),
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ])))
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                  child: pw.Container(
                                      alignment: pw.Alignment.center,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      padding: pw.EdgeInsets.all(20),
                                      child: pw.Text("माल का विवरण",
                                          style: pw.TextStyle(
                                              font: pw.Font.ttf(hindiFont),
                                              fontSize: Adaptive.sp(14),
                                              fontWeight:
                                                  pw.FontWeight.normal)))),
                              pw.Expanded(
                                  child: pw.Container(
                                      alignment: pw.Alignment.center,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      padding: pw.EdgeInsets.all(20),
                                      child: pw.Text("वजन क्विंटल",
                                          style: pw.TextStyle(
                                              font: pw.Font.ttf(hindiFont),
                                              fontSize: Adaptive.sp(14),
                                              fontWeight:
                                                  pw.FontWeight.normal)))),
                              pw.Expanded(
                                  child: pw.Container(
                                      alignment: pw.Alignment.center,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      padding: pw.EdgeInsets.all(20),
                                      child: pw.Text("कुल बैग",
                                          style: pw.TextStyle(
                                              font: pw.Font.ttf(hindiFont),
                                              fontSize: Adaptive.sp(14),
                                              fontWeight:
                                                  pw.FontWeight.normal)))),
                              pw.Expanded(
                                  child: pw.Container(
                                      alignment: pw.Alignment.center,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      padding: pw.EdgeInsets.all(20),
                                      child: pw.Text("दर (Rs./Qtl.) ",
                                          style: pw.TextStyle(
                                              font: pw.Font.ttf(hindiFont),
                                              fontSize: Adaptive.sp(14),
                                              fontWeight:
                                                  pw.FontWeight.normal)))),
                              pw.Expanded(
                                  child: pw.Container(
                                      alignment: pw.Alignment.center,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      padding: pw.EdgeInsets.all(20),
                                      child: pw.Text("िकराया",
                                          style: pw.TextStyle(
                                              font: pw.Font.ttf(hindiFont),
                                              fontSize: Adaptive.sp(14),
                                              fontWeight:
                                                  pw.FontWeight.normal)))),
                              pw.Expanded(
                                  child: pw.Container(
                                      alignment: pw.Alignment.center,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      padding: pw.EdgeInsets.all(20),
                                      child: pw.Text("एडवांस",
                                          style: pw.TextStyle(
                                              font: pw.Font.ttf(hindiFont),
                                              fontSize: Adaptive.sp(14),
                                              fontWeight:
                                                  pw.FontWeight.normal)))),
                              pw.Expanded(
                                  child: pw.Container(
                                      alignment: pw.Alignment.center,
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all()),
                                      padding: pw.EdgeInsets.all(20),
                                      child: pw.Text("बकाया",
                                          style: pw.TextStyle(
                                              font: pw.Font.ttf(hindiFont),
                                              fontSize: Adaptive.sp(14),
                                              fontWeight:
                                                  pw.FontWeight.normal))))
                            ],
                          ),
                          pw.Container(
                            height: MediaQuery.of(context).size.height / 1.1,
                            child: pw.Row(
                              children: [
                                pw.Expanded(
                                    child: pw.Container(
                                        alignment: pw.Alignment.center,
                                        decoration: pw.BoxDecoration(
                                            border: pw.Border.all()),
                                        padding: pw.EdgeInsets.all(20),
                                        child: pw.Text("",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.normal)))),
                                pw.Expanded(
                                    child: pw.Container(
                                        alignment: pw.Alignment.center,
                                        decoration: pw.BoxDecoration(
                                            border: pw.Border.all()),
                                        padding: pw.EdgeInsets.all(20),
                                        child: pw.Text("",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.normal)))),
                                pw.Expanded(
                                    child: pw.Container(
                                        alignment: pw.Alignment.center,
                                        decoration: pw.BoxDecoration(
                                            border: pw.Border.all()),
                                        padding: pw.EdgeInsets.all(20),
                                        child: pw.Text("",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.normal)))),
                                pw.Expanded(
                                    child: pw.Container(
                                        alignment: pw.Alignment.center,
                                        decoration: pw.BoxDecoration(
                                            border: pw.Border.all()),
                                        padding: pw.EdgeInsets.all(20),
                                        child: pw.Text("",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.normal)))),
                                pw.Expanded(
                                    child: pw.Container(
                                        alignment: pw.Alignment.center,
                                        decoration: pw.BoxDecoration(
                                            border: pw.Border.all()),
                                        padding: pw.EdgeInsets.all(20),
                                        child: pw.Text("",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.normal)))),
                                pw.Expanded(
                                    child: pw.Container(
                                        alignment: pw.Alignment.center,
                                        decoration: pw.BoxDecoration(
                                            border: pw.Border.all()),
                                        padding: pw.EdgeInsets.all(20),
                                        child: pw.Text("",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.normal)))),
                                pw.Expanded(
                                    child: pw.Container(
                                        alignment: pw.Alignment.center,
                                        decoration: pw.BoxDecoration(
                                            border: pw.Border.all()),
                                        padding: pw.EdgeInsets.all(20),
                                        child: pw.Text("",
                                            style: pw.TextStyle(
                                                font: pw.Font.ttf(hindiFont),
                                                fontSize: Adaptive.sp(14),
                                                fontWeight:
                                                    pw.FontWeight.normal))))
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Container(
                            width: MediaQuery.of(context).size.width,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text("नोट:",
                                      style: pw.TextStyle(
                                          font: pw.Font.ttf(hindiFont),
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: pw.FontWeight.normal)),
                                  pw.Text(
                                      "1 : यह दस्तावेज़ डिजिटल रूप से बनाया गया है और इसमें हस्ताक्षर की कोई आवश्यकता नहीं है",
                                      style: pw.TextStyle(
                                          font: pw.Font.ttf(hindiFont),
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: pw.FontWeight.normal)),
                                  pw.Text(
                                      "2 : जब तक किराया नहीं दिया जाएगा, स्टॉक वितरित नहीं किया जाएगा",
                                      style: pw.TextStyle(
                                          font: pw.Font.ttf(hindiFont),
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: pw.FontWeight.normal)),
                                  pw.Text(
                                      "3 : सभी विवादों के लिए न्याय स्थान जयपुर होगा",
                                      style: pw.TextStyle(
                                          font: pw.Font.ttf(hindiFont),
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: pw.FontWeight.normal)),
                                  pw.Text(
                                      "4 : माल के बीमा की जिम्मेदारी पार्टी की होगी",
                                      style: pw.TextStyle(
                                          font: pw.Font.ttf(hindiFont),
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: pw.FontWeight.normal))
                                ]),
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceEvenly,
                              children: [
                                pw.Text("ह. ममालिक / ड्राइवर ",
                                    style: pw.TextStyle(
                                        font: pw.Font.ttf(hindiFont),
                                        fontSize: Adaptive.sp(14),
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text("ह. भेजने वाला ",
                                    style: pw.TextStyle(
                                        font: pw.Font.ttf(hindiFont),
                                        fontSize: Adaptive.sp(14),
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text("ह. मैनेजर",
                                    style: pw.TextStyle(
                                        font: pw.Font.ttf(hindiFont),
                                        fontSize: Adaptive.sp(14),
                                        fontWeight: pw.FontWeight.normal)),
                              ])
                        ]),
                    alignment: pw.Alignment.center),
              ]),
        ); // Center
      }));
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  var filePath = '${appDocumentsDir.path}/agreement.pdf';
  var file = File(filePath);
  await file.writeAsBytes(await pdf.save());

  //context.goNamed(RoutesStrings.profile);

  return file;
}
