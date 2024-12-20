import 'dart:convert';
import 'dart:io';

import 'package:apnagodam_driver/Domain/Trip/TripService.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Routes/routes.dart';
import '../../Utils/Widgets/Widgets.dart';
import '../../Utils/color_constants.dart';
import '../../Utils/pdf/BiltyPdf.dart';
import '../Authentication/LoginScreen.dart';
import 'Dashboard.dart';

class Tripsinprocess extends ConsumerStatefulWidget {
  const Tripsinprocess({super.key});

  @override
  ConsumerState<Tripsinprocess> createState() => _TripsinprocessState();
}

class _TripsinprocessState extends ConsumerState<Tripsinprocess> {
  final bagsController = TextEditingController();
  final weightController = TextEditingController();
  final imagePicker = ImagePicker();
  var kantaImage = StateProvider<File?>((ref) => null);
  var qualityImage = StateProvider<File?>((ref) => null);
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tripsInProcess'.tr()),
      ),
      body: SafeArea(
          child: RefreshIndicator.adaptive(
              child: ListView(
                children: [
                  ref.watch(tripsProvider).when(
                      data: (data) {
                        var dataList = data.data
                            ?.where((element) =>
                                element.tripStart == null ||
                                element.tripEnd == null)
                            .toList();
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dataList?.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const Pad(all: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            ColorConstants.primaryColorDriver),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const Pad(all: 10),
                                  child: ColumnSuper(
                                      alignment: Alignment.center,
                                      children: [
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Padding(
                                                padding: const Pad(all: 10),
                                                child: Text(
                                                  'tripId'.tr() +
                                                      ': ${dataList![index].tripId ?? "--"}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Adaptive.sp(16),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),

                                        const Divider(
                                          height: 2,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(fill: true, children: [
                                          Text(
                                            'from'.tr(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Text(
                                            '${dataList[index].fromAddress}',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        RowSuper(fill: true, children: [
                                          Text(
                                            'to'.tr(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Text(
                                            '${dataList[index].toAddress}',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        RowSuper(fill: true, children: [
                                          Text(
                                            'transporterName'.tr(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Text(
                                            '${dataList[index].transporterName}',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(fill: true, children: [
                                          Text(
                                            'transporterPhone'.tr(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Text(
                                            '${dataList[index].transporterPhone}',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                'customer'.tr(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${dataList[index].userName}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                'customerPhone'.tr(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${dataList[index].userPhone}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                'ratePerQtl'.tr(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${currencyFormat.format(int.parse("${dataList[index].rate ?? 0}"))} /' +
                                                    "perQtl".tr(),
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                'commodity'.tr(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${dataList[index].commodity}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                'finalWeight'.tr(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${dataList[index].weight ?? "pending".tr()}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                'finalNoOfBags'.tr(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${dataList[index].noOfBags ?? "pending".tr()}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                'receivingWeight'.tr(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${dataList[index].recevingBags ?? "pending".tr()}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                'receivingBags'.tr(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${dataList[index].recevingBags ?? "pending".tr()}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                'biltyImage'.tr(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              ref.watch(isLoading)
                                                  ? const CupertinoActivityIndicator()
                                                  : Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: InkWell(
                                                        onTap: () async {
                                                          showLoader(context);
                                                          ref
                                                              .watch(tripDataProvider(
                                                                      tripRequestid:
                                                                          dataList[index].id ??
                                                                              "")
                                                                  .future)
                                                              .then((value) {
                                                            ref
                                                                .watch(createBiltyPdfProvider(
                                                                        context:
                                                                            context,
                                                                        model:
                                                                            value)
                                                                    .future)
                                                                .then(
                                                                    (value) async {
                                                              hideLoader(
                                                                  context);

                                                              if (value !=
                                                                  null) {
                                                                PDFDocument
                                                                    doc =
                                                                    await PDFDocument.fromFile(
                                                                        value ??
                                                                            File(''));
                                                                showBarModalBottomSheet(
                                                                    context:
                                                                        context,
                                                                    builder: (context) =>
                                                                        PDFViewer(
                                                                            document:
                                                                                doc));
                                                              }
                                                            }).onError((e, s) {
                                                              hideLoader(
                                                                  context);
                                                            });
                                                          }).onError((e, s) {
                                                            hideLoader(context);
                                                          });
                                                        },
                                                        child: const Icon(
                                                          CupertinoIcons.eye,
                                                          color: ColorConstants
                                                              .primaryColorDriver,
                                                        ),
                                                      ),
                                                    )
                                            ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // RowSuper(
                                        //     fill: true,
                                        //     alignment: Alignment.center,
                                        //     children: [
                                        //       Text(
                                        //         'Goods Invoice Image',
                                        //         textAlign: TextAlign.start,
                                        //         style: TextStyle(
                                        //             color: ColorConstants.primaryColorDriver,
                                        //             fontSize: Adaptive.sp(14),
                                        //             fontWeight: FontWeight.w800),
                                        //       ),
                                        //       Align(
                                        //         alignment: Alignment.centerRight,
                                        //         child: InkWell(
                                        //           onTap: () {},
                                        //           child: InstaImageViewer(
                                        //             imageUrl:
                                        //                 "${ImageClient.assetsImageUrl}${dataList[index].goodsInvoiceImage}",
                                        //             child: Icon(
                                        //               CupertinoIcons.eye,
                                        //               color:
                                        //                   ColorConstants.primaryColorDriver,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ]),
                                        // const SizedBox(
                                        //   height: 10,
                                        // ),
                                        // RowSuper(
                                        //     fill: true,
                                        //     alignment: Alignment.center,
                                        //     children: [
                                        //       Text(
                                        //         'Kanta Image',
                                        //         textAlign: TextAlign.start,
                                        //         style: TextStyle(
                                        //             color: ColorConstants.primaryColorDriver,
                                        //             fontSize: Adaptive.sp(14),
                                        //             fontWeight: FontWeight.w800),
                                        //       ),
                                        //       Align(
                                        //         alignment: Alignment.centerRight,
                                        //         child: InkWell(
                                        //           onTap: () {},
                                        //           child: InstaImageViewer(
                                        //             imageUrl:
                                        //                 "${ImageClient.frontEndAssetsUrl}${data.data![index].kantaImage}",
                                        //             child: Icon(
                                        //               CupertinoIcons.eye,
                                        //               color:
                                        //                   ColorConstants.primaryColorDriver,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ]),
                                        // const SizedBox(
                                        //   height: 10,
                                        // ),
                                        // RowSuper(
                                        //     fill: true,
                                        //     alignment: Alignment.center,
                                        //     children: [
                                        //       Text(
                                        //         'Receiving Kanta Parchi',
                                        //         textAlign: TextAlign.start,
                                        //         style: TextStyle(
                                        //             color: ColorConstants.primaryColorDriver,
                                        //             fontSize: Adaptive.sp(14),
                                        //             fontWeight: FontWeight.w800),
                                        //       ),
                                        //       Align(
                                        //         alignment: Alignment.centerRight,
                                        //         child: InkWell(
                                        //           onTap: () {},
                                        //           child: InstaImageViewer(
                                        //             imageUrl:
                                        //                 "${ImageClient.assetsImageUrl}${dataList[index].goodsInvoiceImage}",
                                        //             child: Icon(
                                        //               CupertinoIcons.eye,
                                        //               color:
                                        //                   ColorConstants.primaryColorDriver,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(
                                          height: 2,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        dataList[index].tripEnd != null &&
                                                dataList[index].tripStart !=
                                                    null
                                            ? Text(
                                                'tripComplete'.tr(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: dataList[index]
                                                                ?.status
                                                                ?.toInt() ==
                                                            0
                                                        ? Colors.red
                                                        : ColorConstants
                                                            .primaryColorDriver,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )
                                            : dataList[index].weight == null
                                                ? Text(
                                                    'tripStartPending'.tr(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: dataList[index]
                                                                    ?.status
                                                                    ?.toInt() ==
                                                                0
                                                            ? Colors.red
                                                            : ColorConstants
                                                                .primaryColorDriver,
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  )
                                                : dataList[index].weight !=
                                                            null &&
                                                        dataList[index]
                                                                .tripStart !=
                                                            null
                                                    ? (dataList[index].inOutTypes ??
                                                                    "")
                                                                .toLowerCase() ==
                                                            "in"
                                                        ? Text(
                                                            'tripEndPending'
                                                                .tr(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: data
                                                                            .data?[
                                                                                index]
                                                                            ?.status
                                                                            ?.toInt() ==
                                                                        0
                                                                    ? Colors.red
                                                                    : ColorConstants
                                                                        .primaryColorDriver,
                                                                fontSize:
                                                                    Adaptive.sp(
                                                                        14),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                          )
                                                        : AnimatedButton(
                                                            height: 35,
                                                            color: ColorConstants
                                                                .primaryColorDriver,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.2,
                                                            isOutline: true,
                                                            isMultiColor: true,
                                                            colors: [
                                                              ColorConstants
                                                                  .primaryColorDriver,
                                                              ColorConstants
                                                                  .primaryColorDriver,
                                                            ],
                                                            borderWidth: 1,
                                                            onTap: () async {
                                                              try {
                                                                showBarModalBottomSheet(
                                                                    context:
                                                                        context,
                                                                    builder: (context) => Consumer(
                                                                        builder: (context, ref, child) => SafeArea(
                                                                                child: Padding(
                                                                              padding: const Pad(all: 10),
                                                                              child: Form(
                                                                                  key: form,
                                                                                  child: ListView(
                                                                                    children: [
                                                                                      TextFormField(
                                                                                        controller: bagsController,
                                                                                        keyboardType: TextInputType.text,
                                                                                        validator: (value) {
                                                                                          if (value == null || value.isEmpty) {
                                                                                            return 'inputBags'.tr();
                                                                                          }
                                                                                          return null;
                                                                                        },
                                                                                        decoration: InputDecoration(label: Text('inputBags'.tr()), contentPadding: const Pad(top: 0, bottom: 0, left: 10), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: weightController,
                                                                                        keyboardType: TextInputType.text,
                                                                                        validator: (value) {
                                                                                          if (value == null || value.isEmpty) {
                                                                                            return 'enterRecevingBags'.tr();
                                                                                          }
                                                                                          return null;
                                                                                        },
                                                                                        decoration: InputDecoration(label: Text('enterRecevingBags'.tr()), contentPadding: const Pad(top: 0, bottom: 0, left: 10), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                      DottedBorder(
                                                                                          borderType: BorderType.RRect,
                                                                                          dashPattern: const [5, 5, 5, 5],
                                                                                          color: ColorConstants.primaryColorDriver,
                                                                                          child: Padding(
                                                                                            padding: const Pad(all: 20),
                                                                                            child: Center(
                                                                                              child: ref.watch(kantaImage) != null
                                                                                                  ? Stack(
                                                                                                      children: [
                                                                                                        Image.file(ref.watch(kantaImage) ?? File('')),
                                                                                                        Container(
                                                                                                          decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
                                                                                                          child: IconButton(
                                                                                                              onPressed: () {
                                                                                                                ref.invalidate(kantaImage);
                                                                                                              },
                                                                                                              icon: const Icon(
                                                                                                                Icons.close,
                                                                                                                color: Colors.white,
                                                                                                              )),
                                                                                                        )
                                                                                                      ],
                                                                                                    )
                                                                                                  : InkWell(
                                                                                                      child: ColumnSuper(children: [
                                                                                                        const Icon(
                                                                                                          Icons.cloud_upload,
                                                                                                          color: ColorConstants.primaryColorDriver,
                                                                                                        ),
                                                                                                        const SizedBox(
                                                                                                          height: 5,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          "selectKanta".tr(),
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                                                                                                        ),
                                                                                                        const SizedBox(
                                                                                                          height: 5,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          "uploadDocumentImage".tr(),
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.w700, fontSize: Adaptive.sp(13)),
                                                                                                        )
                                                                                                      ]),
                                                                                                      onTap: () async {
                                                                                                        imagePicker.pickImage(source: ImageSource.camera).then((file) {
                                                                                                          if (file != null) {
                                                                                                            ref.watch(kantaImage.notifier).state = File(file.path);
                                                                                                          }
                                                                                                        });
                                                                                                      },
                                                                                                    ),
                                                                                            ),
                                                                                          )),
                                                                                      const SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                      DottedBorder(
                                                                                          borderType: BorderType.RRect,
                                                                                          dashPattern: const [5, 5, 5, 5],
                                                                                          color: ColorConstants.primaryColorDriver,
                                                                                          child: Padding(
                                                                                            padding: const Pad(all: 20),
                                                                                            child: Center(
                                                                                              child: ref.watch(qualityImage) != null
                                                                                                  ? Stack(
                                                                                                      children: [
                                                                                                        Image.file(ref.watch(qualityImage) ?? File('')),
                                                                                                        Container(
                                                                                                          decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
                                                                                                          child: IconButton(
                                                                                                              onPressed: () {
                                                                                                                ref.invalidate(qualityImage);
                                                                                                              },
                                                                                                              icon: const Icon(
                                                                                                                Icons.close,
                                                                                                                color: Colors.white,
                                                                                                              )),
                                                                                                        )
                                                                                                      ],
                                                                                                    )
                                                                                                  : InkWell(
                                                                                                      child: ColumnSuper(children: [
                                                                                                        const Icon(
                                                                                                          Icons.cloud_upload,
                                                                                                          color: ColorConstants.primaryColorDriver,
                                                                                                        ),
                                                                                                        const SizedBox(
                                                                                                          height: 5,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          "selectQualityImage".tr(),
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                                                                                                        ),
                                                                                                        const SizedBox(
                                                                                                          height: 5,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          "uploadDocumentImage".tr(),
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.w700, fontSize: Adaptive.sp(13)),
                                                                                                        )
                                                                                                      ]),
                                                                                                      onTap: () async {
                                                                                                        imagePicker.pickImage(source: ImageSource.camera).then((file) {
                                                                                                          if (file != null) {
                                                                                                            ref.watch(qualityImage.notifier).state = File(file.path);
                                                                                                          }
                                                                                                        });
                                                                                                      },
                                                                                                    ),
                                                                                            ),
                                                                                          )),
                                                                                      AnimatedButton(
                                                                                        height: 35,
                                                                                        color: ColorConstants.primaryColorDriver,
                                                                                        width: MediaQuery.of(context).size.width / 1.2,
                                                                                        isOutline: true,
                                                                                        isMultiColor: true,
                                                                                        colors: [
                                                                                          ColorConstants.primaryColorDriver,
                                                                                          ColorConstants.primaryColorDriver,
                                                                                        ],
                                                                                        borderWidth: 1,
                                                                                        child: Text(
                                                                                          "submit".tr(),
                                                                                        ),
                                                                                        onTap: () async {
                                                                                          if (form.currentState!.validate()) {
                                                                                            if (ref.watch(kantaImage) == null) {
                                                                                              errorToast(context, "selectKanta".tr());
                                                                                            }
                                                                                            if (ref.watch(qualityImage) == null) {
                                                                                              errorToast(context, 'selectQualityImage'.tr());
                                                                                            } else {
                                                                                              hideLoader(context);

                                                                                              final bytes = File(ref.watch(kantaImage)?.path ?? "").readAsBytesSync();
                                                                                              String img64 = base64Encode(bytes);

                                                                                              final bytes2 = File(ref.watch(qualityImage)?.path ?? "").readAsBytesSync();
                                                                                              String img642 = base64Encode(bytes2);
                                                                                              ref.watch(endTripProvider(tripRequestId: '${dataList[index]?.id ?? 0}', kantaWeight: '${weightController.text.toString()}', bags: "${bagsController.text.toString()}", kantaImage: img64, qualityImage: img642).future).then((value) {
                                                                                                hideLoader(context);
                                                                                                if (value['status'].toString() == "1") {
                                                                                                  successToast(context, value['message']);
                                                                                                  ref.invalidate(tripsProvider);
                                                                                                  ref.invalidate(kantaImage);
                                                                                                  ref.invalidate(qualityImage);
                                                                                                  bagsController.clear();
                                                                                                  weightController.clear();
                                                                                                  ref.watch(goRouterProvider).pop(context);
                                                                                                } else {
                                                                                                  errorToast(context, value['message']);
                                                                                                }
                                                                                              }).onError((e, s) {
                                                                                                hideLoader(context);

                                                                                                errorToast(context, e.toString());
                                                                                              });
                                                                                            }
                                                                                          }
                                                                                        },
                                                                                      )
                                                                                    ],
                                                                                  )),
                                                                            ))));
                                                              } catch (e, s) {
                                                                print(s);
                                                              }
                                                            },
                                                            child: Text(
                                                              "tripEnd".tr(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      Adaptive.sp(
                                                                          14),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                            ),
                                                          )
                                                    : dataList[index].weight !=
                                                                null &&
                                                            dataList[index]
                                                                    .tripStart ==
                                                                null
                                                        ? Text(
                                                            'tripStartPendingTrans'
                                                                .tr(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: data
                                                                            .data?[
                                                                                index]
                                                                            ?.status
                                                                            ?.toInt() ==
                                                                        0
                                                                    ? Colors.red
                                                                    : ColorConstants
                                                                        .primaryColorDriver,
                                                                fontSize:
                                                                    Adaptive.sp(
                                                                        14),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                          )
                                                        : const SizedBox(),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ]),
                                ),
                              );
                            });
                      },
                      error: (e, s) => Container(),
                      loading: () => const CupertinoActivityIndicator())
                ],
              ),
              onRefresh: () {
                return Future(() {
                  ref.invalidate(tripsHistoryProvider);
                });
              })),
    );
  }
}
