import 'dart:io';

import 'package:apnagodam_driver/Data/Model/DriverResponseModel.dart';
import 'package:apnagodam_driver/Domain/Trip/TripService.dart';
import 'package:apnagodam_driver/Presentation/Routes/routes.dart';
import 'package:apnagodam_driver/Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';
import 'package:apnagodam_driver/Presentation/Utils/color_constants.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Routes/routes_strings.dart';
import '../../Utils/pdf/BiltyPdf.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dashboard".tr()),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            InkWell(
              child: Card(
                color: Colors.white,
                margin: Pad(all: 10),
                elevation: 5,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      foregroundImage: NetworkImage(
                          ref.watch(sharedUtilityProvider).getUser()?.image ??
                              ""),
                      radius: 50,
                    ),
                    CupertinoActionSheetAction(
                        onPressed: () {
                          context.goNamed(RoutesStrings.profile);
                        },
                        child: RowSuper(
                          alignment: Alignment.centerLeft,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${ref.watch(sharedUtilityProvider).getUser()?.name ?? ""}',
                              style: TextStyle(
                                  fontSize: Adaptive.sp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              onTap: () {
                ref.watch(goRouterProvider).goNamed(RoutesStrings.profile);
              },
            ),
            Card(
              color: Colors.white,
              margin: Pad(all: 10),
              elevation: 5,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'tripsHistory'.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Adaptive.sp(16)),
                    ),
                    leading: Image.network(
                      'https://static-00.iconduck.com/assets.00/delivery-car-icon-512x423-t7gs5e74.png',
                      width: 25,
                      height: 25,
                    ),
                    onTap: () {
                      ref
                          .watch(goRouterProvider)
                          .goNamed(RoutesStrings.tripsHistory);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Image.network(
                      'https://banner2.cleanpng.com/20181207/psa/kisspng-clip-art-vector-graphics-computer-icons-illustrati-kalyan-profi-shop-1713912417297.webp',
                      width: 30,
                      height: 30,
                    ),
                    title: Text(
                      'tripsInProcess'.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Adaptive.sp(16)),
                    ),
                    onTap: () {
                      ref
                          .watch(goRouterProvider)
                          .goNamed(RoutesStrings.tripsInProcess);
                    },
                  ),
                  // Divider(),
                  // ListTile(
                  //   title: Text(
                  //     'changeLanguage'.tr(),
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: Adaptive.sp(16)),
                  //   ),
                  //   onTap: () {
                  //     if (ref.watch(sharedUtilityProvider).getLocale() ==
                  //         Locale('hi', 'IN')) {
                  //       ref.watch(sharedUtilityProvider).setLocale("en");
                  //     } else {
                  //       ref.watch(sharedUtilityProvider).setLocale("hi");
                  //     }
                  //     Restart.restartApp().then((value) {
                  //       setState(() {});
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),

            // CupertinoActionSheet(
            //   actions: [
            //     // CupertinoActionSheetAction(
            //     //     onPressed: () async {
            //     //       ref
            //     //           .watch(createGoodsTaxInvoiceProvider(context: context)
            //     //               .future)
            //     //           .then((value) async {
            //     //         if (value != null) {
            //     //           await value
            //     //               .copy('/storage/emulated/0/Download/bilty.pdf');
            //     //           PDFDocument doc =
            //     //               await PDFDocument.fromFile(value ?? File(''));
            //     //           showBarModalBottomSheet(
            //     //               context: context,
            //     //               builder: (context) => PDFViewer(document: doc));
            //     //         }
            //     //       });
            //     //       //context.goNamed(RoutesStrings.profile);
            //     //     },
            //     //     child: Text('Goods Invoice',
            //     //         textAlign: TextAlign.start,
            //     //         style: TextStyle(
            //     //             fontSize: Adaptive.sp(16),
            //     //             color: Colors.black,
            //     //             fontWeight: FontWeight.w500))),
            //     // CupertinoActionSheetAction(
            //     //     onPressed: () async {
            //     //       ref
            //     //           .watch(
            //     //               createFreightPdfProvider(context: context).future)
            //     //           .then((value) async {
            //     //         if (value != null) {
            //     //           await value
            //     //               .copy('/storage/emulated/0/Download/bilty.pdf');
            //     //           PDFDocument doc =
            //     //               await PDFDocument.fromFile(value ?? File(''));
            //     //           showBarModalBottomSheet(
            //     //               context: context,
            //     //               builder: (context) => PDFViewer(document: doc));
            //     //         }
            //     //       });
            //     //       //context.goNamed(RoutesStrings.profile);
            //     //     },
            //     //     child: Text('Freight Invoice',
            //     //         textAlign: TextAlign.start,
            //     //         style: TextStyle(
            //     //             fontSize: Adaptive.sp(16),
            //     //             color: Colors.black,
            //     //             fontWeight: FontWeight.w500))),
            //     // CupertinoActionSheetAction(
            //     //     onPressed: () async {
            //     //       // ref
            //     //       //     .watch(
            //     //       //         createBiltyPdfProvider(context: context).future)
            //     //       //     .then((value) async {
            //     //       //   if (value != null) {
            //     //       //     await value
            //     //       //         .copy('/storage/emulated/0/Download/bilty.pdf');
            //     //       //     PDFDocument doc =
            //     //       //         await PDFDocument.fromFile(value ?? File(''));
            //     //       //     showBarModalBottomSheet(
            //     //       //         context: context,
            //     //       //         builder: (context) => PDFViewer(document: doc));
            //     //       //   }
            //     //       // });
            //     //       //context.goNamed(RoutesStrings.profile);
            //     //     },
            //     //     child: Text('Bilty',
            //     //         textAlign: TextAlign.start,
            //     //         style: TextStyle(
            //     //             fontSize: Adaptive.sp(16),
            //     //             color: Colors.black,
            //     //             fontWeight: FontWeight.w500))),
            //     CupertinoActionSheetAction(
            //         onPressed: () {
            //           context.goNamed(RoutesStrings.moneyRequests);
            //           // if (ref
            //           //         .watch(sharedUtilityProvider)
            //           //         .getUser()
            //           //         ?.tryPartyStatus !=
            //           //     2) {
            //           //   tripartyDialog(context, ref);
            //           // } else {
            //           //   context.goNamed(RoutesStrings.sanctionedAmount);
            //           // }
            //         },
            //         child: Text('Add Money Requests',
            //             textAlign: TextAlign.start,
            //             style: TextStyle(
            //                 fontSize: Adaptive.sp(16),
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.w500))),
            //     CupertinoActionSheetAction(
            //         onPressed: () {
            //           context.goNamed(RoutesStrings.withdrawMoney);
            //           // if (ref
            //           //         .watch(sharedUtilityProvider)
            //           //         .getUser()
            //           //         ?.tryPartyStatus !=
            //           //     2) {
            //           //   tripartyDialog(context, ref);
            //           // } else {
            //           //   context.goNamed(RoutesStrings.sanctionedAmount);
            //           // }
            //         },
            //         child: Text('Withdraw Money',
            //             textAlign: TextAlign.start,
            //             style: TextStyle(
            //                 fontSize: Adaptive.sp(16),
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.w500))),
            //     CupertinoActionSheetAction(
            //         onPressed: () {
            //           context.goNamed(RoutesStrings.withdrawRequests);
            //           // if (ref
            //           //         .watch(sharedUtilityProvider)
            //           //         .getUser()
            //           //         ?.tryPartyStatus !=
            //           //     2) {
            //           //   tripartyDialog(context, ref);
            //           // } else {
            //           //   context.goNamed(RoutesStrings.sanctionedAmount);
            //           // }
            //         },
            //         child: Text('Withdraw Requests',
            //             textAlign: TextAlign.start,
            //             style: TextStyle(
            //                 fontSize: Adaptive.sp(16),
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.w500))),
            //   ],
            // ),

            CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () async {
                      ref.watch(sharedPreferencesProvider).clear();
                      context.go(RoutesStrings.login);
                    },
                    child: Text(
                      'logout'.tr(),
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    )),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
          child: RefreshIndicator.adaptive(
              child: ref.watch(tripsProvider).when(
                  data: (data) {
                    var dataList = data.data
                        ?.where((element) =>
                            element.tripStart == null ||
                            element.tripEnd == null)
                        .toList();
                    return ListView(
                      children: [
                        tripsTypesLayout(data.data),
                        Padding(
                          padding: Pad(all: 10),
                          child: Text(
                            "runningTripId".tr(),
                            style: TextStyle(
                                fontSize: Adaptive.sp(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dataList?.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return tripRequestLayout(dataList?[index]);
                            })
                      ],
                    );
                  },
                  error: (e, s) => Container(),
                  loading: () => const CupertinoActivityIndicator()),
              onRefresh: () {
                return Future(() {
                  ref.invalidate(tripsProvider);
                });
              })),
    );
  }

  // imageLayout(Datum data) => data.inOutTypes.toString().toLowerCase() == "in"
  //     ? Column(
  //   children: [
  //     data.poId == null
  //         ? SizedBox()
  //         : RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'goodsInvoiceImage'.tr(),
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
  //             imageUrl: "${data.goodsInvoiceImage}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Kanta Parchi Image'.tr(),
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
  //             imageUrl: "${data.kantaImage}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Quality Report Image'.tr(),
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
  //             imageUrl: "${data.qualityReport}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Invoice Image'.tr(),
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
  //             imageUrl: "${data.invoiceImg}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'E-way bill  Image'.tr(),
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
  //             imageUrl: "${data.eWayBill}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Mandi Tax Image'.tr(),
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
  //             imageUrl: "${data.mandiTaxImg}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //   ],
  // )
  //     : Column(
  //   children: [
  //     data.poId == null
  //         ? SizedBox()
  //         : RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'goodsInvoiceImage'.tr(),
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
  //             imageUrl: "${data.goodsInvoiceImage}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'receivingKanta'.tr(),
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
  //             imageUrl: "${data.recevingKantaImage}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Paoti Image'.tr(),
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
  //             imageUrl: "${data.paotiImage}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Receiving Quality Image'.tr(),
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
  //             imageUrl: "${data.recevingQualityImg}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //   ],
  // );

  tripRequestLayout(Datum? dataList) => Container(
        margin: Pad(all: 10),
        decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.primaryColorDriver),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const Pad(all: 10),
          child: ColumnSuper(alignment: Alignment.center, children: [
            RowSuper(fill: true, alignment: Alignment.centerRight, children: [
              Padding(
                padding: Pad(all: 10),
                child: Text(
                  dataList!.tripId == null
                      ? "--"
                      : '${'tripId'.tr()}: ${dataList?.tripId.toString()}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Adaptive.sp(16),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              ),
              TextButton(
                  onPressed: () {
                    showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => Material(
                              color: Colors.white,
                              child: Padding(
                                padding: Pad(all: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "tripDetails".tr(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Adaptive.sp(18),
                                          color: ColorConstants
                                              .primaryColorDriver),
                                    ),
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
                                        '${dataList.transporterName ?? "--"}',
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
                                        '${dataList.transporterPhone ?? "--"}',
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
                                        'customer'.tr(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: ColorConstants
                                                .primaryColorDriver,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text.rich(
                                          textAlign: TextAlign.end,
                                          TextSpan(
                                            text: '${dataList.userName}',
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          )),
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
                                            '${dataList.userPhone}',
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
                                            '${currencyFormat.format(num.parse("${dataList.rate ?? 0}"))} / perQtl'
                                                .tr(),
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
                                            '${dataList.weight ?? "pending".tr()}',
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
                                            '${dataList.noOfBags ?? "pending".tr()}',
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
                                            '${dataList.recevingWeight ?? "pending".tr()}',
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
                                            '${dataList.recevingBags ?? "pending".tr()}',
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
                                            '${dataList?.weight == null ? 'provBilty'.tr() : "provBilty".tr()}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColorDriver,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: () async {
                                                ref
                                                    .watch(tripDataProvider(
                                                            tripRequestid:
                                                                "${dataList.id}")
                                                        .future)
                                                    .then((value) {
                                                  ref
                                                      .watch(
                                                          createBiltyPdfProvider(
                                                                  context:
                                                                      context,
                                                                  model: value)
                                                              .future)
                                                      .then((value) async {
                                                    if (value != null) {
                                                      PDFDocument doc =
                                                          await PDFDocument
                                                              .fromFile(value ??
                                                                  File(''));
                                                      showBarModalBottomSheet(
                                                          context: context,
                                                          builder: (context) =>
                                                              PDFViewer(
                                                                  document:
                                                                      doc));
                                                    }
                                                  });
                                                });
                                              },
                                              child: Icon(
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
                                    //imageLayout(dataList),
                                    Divider(
                                      height: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: Text(
                    'viewDetails'.tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontSize: Adaptive.sp(13)),
                  ))
            ]),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Expanded(
                  child: Text(
                'Date'.tr(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ColorConstants.primaryColorDriver,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              )),
              Expanded(
                  child: Text(
                '${dataList.date ?? ""}',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: ColorConstants.primaryColorDriver,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              )),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Expanded(
                  child: Text(
                'from'.tr(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ColorConstants.primaryColorDriver,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              )),
              Expanded(
                  child: Text(
                ' ${dataList?.fromAddress}',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: ColorConstants.primaryColorDriver,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              )),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Expanded(
                  child: Text(
                'to'.tr(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ColorConstants.primaryColorDriver,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              )),
              Expanded(
                  child: Text(
                ' ${dataList?.toAddress}',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: ColorConstants.primaryColorDriver,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              )),
            ]),
            SizedBox(
              height: 10,
            ),
            RowSuper(fill: true, alignment: Alignment.center, children: [
              Text(
                'commodity'.tr(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ColorConstants.primaryColorDriver,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              ),
              Text(
                '${dataList?.commodity}',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: ColorConstants.primaryColorDriver,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            // RowSuper(fill: true, children: [
            //   Text(
            //     'vehicleNumber'.tr(),
            //     textAlign: TextAlign.start,
            //     style: TextStyle(
            //         color: ColorConstants.primaryColorDriver,
            //         fontSize: Adaptive.sp(14),
            //         fontWeight: FontWeight.w800),
            //   ),
            //   Text(
            //     '${dataList.nim ?? "--"}',
            //     textAlign: TextAlign.end,
            //     style: TextStyle(
            //         color: ColorConstants.primaryColorDriver,
            //         fontSize: Adaptive.sp(14),
            //         fontWeight: FontWeight.w800),
            //   ),
            // ]),
            Divider(),
            const SizedBox(
              height: 10,
            ),
            actionLayout(dataList),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      );

  // imageLayout(Datum data) => data.inOutTypes.toString().toLowerCase() == "in"
  //     ? Column(
  //   children: [
  //     data.poId == null
  //         ? SizedBox()
  //         : RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'goodsInvoiceImage'.tr(),
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
  //             imageUrl: "${data.goodsInvoiceImage}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Kanta Parchi Image'.tr(),
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
  //             imageUrl: "${data.kantaImage}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Quality Report Image'.tr(),
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
  //             imageUrl: "${data.qualityReport}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Invoice Image'.tr(),
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
  //             imageUrl: "${data.invoiceImg}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'E-way bill  Image'.tr(),
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
  //             imageUrl: "${data.eWayBill}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Mandi Tax Image'.tr(),
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
  //             imageUrl: "${data.mandiTaxImg}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //   ],
  // )
  //     : Column(
  //   children: [
  //     data.poId == null
  //         ? SizedBox()
  //         : RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'goodsInvoiceImage'.tr(),
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
  //             imageUrl: "${data.goodsInvoiceImage}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'receivingKanta'.tr(),
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
  //             imageUrl: "${data.recevingKantaImage}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Paoti Image'.tr(),
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
  //             imageUrl: "${data.paotiImage}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //     RowSuper(fill: true, alignment: Alignment.center, children: [
  //       Text(
  //         'Receiving Quality Image'.tr(),
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
  //             imageUrl: "${data.recevingQualityImg}",
  //             child: Icon(
  //               CupertinoIcons.eye,
  //               color: ColorConstants.primaryColorDriver,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]),
  //     const SizedBox(
  //       height: 10,
  //     ),
  //   ],
  // );

  tripsTypesLayout(List<Datum>? data) => Padding(
        padding: Pad(all: 10),
        child: Row(children: [
          Expanded(
              child: InkWell(
            child: Card(
              color: ColorConstants.primaryColorDriver,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: ColorConstants.primaryColorDriver)),
              child: Padding(
                padding: Pad(all: 15),
                child: Row(
                  children: [
                    Card(
                      child: Padding(
                        padding: Pad(all: 5),
                        child: Icon(Icons.fire_truck_outlined),
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextOneLine(
                          "startTrips".tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: Adaptive.sp(16)),
                        ),
                        Text(
                          "${data?.where((datum) => datum.weight != null && datum.tripStart == null).toList().length}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(18)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              ref.watch(goRouterProvider).goNamed(RoutesStrings.startTrips);
            },
          )),
          Expanded(
              child: InkWell(
            child: Card(
              color: ColorConstants.primaryColorDriver,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: ColorConstants.primaryColorDriver)),
              child: Padding(
                  padding: Pad(all: 15),
                  child: Row(
                    children: [
                      Card(
                        child: Padding(
                          padding: Pad(all: 5),
                          child: Icon(Icons.history),
                        ),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextOneLine("endTrips".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16))),
                          Text(
                            "${data?.where((datum) => datum.weight != null && datum.tripStart != null && datum.tripEnd == null).toList().length}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(18)),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
            onTap: () {
              ref.watch(goRouterProvider).goNamed(RoutesStrings.endTrips);
            },
          ))
        ]),
      );

  actionLayout(Datum? dataList) {
    return dataList?.tripEnd != null && dataList?.tripStart != null
        ? Text(
            'tripComplete'.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: dataList?.status?.toInt() == 0
                    ? Colors.red
                    : ColorConstants.primaryColorDriver,
                fontSize: Adaptive.sp(14),
                fontWeight: FontWeight.w800),
          )
        : dataList?.weight == null
            ? Text(
                'tripStartPending'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: dataList?.status?.toInt() == 0
                        ? Colors.red
                        : ColorConstants.primaryColorDriver,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              )
            : dataList?.weight != null && dataList?.tripStart != null
                ? (dataList?.inOutTypes ?? "").toLowerCase() == "in"
                    ? (dataList?.paymentTo.toString() == "1" &&
                            dataList?.tripStart != null)
                        ? AnimatedButton(
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
                            onTap: () async {
                              // try {
                              //   showBarModalBottomSheet(
                              //       context: context,
                              //       builder: (context) => Consumer(
                              //           builder:
                              //               (context, ref, child) => SafeArea(
                              //                       child: Padding(
                              //                     padding: const Pad(all: 10),
                              //                     child: Form(
                              //                         key: form,
                              //                         child: ListView(
                              //                           children: [
                              //                             TextFormField(
                              //                               controller:
                              //                                   bagsController,
                              //                               keyboardType:
                              //                                   TextInputType
                              //                                       .text,
                              //                               validator: (value) {
                              //                                 if (value ==
                              //                                         null ||
                              //                                     value
                              //                                         .isEmpty) {
                              //                                   return 'inputBags'
                              //                                       .tr();
                              //                                 }
                              //                                 return null;
                              //                               },
                              //                               decoration: InputDecoration(
                              //                                   label: Text(
                              //                                       'inputBags'
                              //                                           .tr()),
                              //                                   contentPadding:
                              //                                       const Pad(
                              //                                           top: 0,
                              //                                           bottom:
                              //                                               0,
                              //                                           left:
                              //                                               10),
                              //                                   border: OutlineInputBorder(
                              //                                       borderRadius:
                              //                                           BorderRadius.circular(
                              //                                               10)),
                              //                                   enabledBorder:
                              //                                       OutlineInputBorder(
                              //                                           borderRadius:
                              //                                               BorderRadius.circular(10))),
                              //                             ),
                              //                             const SizedBox(
                              //                               height: 10,
                              //                             ),
                              //                             TextFormField(
                              //                               controller:
                              //                                   weightController,
                              //                               keyboardType:
                              //                                   TextInputType
                              //                                       .text,
                              //                               validator: (value) {
                              //                                 if (value ==
                              //                                         null ||
                              //                                     value
                              //                                         .isEmpty) {
                              //                                   return 'enterRecevingBags'
                              //                                       .tr();
                              //                                 }
                              //                                 return null;
                              //                               },
                              //                               decoration: InputDecoration(
                              //                                   label: Text(
                              //                                       'enterRecevingBags'
                              //                                           .tr()),
                              //                                   contentPadding:
                              //                                       const Pad(
                              //                                           top: 0,
                              //                                           bottom:
                              //                                               0,
                              //                                           left:
                              //                                               10),
                              //                                   border: OutlineInputBorder(
                              //                                       borderRadius:
                              //                                           BorderRadius.circular(
                              //                                               10)),
                              //                                   enabledBorder: OutlineInputBorder(
                              //                                       borderRadius:
                              //                                           BorderRadius.circular(
                              //                                               10))),
                              //                             ),
                              //                             const SizedBox(
                              //                               height: 10,
                              //                             ),
                              //                             TextFormField(
                              //                               controller:
                              //                                   paotiController,
                              //                               keyboardType:
                              //                                   TextInputType
                              //                                       .text,
                              //                               decoration: InputDecoration(
                              //                                   label: Text(
                              //                                       'enterPaotiNumber'
                              //                                           .tr()),
                              //                                   contentPadding:
                              //                                       const Pad(
                              //                                           top: 0,
                              //                                           bottom:
                              //                                               0,
                              //                                           left:
                              //                                               10),
                              //                                   border: OutlineInputBorder(
                              //                                       borderRadius:
                              //                                           BorderRadius.circular(
                              //                                               10)),
                              //                                   enabledBorder: OutlineInputBorder(
                              //                                       borderRadius:
                              //                                           BorderRadius.circular(
                              //                                               10))),
                              //                             ),
                              //                             const SizedBox(
                              //                               height: 10,
                              //                             ),
                              //                             DottedBorder(
                              //                                 borderType:
                              //                                     BorderType
                              //                                         .RRect,
                              //                                 dashPattern: const [
                              //                                   5,
                              //                                   5,
                              //                                   5,
                              //                                   5
                              //                                 ],
                              //                                 color: ColorConstants
                              //                                     .primaryColorDriver,
                              //                                 child: Padding(
                              //                                   padding:
                              //                                       const Pad(
                              //                                           all:
                              //                                               20),
                              //                                   child: Center(
                              //                                     child: ref.watch(
                              //                                                 kantaImage) !=
                              //                                             null
                              //                                         ? Stack(
                              //                                             children: [
                              //                                               Image.file(ref.watch(kantaImage) ??
                              //                                                   File('')),
                              //                                               Container(
                              //                                                 decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
                              //                                                 child: IconButton(
                              //                                                     onPressed: () {
                              //                                                       ref.invalidate(kantaImage);
                              //                                                     },
                              //                                                     icon: const Icon(
                              //                                                       Icons.close,
                              //                                                       color: Colors.white,
                              //                                                     )),
                              //                                               )
                              //                                             ],
                              //                                           )
                              //                                         : InkWell(
                              //                                             child:
                              //                                                 ColumnSuper(children: [
                              //                                               const Icon(
                              //                                                 Icons.cloud_upload,
                              //                                                 color: ColorConstants.primaryColorDriver,
                              //                                               ),
                              //                                               const SizedBox(
                              //                                                 height: 5,
                              //                                               ),
                              //                                               Text(
                              //                                                 "selectKanta".tr(),
                              //                                                 textAlign: TextAlign.center,
                              //                                                 style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                              //                                               ),
                              //                                               const SizedBox(
                              //                                                 height: 5,
                              //                                               ),
                              //                                               Text(
                              //                                                 "uploadDocumentImage".tr(),
                              //                                                 textAlign: TextAlign.center,
                              //                                                 style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.w700, fontSize: Adaptive.sp(13)),
                              //                                               )
                              //                                             ]),
                              //                                             onTap:
                              //                                                 () async {
                              //                                               imagePicker.pickImage(source: ImageSource.camera).then((file) {
                              //                                                 if (file != null) {
                              //                                                   ref.watch(kantaImage.notifier).state = File(file.path);
                              //                                                 }
                              //                                               });
                              //                                             },
                              //                                           ),
                              //                                   ),
                              //                                 )),
                              //                             const SizedBox(
                              //                               height: 10,
                              //                             ),
                              //                             DottedBorder(
                              //                                 borderType:
                              //                                     BorderType
                              //                                         .RRect,
                              //                                 dashPattern: const [
                              //                                   5,
                              //                                   5,
                              //                                   5,
                              //                                   5
                              //                                 ],
                              //                                 color: ColorConstants
                              //                                     .primaryColorDriver,
                              //                                 child: Padding(
                              //                                   padding:
                              //                                       const Pad(
                              //                                           all:
                              //                                               20),
                              //                                   child: Center(
                              //                                     child: ref.watch(
                              //                                                 qualityImage) !=
                              //                                             null
                              //                                         ? Stack(
                              //                                             children: [
                              //                                               Image.file(ref.watch(qualityImage) ??
                              //                                                   File('')),
                              //                                               Container(
                              //                                                 decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
                              //                                                 child: IconButton(
                              //                                                     onPressed: () {
                              //                                                       ref.invalidate(qualityImage);
                              //                                                     },
                              //                                                     icon: const Icon(
                              //                                                       Icons.close,
                              //                                                       color: Colors.white,
                              //                                                     )),
                              //                                               )
                              //                                             ],
                              //                                           )
                              //                                         : InkWell(
                              //                                             child:
                              //                                                 ColumnSuper(children: [
                              //                                               const Icon(
                              //                                                 Icons.cloud_upload,
                              //                                                 color: ColorConstants.primaryColorDriver,
                              //                                               ),
                              //                                               const SizedBox(
                              //                                                 height: 5,
                              //                                               ),
                              //                                               Text(
                              //                                                 "selectQualityImage".tr(),
                              //                                                 textAlign: TextAlign.center,
                              //                                                 style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                              //                                               ),
                              //                                               const SizedBox(
                              //                                                 height: 5,
                              //                                               ),
                              //                                               Text(
                              //                                                 "uploadDocumentImage".tr(),
                              //                                                 textAlign: TextAlign.center,
                              //                                                 style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.w700, fontSize: Adaptive.sp(13)),
                              //                                               )
                              //                                             ]),
                              //                                             onTap:
                              //                                                 () async {
                              //                                               imagePicker.pickImage(source: ImageSource.camera).then((file) {
                              //                                                 if (file != null) {
                              //                                                   ref.watch(qualityImage.notifier).state = File(file.path);
                              //                                                 }
                              //                                               });
                              //                                             },
                              //                                           ),
                              //                                   ),
                              //                                 )),
                              //                             const SizedBox(
                              //                               height: 10,
                              //                             ),
                              //                             DottedBorder(
                              //                                 borderType:
                              //                                     BorderType
                              //                                         .RRect,
                              //                                 dashPattern: const [
                              //                                   5,
                              //                                   5,
                              //                                   5,
                              //                                   5
                              //                                 ],
                              //                                 color: ColorConstants
                              //                                     .primaryColorDriver,
                              //                                 child: Padding(
                              //                                   padding:
                              //                                       const Pad(
                              //                                           all:
                              //                                               20),
                              //                                   child: Center(
                              //                                     child: ref.watch(
                              //                                                 paotiImage) !=
                              //                                             null
                              //                                         ? Stack(
                              //                                             children: [
                              //                                               Image.file(ref.watch(paotiImage) ??
                              //                                                   File('')),
                              //                                               Container(
                              //                                                 decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
                              //                                                 child: IconButton(
                              //                                                     onPressed: () {
                              //                                                       ref.invalidate(qualityImage);
                              //                                                     },
                              //                                                     icon: const Icon(
                              //                                                       Icons.close,
                              //                                                       color: Colors.white,
                              //                                                     )),
                              //                                               )
                              //                                             ],
                              //                                           )
                              //                                         : InkWell(
                              //                                             child:
                              //                                                 ColumnSuper(children: [
                              //                                               const Icon(
                              //                                                 Icons.cloud_upload,
                              //                                                 color: ColorConstants.primaryColorDriver,
                              //                                               ),
                              //                                               const SizedBox(
                              //                                                 height: 5,
                              //                                               ),
                              //                                               Text(
                              //                                                 "selectPaotiImage".tr(),
                              //                                                 textAlign: TextAlign.center,
                              //                                                 style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                              //                                               ),
                              //                                               const SizedBox(
                              //                                                 height: 5,
                              //                                               ),
                              //                                               Text(
                              //                                                 "uploadDocumentImage".tr(),
                              //                                                 textAlign: TextAlign.center,
                              //                                                 style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.w700, fontSize: Adaptive.sp(13)),
                              //                                               )
                              //                                             ]),
                              //                                             onTap:
                              //                                                 () async {
                              //                                               imagePicker.pickImage(source: ImageSource.camera).then((file) {
                              //                                                 if (file != null) {
                              //                                                   ref.watch(paotiImage.notifier).state = File(file.path);
                              //                                                 }
                              //                                               });
                              //                                             },
                              //                                           ),
                              //                                   ),
                              //                                 )),
                              //                             const SizedBox(
                              //                               height: 10,
                              //                             ),
                              //                             AnimatedButton(
                              //                               height: 35,
                              //                               color: ColorConstants
                              //                                   .primaryColorDriver,
                              //                               width: MediaQuery.of(
                              //                                           context)
                              //                                       .size
                              //                                       .width /
                              //                                   1.2,
                              //                               isOutline: true,
                              //                               isMultiColor: true,
                              //                               colors: [
                              //                                 ColorConstants
                              //                                     .primaryColorDriver,
                              //                                 ColorConstants
                              //                                     .primaryColorDriver,
                              //                               ],
                              //                               borderWidth: 1,
                              //                               child: Text(
                              //                                 "submit".tr(),
                              //                               ),
                              //                               onTap: () async {
                              //                                 ref.watch(goRouterProvider).goNamed(
                              //                                     RoutesStrings
                              //                                         .paotiEndTrip,
                              //                                     extra:
                              //                                         dataList);
                              //                               },
                              //                             )
                              //                           ],
                              //                         )),
                              //                   ))));
                              // } catch (e, s) {
                              //   print(s);
                              // }
                              ref.watch(goRouterProvider).goNamed(
                                  RoutesStrings.paotiEndTrip,
                                  extra: dataList);
                            },
                            child: Text(
                              "tripEnd".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Adaptive.sp(14),
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        : Text(
                            'tripEndPending'.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: dataList?.status?.toInt() == 0
                                    ? Colors.red
                                    : ColorConstants.primaryColorDriver,
                                fontSize: Adaptive.sp(14),
                                fontWeight: FontWeight.w800),
                          )
                    : AnimatedButton(
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
                        onTap: () async {
                          // try {
                          //   showBarModalBottomSheet(
                          //       context: context,
                          //       builder: (context) => Consumer(
                          //           builder: (context, ref, child) => SafeArea(
                          //                   child: Padding(
                          //                 padding: const Pad(all: 10),
                          //                 child: Form(
                          //                     key: form,
                          //                     child: ListView(
                          //                       children: [
                          //                         TextFormField(
                          //                           controller: bagsController,
                          //                           keyboardType:
                          //                               TextInputType.text,
                          //                           validator: (value) {
                          //                             if (value == null ||
                          //                                 value.isEmpty) {
                          //                               return 'inputBags'.tr();
                          //                             }
                          //                             return null;
                          //                           },
                          //                           decoration: InputDecoration(
                          //                               label: Text(
                          //                                   'inputBags'.tr()),
                          //                               contentPadding:
                          //                                   const Pad(
                          //                                       top: 0,
                          //                                       bottom: 0,
                          //                                       left: 10),
                          //                               border: OutlineInputBorder(
                          //                                   borderRadius:
                          //                                       BorderRadius
                          //                                           .circular(
                          //                                               10)),
                          //                               enabledBorder:
                          //                                   OutlineInputBorder(
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   10))),
                          //                         ),
                          //                         const SizedBox(
                          //                           height: 10,
                          //                         ),
                          //                         TextFormField(
                          //                           controller:
                          //                               weightController,
                          //                           keyboardType:
                          //                               TextInputType.text,
                          //                           validator: (value) {
                          //                             if (value == null ||
                          //                                 value.isEmpty) {
                          //                               return 'enterRecevingBags'
                          //                                   .tr();
                          //                             }
                          //                             return null;
                          //                           },
                          //                           decoration: InputDecoration(
                          //                               label: Text(
                          //                                   'enterRecevingBags'
                          //                                       .tr()),
                          //                               contentPadding:
                          //                                   const Pad(
                          //                                       top: 0,
                          //                                       bottom: 0,
                          //                                       left: 10),
                          //                               border: OutlineInputBorder(
                          //                                   borderRadius:
                          //                                       BorderRadius
                          //                                           .circular(
                          //                                               10)),
                          //                               enabledBorder:
                          //                                   OutlineInputBorder(
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   10))),
                          //                         ),
                          //                         const SizedBox(
                          //                           height: 10,
                          //                         ),
                          //                         TextFormField(
                          //                           controller: paotiController,
                          //                           keyboardType:
                          //                               TextInputType.text,
                          //                           decoration: InputDecoration(
                          //                               label: Text(
                          //                                   'enterPaotiNumber'
                          //                                       .tr()),
                          //                               contentPadding:
                          //                                   const Pad(
                          //                                       top: 0,
                          //                                       bottom: 0,
                          //                                       left: 10),
                          //                               border: OutlineInputBorder(
                          //                                   borderRadius:
                          //                                       BorderRadius
                          //                                           .circular(
                          //                                               10)),
                          //                               enabledBorder:
                          //                                   OutlineInputBorder(
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   10))),
                          //                         ),
                          //                         const SizedBox(
                          //                           height: 10,
                          //                         ),
                          //                         DottedBorder(
                          //                             borderType:
                          //                                 BorderType.RRect,
                          //                             dashPattern: const [
                          //                               5,
                          //                               5,
                          //                               5,
                          //                               5
                          //                             ],
                          //                             color: ColorConstants
                          //                                 .primaryColorDriver,
                          //                             child: Padding(
                          //                               padding:
                          //                                   const Pad(all: 20),
                          //                               child: Center(
                          //                                 child: ref.watch(
                          //                                             kantaImage) !=
                          //                                         null
                          //                                     ? Stack(
                          //                                         children: [
                          //                                           Image.file(ref.watch(
                          //                                                   kantaImage) ??
                          //                                               File(
                          //                                                   '')),
                          //                                           Container(
                          //                                             decoration: BoxDecoration(
                          //                                                 color: Colors.black.withOpacity(
                          //                                                     0.6),
                          //                                                 shape:
                          //                                                     BoxShape.circle),
                          //                                             child: IconButton(
                          //                                                 onPressed: () {
                          //                                                   ref.invalidate(kantaImage);
                          //                                                 },
                          //                                                 icon: const Icon(
                          //                                                   Icons.close,
                          //                                                   color:
                          //                                                       Colors.white,
                          //                                                 )),
                          //                                           )
                          //                                         ],
                          //                                       )
                          //                                     : InkWell(
                          //                                         child: ColumnSuper(
                          //                                             children: [
                          //                                               const Icon(
                          //                                                 Icons
                          //                                                     .cloud_upload,
                          //                                                 color:
                          //                                                     ColorConstants.primaryColorDriver,
                          //                                               ),
                          //                                               const SizedBox(
                          //                                                 height:
                          //                                                     5,
                          //                                               ),
                          //                                               Text(
                          //                                                 "selectKanta"
                          //                                                     .tr(),
                          //                                                 textAlign:
                          //                                                     TextAlign.center,
                          //                                                 style: TextStyle(
                          //                                                     color: ColorConstants.primaryColorDriver,
                          //                                                     fontWeight: FontWeight.bold,
                          //                                                     fontSize: Adaptive.sp(16)),
                          //                                               ),
                          //                                               const SizedBox(
                          //                                                 height:
                          //                                                     5,
                          //                                               ),
                          //                                               Text(
                          //                                                 "uploadDocumentImage"
                          //                                                     .tr(),
                          //                                                 textAlign:
                          //                                                     TextAlign.center,
                          //                                                 style: TextStyle(
                          //                                                     color: ColorConstants.primaryColorDriver,
                          //                                                     fontWeight: FontWeight.w700,
                          //                                                     fontSize: Adaptive.sp(13)),
                          //                                               )
                          //                                             ]),
                          //                                         onTap:
                          //                                             () async {
                          //                                           imagePicker
                          //                                               .pickImage(
                          //                                                   source: ImageSource
                          //                                                       .camera)
                          //                                               .then(
                          //                                                   (file) {
                          //                                             if (file !=
                          //                                                 null) {
                          //                                               ref.watch(kantaImage.notifier).state =
                          //                                                   File(file.path);
                          //                                             }
                          //                                           });
                          //                                         },
                          //                                       ),
                          //                               ),
                          //                             )),
                          //                         const SizedBox(
                          //                           height: 10,
                          //                         ),
                          //                         DottedBorder(
                          //                             borderType:
                          //                                 BorderType.RRect,
                          //                             dashPattern: const [
                          //                               5,
                          //                               5,
                          //                               5,
                          //                               5
                          //                             ],
                          //                             color: ColorConstants
                          //                                 .primaryColorDriver,
                          //                             child: Padding(
                          //                               padding:
                          //                                   const Pad(all: 20),
                          //                               child: Center(
                          //                                 child: ref.watch(
                          //                                             qualityImage) !=
                          //                                         null
                          //                                     ? Stack(
                          //                                         children: [
                          //                                           Image.file(ref.watch(
                          //                                                   qualityImage) ??
                          //                                               File(
                          //                                                   '')),
                          //                                           Container(
                          //                                             decoration: BoxDecoration(
                          //                                                 color: Colors.black.withOpacity(
                          //                                                     0.6),
                          //                                                 shape:
                          //                                                     BoxShape.circle),
                          //                                             child: IconButton(
                          //                                                 onPressed: () {
                          //                                                   ref.invalidate(qualityImage);
                          //                                                 },
                          //                                                 icon: const Icon(
                          //                                                   Icons.close,
                          //                                                   color:
                          //                                                       Colors.white,
                          //                                                 )),
                          //                                           )
                          //                                         ],
                          //                                       )
                          //                                     : InkWell(
                          //                                         child: ColumnSuper(
                          //                                             children: [
                          //                                               const Icon(
                          //                                                 Icons
                          //                                                     .cloud_upload,
                          //                                                 color:
                          //                                                     ColorConstants.primaryColorDriver,
                          //                                               ),
                          //                                               const SizedBox(
                          //                                                 height:
                          //                                                     5,
                          //                                               ),
                          //                                               Text(
                          //                                                 "selectQualityImage"
                          //                                                     .tr(),
                          //                                                 textAlign:
                          //                                                     TextAlign.center,
                          //                                                 style: TextStyle(
                          //                                                     color: ColorConstants.primaryColorDriver,
                          //                                                     fontWeight: FontWeight.bold,
                          //                                                     fontSize: Adaptive.sp(16)),
                          //                                               ),
                          //                                               const SizedBox(
                          //                                                 height:
                          //                                                     5,
                          //                                               ),
                          //                                               Text(
                          //                                                 "uploadDocumentImage"
                          //                                                     .tr(),
                          //                                                 textAlign:
                          //                                                     TextAlign.center,
                          //                                                 style: TextStyle(
                          //                                                     color: ColorConstants.primaryColorDriver,
                          //                                                     fontWeight: FontWeight.w700,
                          //                                                     fontSize: Adaptive.sp(13)),
                          //                                               )
                          //                                             ]),
                          //                                         onTap:
                          //                                             () async {
                          //                                           imagePicker
                          //                                               .pickImage(
                          //                                                   source: ImageSource
                          //                                                       .camera)
                          //                                               .then(
                          //                                                   (file) {
                          //                                             if (file !=
                          //                                                 null) {
                          //                                               ref.watch(qualityImage.notifier).state =
                          //                                                   File(file.path);
                          //                                             }
                          //                                           });
                          //                                         },
                          //                                       ),
                          //                               ),
                          //                             )),
                          //                         DottedBorder(
                          //                             borderType:
                          //                                 BorderType.RRect,
                          //                             dashPattern: const [
                          //                               5,
                          //                               5,
                          //                               5,
                          //                               5
                          //                             ],
                          //                             color: ColorConstants
                          //                                 .primaryColorDriver,
                          //                             child: Padding(
                          //                               padding:
                          //                                   const Pad(all: 20),
                          //                               child: Center(
                          //                                 child: ref.watch(
                          //                                             paotiImage) !=
                          //                                         null
                          //                                     ? Stack(
                          //                                         children: [
                          //                                           Image.file(ref.watch(
                          //                                                   paotiImage) ??
                          //                                               File(
                          //                                                   '')),
                          //                                           Container(
                          //                                             decoration: BoxDecoration(
                          //                                                 color: Colors.black.withOpacity(
                          //                                                     0.6),
                          //                                                 shape:
                          //                                                     BoxShape.circle),
                          //                                             child: IconButton(
                          //                                                 onPressed: () {
                          //                                                   ref.invalidate(qualityImage);
                          //                                                 },
                          //                                                 icon: const Icon(
                          //                                                   Icons.close,
                          //                                                   color:
                          //                                                       Colors.white,
                          //                                                 )),
                          //                                           )
                          //                                         ],
                          //                                       )
                          //                                     : InkWell(
                          //                                         child: ColumnSuper(
                          //                                             children: [
                          //                                               const Icon(
                          //                                                 Icons
                          //                                                     .cloud_upload,
                          //                                                 color:
                          //                                                     ColorConstants.primaryColorDriver,
                          //                                               ),
                          //                                               const SizedBox(
                          //                                                 height:
                          //                                                     5,
                          //                                               ),
                          //                                               Text(
                          //                                                 "selectPaotiImage"
                          //                                                     .tr(),
                          //                                                 textAlign:
                          //                                                     TextAlign.center,
                          //                                                 style: TextStyle(
                          //                                                     color: ColorConstants.primaryColorDriver,
                          //                                                     fontWeight: FontWeight.bold,
                          //                                                     fontSize: Adaptive.sp(16)),
                          //                                               ),
                          //                                               const SizedBox(
                          //                                                 height:
                          //                                                     5,
                          //                                               ),
                          //                                               Text(
                          //                                                 "uploadDocumentImage"
                          //                                                     .tr(),
                          //                                                 textAlign:
                          //                                                     TextAlign.center,
                          //                                                 style: TextStyle(
                          //                                                     color: ColorConstants.primaryColorDriver,
                          //                                                     fontWeight: FontWeight.w700,
                          //                                                     fontSize: Adaptive.sp(13)),
                          //                                               )
                          //                                             ]),
                          //                                         onTap:
                          //                                             () async {
                          //                                           imagePicker
                          //                                               .pickImage(
                          //                                                   source: ImageSource
                          //                                                       .camera)
                          //                                               .then(
                          //                                                   (file) {
                          //                                             if (file !=
                          //                                                 null) {
                          //                                               ref.watch(paotiImage.notifier).state =
                          //                                                   File(file.path);
                          //                                             }
                          //                                           });
                          //                                         },
                          //                                       ),
                          //                               ),
                          //                             )),
                          //                         AnimatedButton(
                          //                           height: 35,
                          //                           color: ColorConstants
                          //                               .primaryColorDriver,
                          //                           width:
                          //                               MediaQuery.of(context)
                          //                                       .size
                          //                                       .width /
                          //                                   1.2,
                          //                           isOutline: true,
                          //                           isMultiColor: true,
                          //                           colors: [
                          //                             ColorConstants
                          //                                 .primaryColorDriver,
                          //                             ColorConstants
                          //                                 .primaryColorDriver,
                          //                           ],
                          //                           borderWidth: 1,
                          //                           child: Text(
                          //                             "submit".tr(),
                          //                           ),
                          //                           onTap: () async {
                          //                             if (form.currentState!
                          //                                 .validate()) {
                          //                               if (ref.watch(
                          //                                       kantaImage) ==
                          //                                   null) {
                          //                                 errorToast(
                          //                                     context,
                          //                                     "selectKanta"
                          //                                         .tr());
                          //                               }
                          //                               if (ref.watch(
                          //                                       qualityImage) ==
                          //                                   null) {
                          //                                 errorToast(
                          //                                     context,
                          //                                     'selectQualityImage'
                          //                                         .tr());
                          //                               } else {
                          //                                 hideLoader(context);
                          //
                          //                                 final bytes = File(ref
                          //                                             .watch(
                          //                                                 kantaImage)
                          //                                             ?.path ??
                          //                                         "")
                          //                                     .readAsBytesSync();
                          //                                 String img64 =
                          //                                     base64Encode(
                          //                                         bytes);
                          //
                          //                                 final bytes2 = File(ref
                          //                                             .watch(
                          //                                                 qualityImage)
                          //                                             ?.path ??
                          //                                         "")
                          //                                     .readAsBytesSync();
                          //                                 String img642 =
                          //                                     base64Encode(
                          //                                         bytes2);
                          //                                 ref
                          //                                     .watch(endTripProvider(
                          //                                             tripRequestId:
                          //                                                 '${dataList?.id ?? 0}',
                          //                                             kantaWeight:
                          //                                                 '${weightController.text.toString()}',
                          //                                             bags:
                          //                                                 "${bagsController.text.toString()}",
                          //                                             kantaImage:
                          //                                                 img64,
                          //                                             qualityImage:
                          //                                                 img642,
                          //                                             paotiImage:
                          //                                                 base64Encode(File(ref.watch(paotiImage)?.path ?? "")
                          //                                                     .readAsBytesSync()),
                          //                                             paotiNumber:
                          //                                                 paotiController
                          //                                                     .text)
                          //                                         .future)
                          //                                     .then((value) {
                          //                                   hideLoader(context);
                          //                                   if (value['status']
                          //                                           .toString() ==
                          //                                       "1") {
                          //                                     successToast(
                          //                                         context,
                          //                                         value[
                          //                                             'message']);
                          //                                     ref.invalidate(
                          //                                         tripsProvider);
                          //                                     ref.invalidate(
                          //                                         kantaImage);
                          //                                     ref.invalidate(
                          //                                         qualityImage);
                          //                                     bagsController
                          //                                         .clear();
                          //                                     weightController
                          //                                         .clear();
                          //                                     ref
                          //                                         .watch(
                          //                                             goRouterProvider)
                          //                                         .pop(context);
                          //                                   } else {
                          //                                     errorToast(
                          //                                         context,
                          //                                         value[
                          //                                             'message']);
                          //                                   }
                          //                                 }).onError((e, s) {
                          //                                   hideLoader(context);
                          //
                          //                                   errorToast(context,
                          //                                       e.toString());
                          //                                 });
                          //                               }
                          //                             }
                          //                           },
                          //                         )
                          //                       ],
                          //                     )),
                          //               ))));
                          // } catch (e, s) {
                          //   print(s);
                          // }
                          ref.watch(goRouterProvider).goNamed(
                              RoutesStrings.paotiEndTrip,
                              extra: dataList);
                        },
                        child: Text(
                          "tripEnd".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Adaptive.sp(14),
                              fontWeight: FontWeight.w800),
                        ),
                      )
                : dataList?.weight != null && dataList?.tripStart == null
                    ? (dataList?.paymentTo.toString() == "1" &&
                            dataList?.tripStart != null &&
                            dataList?.tripEnd == null)
                        ? AnimatedButton(
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
                            onTap: () async {
                              ref.watch(goRouterProvider).goNamed(
                                  RoutesStrings.paotiEndTrip,
                                  extra: dataList);
                              // try {
                              //   showBarModalBottomSheet(
                              //       context: context,
                              //       builder: (context) => Consumer(
                              //           builder:
                              //               (context, ref, child) => SafeArea(
                              //                       child: Padding(
                              //                     padding: const Pad(all: 10),
                              //                     child: Form(
                              //                         key: form,
                              //                         child: ListView(
                              //                           children: [
                              //                             TextFormField(
                              //                               controller:
                              //                                   bagsController,
                              //                               keyboardType:
                              //                                   TextInputType
                              //                                       .text,
                              //                               validator: (value) {
                              //                                 if (value ==
                              //                                         null ||
                              //                                     value
                              //                                         .isEmpty) {
                              //                                   return 'inputBags'
                              //                                       .tr();
                              //                                 }
                              //                                 return null;
                              //                               },
                              //                               decoration: InputDecoration(
                              //                                   label: Text(
                              //                                       'inputBags'
                              //                                           .tr()),
                              //                                   contentPadding:
                              //                                       const Pad(
                              //                                           top: 0,
                              //                                           bottom:
                              //                                               0,
                              //                                           left:
                              //                                               10),
                              //                                   border: OutlineInputBorder(
                              //                                       borderRadius:
                              //                                           BorderRadius.circular(
                              //                                               10)),
                              //                                   enabledBorder:
                              //                                       OutlineInputBorder(
                              //                                           borderRadius:
                              //                                               BorderRadius.circular(10))),
                              //                             ),
                              //                             const SizedBox(
                              //                               height: 10,
                              //                             ),
                              //                             TextFormField(
                              //                               controller:
                              //                                   weightController,
                              //                               keyboardType:
                              //                                   TextInputType
                              //                                       .text,
                              //                               validator: (value) {
                              //                                 if (value ==
                              //                                         null ||
                              //                                     value
                              //                                         .isEmpty) {
                              //                                   return 'enterRecevingBags'
                              //                                       .tr();
                              //                                 }
                              //                                 return null;
                              //                               },
                              //                               decoration: InputDecoration(
                              //                                   label: Text(
                              //                                       'enterRecevingBags'
                              //                                           .tr()),
                              //                                   contentPadding:
                              //                                       const Pad(
                              //                                           top: 0,
                              //                                           bottom:
                              //                                               0,
                              //                                           left:
                              //                                               10),
                              //                                   border: OutlineInputBorder(
                              //                                       borderRadius:
                              //                                           BorderRadius.circular(
                              //                                               10)),
                              //                                   enabledBorder: OutlineInputBorder(
                              //                                       borderRadius:
                              //                                           BorderRadius.circular(
                              //                                               10))),
                              //                             ),
                              //                             const SizedBox(
                              //                               height: 10,
                              //                             ),
                              //                             DottedBorder(
                              //                                 borderType:
                              //                                     BorderType
                              //                                         .RRect,
                              //                                 dashPattern: const [
                              //                                   5,
                              //                                   5,
                              //                                   5,
                              //                                   5
                              //                                 ],
                              //                                 color: ColorConstants
                              //                                     .primaryColorDriver,
                              //                                 child: Padding(
                              //                                   padding:
                              //                                       const Pad(
                              //                                           all:
                              //                                               20),
                              //                                   child: Center(
                              //                                     child: ref.watch(
                              //                                                 kantaImage) !=
                              //                                             null
                              //                                         ? Stack(
                              //                                             children: [
                              //                                               Image.file(ref.watch(kantaImage) ??
                              //                                                   File('')),
                              //                                               Container(
                              //                                                 decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
                              //                                                 child: IconButton(
                              //                                                     onPressed: () {
                              //                                                       ref.invalidate(kantaImage);
                              //                                                     },
                              //                                                     icon: const Icon(
                              //                                                       Icons.close,
                              //                                                       color: Colors.white,
                              //                                                     )),
                              //                                               )
                              //                                             ],
                              //                                           )
                              //                                         : InkWell(
                              //                                             child:
                              //                                                 ColumnSuper(children: [
                              //                                               const Icon(
                              //                                                 Icons.cloud_upload,
                              //                                                 color: ColorConstants.primaryColorDriver,
                              //                                               ),
                              //                                               const SizedBox(
                              //                                                 height: 5,
                              //                                               ),
                              //                                               Text(
                              //                                                 "selectKanta".tr(),
                              //                                                 textAlign: TextAlign.center,
                              //                                                 style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                              //                                               ),
                              //                                               const SizedBox(
                              //                                                 height: 5,
                              //                                               ),
                              //                                               Text(
                              //                                                 "uploadDocumentImage".tr(),
                              //                                                 textAlign: TextAlign.center,
                              //                                                 style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.w700, fontSize: Adaptive.sp(13)),
                              //                                               )
                              //                                             ]),
                              //                                             onTap:
                              //                                                 () async {
                              //                                               imagePicker.pickImage(source: ImageSource.camera).then((file) {
                              //                                                 if (file != null) {
                              //                                                   ref.watch(kantaImage.notifier).state = File(file.path);
                              //                                                 }
                              //                                               });
                              //                                             },
                              //                                           ),
                              //                                   ),
                              //                                 )),
                              //                             const SizedBox(
                              //                               height: 10,
                              //                             ),
                              //                             DottedBorder(
                              //                                 borderType:
                              //                                     BorderType
                              //                                         .RRect,
                              //                                 dashPattern: const [
                              //                                   5,
                              //                                   5,
                              //                                   5,
                              //                                   5
                              //                                 ],
                              //                                 color: ColorConstants
                              //                                     .primaryColorDriver,
                              //                                 child: Padding(
                              //                                   padding:
                              //                                       const Pad(
                              //                                           all:
                              //                                               20),
                              //                                   child: Center(
                              //                                     child: ref.watch(
                              //                                                 qualityImage) !=
                              //                                             null
                              //                                         ? Stack(
                              //                                             children: [
                              //                                               Image.file(ref.watch(qualityImage) ??
                              //                                                   File('')),
                              //                                               Container(
                              //                                                 decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
                              //                                                 child: IconButton(
                              //                                                     onPressed: () {
                              //                                                       ref.invalidate(qualityImage);
                              //                                                     },
                              //                                                     icon: const Icon(
                              //                                                       Icons.close,
                              //                                                       color: Colors.white,
                              //                                                     )),
                              //                                               )
                              //                                             ],
                              //                                           )
                              //                                         : InkWell(
                              //                                             child:
                              //                                                 ColumnSuper(children: [
                              //                                               const Icon(
                              //                                                 Icons.cloud_upload,
                              //                                                 color: ColorConstants.primaryColorDriver,
                              //                                               ),
                              //                                               const SizedBox(
                              //                                                 height: 5,
                              //                                               ),
                              //                                               Text(
                              //                                                 "selectQualityImage".tr(),
                              //                                                 textAlign: TextAlign.center,
                              //                                                 style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                              //                                               ),
                              //                                               const SizedBox(
                              //                                                 height: 5,
                              //                                               ),
                              //                                               Text(
                              //                                                 "uploadDocumentImage".tr(),
                              //                                                 textAlign: TextAlign.center,
                              //                                                 style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.w700, fontSize: Adaptive.sp(13)),
                              //                                               )
                              //                                             ]),
                              //                                             onTap:
                              //                                                 () async {
                              //                                               imagePicker.pickImage(source: ImageSource.camera).then((file) {
                              //                                                 if (file != null) {
                              //                                                   ref.watch(qualityImage.notifier).state = File(file.path);
                              //                                                 }
                              //                                               });
                              //                                             },
                              //                                           ),
                              //                                   ),
                              //                                 )),
                              //                             AnimatedButton(
                              //                               height: 35,
                              //                               color: ColorConstants
                              //                                   .primaryColorDriver,
                              //                               width: MediaQuery.of(
                              //                                           context)
                              //                                       .size
                              //                                       .width /
                              //                                   1.2,
                              //                               isOutline: true,
                              //                               isMultiColor: true,
                              //                               colors: [
                              //                                 ColorConstants
                              //                                     .primaryColorDriver,
                              //                                 ColorConstants
                              //                                     .primaryColorDriver,
                              //                               ],
                              //                               borderWidth: 1,
                              //                               child: Text(
                              //                                 "submit".tr(),
                              //                               ),
                              //                               onTap: () async {
                              //                                 if (form
                              //                                     .currentState!
                              //                                     .validate()) {
                              //                                   if (ref.watch(
                              //                                           kantaImage) ==
                              //                                       null) {
                              //                                     errorToast(
                              //                                         context,
                              //                                         "selectKanta"
                              //                                             .tr());
                              //                                   }
                              //                                   if (ref.watch(
                              //                                           qualityImage) ==
                              //                                       null) {
                              //                                     errorToast(
                              //                                         context,
                              //                                         'selectQualityImage'
                              //                                             .tr());
                              //                                   } else {
                              //                                     hideLoader(
                              //                                         context);
                              //
                              //                                     final bytes = File(
                              //                                             ref.watch(kantaImage)?.path ??
                              //                                                 "")
                              //                                         .readAsBytesSync();
                              //                                     String img64 =
                              //                                         base64Encode(
                              //                                             bytes);
                              //
                              //                                     final bytes2 =
                              //                                         File(ref.watch(qualityImage)?.path ??
                              //                                                 "")
                              //                                             .readAsBytesSync();
                              //                                     String
                              //                                         img642 =
                              //                                         base64Encode(
                              //                                             bytes2);
                              //                                     ref
                              //                                         .watch(endTripProvider(
                              //                                                 tripRequestId:
                              //                                                     '${dataList?.id ?? 0}',
                              //                                                 kantaWeight:
                              //                                                     '${weightController.text.toString()}',
                              //                                                 bags:
                              //                                                     "${bagsController.text.toString()}",
                              //                                                 kantaImage:
                              //                                                     img64,
                              //                                                 qualityImage:
                              //                                                     img642)
                              //                                             .future)
                              //                                         .then(
                              //                                             (value) {
                              //                                       hideLoader(
                              //                                           context);
                              //                                       if (value['status']
                              //                                               .toString() ==
                              //                                           "1") {
                              //                                         successToast(
                              //                                             context,
                              //                                             value[
                              //                                                 'message']);
                              //                                         ref.invalidate(
                              //                                             tripsProvider);
                              //                                         ref.invalidate(
                              //                                             kantaImage);
                              //                                         ref.invalidate(
                              //                                             qualityImage);
                              //                                         bagsController
                              //                                             .clear();
                              //                                         weightController
                              //                                             .clear();
                              //                                         ref
                              //                                             .watch(
                              //                                                 goRouterProvider)
                              //                                             .pop(
                              //                                                 context);
                              //                                       } else {
                              //                                         errorToast(
                              //                                             context,
                              //                                             value[
                              //                                                 'message']);
                              //                                       }
                              //                                     }).onError((e,
                              //                                             s) {
                              //                                       hideLoader(
                              //                                           context);
                              //
                              //                                       errorToast(
                              //                                           context,
                              //                                           e.toString());
                              //                                     });
                              //                                   }
                              //                                 }
                              //                               },
                              //                             )
                              //                           ],
                              //                         )),
                              //                   ))));
                              // } catch (e, s) {
                              //   print(s);
                              // }
                            },
                            child: Text(
                              "tripEnd".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Adaptive.sp(14),
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        : Text(
                            'tripStartPendingTrans'.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: dataList?.status?.toInt() == 0
                                    ? Colors.red
                                    : ColorConstants.primaryColorDriver,
                                fontSize: Adaptive.sp(14),
                                fontWeight: FontWeight.w800),
                          )
                    : const SizedBox();
    ;
  }
}

var currencyFormat =
    NumberFormat.currency(locale: 'HI', symbol: '\u{20B9}', decimalDigits: 2);
