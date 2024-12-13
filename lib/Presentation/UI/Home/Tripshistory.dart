import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Domain/Trip/TripService.dart';
import '../../Utils/Widgets/Widgets.dart';
import '../../Utils/color_constants.dart';
import '../../Utils/pdf/BiltyPdf.dart';
import '../Authentication/LoginScreen.dart';
import 'Dashboard.dart';

class Tripshistory extends ConsumerStatefulWidget {
  const Tripshistory({super.key});

  @override
  ConsumerState<Tripshistory> createState() => _TripshistoryState();
}

class _TripshistoryState extends ConsumerState<Tripshistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trips History'),
      ),
      body: SafeArea(
          child: ref.watch(tripsHistoryProvider).when(
              data: (data) => ref.watch(tripsProvider).when(
                  data: (data) => ListView.builder(
                      itemCount: data.data?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const Pad(all: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.primaryColorDriver),
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
                                                ': ${data.data?[index].tripId ?? "--"}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: Adaptive.sp(16),
                                                fontWeight: FontWeight.bold),
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
                                          color:
                                              ColorConstants.primaryColorDriver,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      '${data.data?[index].fromAddress}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryColorDriver,
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
                                          color:
                                              ColorConstants.primaryColorDriver,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      '${data.data?[index].toAddress}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryColorDriver,
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
                                          color:
                                              ColorConstants.primaryColorDriver,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      '${data.data?[index].transporterName}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryColorDriver,
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
                                          color:
                                              ColorConstants.primaryColorDriver,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      '${data.data?[index].transporterPhone}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color:
                                              ColorConstants.primaryColorDriver,
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
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].userName}',
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
                                          'customerPhone'.tr(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].userPhone}',
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
                                          'ratePerQtl'.tr(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${currencyFormat.format(int.parse("${data.data?[index].rate ?? 0}"))} /' +
                                              "perQtl".tr(),
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
                                          'commodity'.tr(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].commodity}',
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
                                          'finalWeight'.tr(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].weight ?? "pending".tr()}',
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
                                          'finalNoOfBags'.tr(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].noOfBags ?? "pending".tr()}',
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
                                          'receivingWeight'.tr(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].recevingBags ?? "pending".tr()}',
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
                                          'receivingBags'.tr(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].recevingBags ?? "pending".tr()}',
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
                                          'biltyImage'.tr(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
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
                                                                tripRequestid: data
                                                                        .data?[
                                                                            index]
                                                                        .id ??
                                                                    "")
                                                            .future)
                                                        .then((value) {
                                                      ref
                                                          .watch(
                                                              createBiltyPdfProvider(
                                                                      context:
                                                                          context,
                                                                      model:
                                                                          value)
                                                                  .future)
                                                          .then((value) async {
                                                        hideLoader(context);

                                                        if (value != null) {
                                                          PDFDocument doc =
                                                              await PDFDocument
                                                                  .fromFile(
                                                                      value ??
                                                                          File(
                                                                              ''));
                                                          showBarModalBottomSheet(
                                                              context: context,
                                                              builder: (context) =>
                                                                  PDFViewer(
                                                                      document:
                                                                          doc));
                                                        }
                                                      }).onError((e, s) {
                                                        hideLoader(context);
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
                                  //                 "${ImageClient.assetsImageUrl}${data.data?[index].goodsInvoiceImage}",
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
                                  //                 "${ImageClient.assetsImageUrl}${data.data?[index].goodsInvoiceImage}",
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

                                  data.data?[index].tripEnd != null &&
                                          data.data?[index].tripStart != null
                                      ? Text(
                                          'tripComplete'.tr(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: data.data?[index]?.status
                                                          ?.toInt() ==
                                                      0
                                                  ? Colors.red
                                                  : ColorConstants
                                                      .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        )
                                      : data.data?[index].weight == null
                                          ? Text(
                                              'tripStartPending'.tr(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: data.data?[index]
                                                              ?.status
                                                              ?.toInt() ==
                                                          0
                                                      ? Colors.red
                                                      : ColorConstants
                                                          .primaryColorDriver,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            )
                                          : data.data?[index].weight != null &&
                                                  data.data?[index].tripStart !=
                                                      null
                                              ? (data.data?[index].inOutTypes ??
                                                              "")
                                                          .toLowerCase() ==
                                                      "in"
                                                  ? Text(
                                                      'tripEndPending'.tr(),
                                                      textAlign:
                                                          TextAlign.center,
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
                                                              Adaptive.sp(14),
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    )
                                                  : AnimatedButton(
                                                      height: 35,
                                                      color: ColorConstants
                                                          .primaryColorDriver,
                                                      width:
                                                          MediaQuery.of(context)
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
                                                        try {} catch (e, s) {
                                                          print(s);
                                                        }
                                                      },
                                                      child: Text(
                                                        "tripEnd".tr(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                Adaptive.sp(14),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    )
                                              : data.data?[index].weight !=
                                                          null &&
                                                      data.data?[index]
                                                              .tripStart ==
                                                          null
                                                  ? Text(
                                                      'tripStartPendingTrans'
                                                          .tr(),
                                                      textAlign:
                                                          TextAlign.center,
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
                                                              Adaptive.sp(14),
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    )
                                                  : const SizedBox(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                        );
                      }),
                  error: (e, s) => Container(),
                  loading: () => const CupertinoActivityIndicator()),
              error: (e, s) => Container(),
              loading: () => const CupertinoActivityIndicator())),
    );
  }
}
