import 'dart:convert';
import 'dart:io';

import 'package:apnagodam_driver/Domain/Trip/TripService.dart';
import 'package:apnagodam_driver/Presentation/Routes/routes.dart';
import 'package:apnagodam_driver/Presentation/UI/Authentication/LoginScreen.dart';
import 'package:apnagodam_driver/Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';
import 'package:apnagodam_driver/Presentation/Utils/Widgets/Widgets.dart';
import 'package:apnagodam_driver/Presentation/Utils/color_constants.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bagsController = TextEditingController();
    final weightController = TextEditingController();
    final imagePicker = ImagePicker();
    var kantaImage = StateProvider<File?>((ref) => null);
    var qualityImage = StateProvider<File?>((ref) => null);

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.profile);
                    },
                    child: RowSuper(
                      alignment: Alignment.centerLeft,
                      children: [
                        const ClipOval(
                          child: Icon(Icons.person_2),
                        ),
                        // CircleAvatar(
                        //   foregroundImage: NetworkImage(ref
                        //       .watch(sharedUtilityProvider)
                        //       .getUser()
                        //       ?.profileImage ??
                        //       ""),
                        // ),
                        const SizedBox(
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
                      'Logout',
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
              child: ListView(
                children: [
                  ref.watch(tripsProvider).when(
                      data: (data) => ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
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
                                                'Trip Id : ${data.data?[index].tripId ?? "--"}',
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
                                          'From',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].fromAddress}',
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
                                          'To',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].toAddress}',
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
                                          'Transporter name',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].transporterName}',
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
                                          'Transporter phone',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: ColorConstants
                                                  .primaryColorDriver,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?[index].transporterPhone}',
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
                                              'Customer',
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
                                              'Customer Phone',
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
                                              'Rate per Qtl.',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: ColorConstants
                                                      .primaryColorDriver,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${currencyFormat.format(int.parse("${data.data?[index].rate ?? 0}"))} / per Qtl.',
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
                                              'Commodity',
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
                                              'Final Weight(Qtl.)',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: ColorConstants
                                                      .primaryColorDriver,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${data.data?[index].weight ?? "Pending"}',
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
                                              'Final No of Bags',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: ColorConstants
                                                      .primaryColorDriver,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${data.data?[index].noOfBags ?? "Pending"}',
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
                                              'Receiving Weight(Qtl.)',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: ColorConstants
                                                      .primaryColorDriver,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${data.data?[index].recevingBags ?? "Pending"}',
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
                                              'Receiving Bags',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: ColorConstants
                                                      .primaryColorDriver,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${data.data?[index].recevingBags ?? "Pending"}',
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
                                              'Bilty Image',
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
                                                                    tripRequestid:
                                                                        data.data?[index].id ??
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
                                                            hideLoader(context);

                                                            if (value != null) {
                                                              PDFDocument doc =
                                                                  await PDFDocument
                                                                      .fromFile(
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
                                              data.data?[index].tripStart !=
                                                  null
                                          ? Text(
                                              'Trip Complete',
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
                                          : data.data?[index].weight == null
                                              ? Text(
                                                  'Trip Start Pending from user side',
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
                                                      fontWeight:
                                                          FontWeight.w800),
                                                )
                                              : data.data?[index].weight !=
                                                          null &&
                                                      data.data?[index]
                                                              .tripStart !=
                                                          null
                                                  ? (data.data?[index].inOutTypes ??
                                                                  "")
                                                              .toLowerCase() ==
                                                          "in"
                                                      ? Text(
                                                          'Trip End Pending',
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
                                                            showBarModalBottomSheet(
                                                                context:
                                                                    context,
                                                                builder: (context) =>
                                                                    Consumer(
                                                                        builder: (context,
                                                                                ref,
                                                                                child) =>
                                                                            SafeArea(
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
                                                                                            return 'Please input bags';
                                                                                          }
                                                                                          return null;
                                                                                        },
                                                                                        decoration: InputDecoration(label: const Text('Enter bags'), contentPadding: const Pad(top: 0, bottom: 0, left: 10), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: weightController,
                                                                                        keyboardType: TextInputType.text,
                                                                                        validator: (value) {
                                                                                          if (value == null || value.isEmpty) {
                                                                                            return 'Please input receieving weight';
                                                                                          }
                                                                                          return null;
                                                                                        },
                                                                                        decoration: InputDecoration(label: const Text('Enter Receiving weight'), contentPadding: const Pad(top: 0, bottom: 0, left: 10), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
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
                                                                                                          "Select kanta ",
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                                                                                                        ),
                                                                                                        const SizedBox(
                                                                                                          height: 5,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          "Upload Document Image,\n  Supports JPG, JPEG, PNG",
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
                                                                                                          "Select Quality Image",
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: TextStyle(color: ColorConstants.primaryColorDriver, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                                                                                                        ),
                                                                                                        const SizedBox(
                                                                                                          height: 5,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          "Upload Document Image,\n  Supports JPG, JPEG, PNG",
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
                                                                                        child: const Text(
                                                                                          "Submit",
                                                                                        ),
                                                                                        onTap: () async {
                                                                                          if (form.currentState!.validate()) {
                                                                                            if (ref.watch(kantaImage) == null) {
                                                                                              errorToast(context, "please select kanta image");
                                                                                            }
                                                                                            if (ref.watch(qualityImage) == null) {
                                                                                              errorToast(context, 'Please select quality image');
                                                                                            } else {
                                                                                              hideLoader(context);

                                                                                              final bytes = File(ref.watch(kantaImage)?.path ?? "").readAsBytesSync();
                                                                                              String img64 = base64Encode(bytes);

                                                                                              final bytes2 = File(ref.watch(qualityImage)?.path ?? "").readAsBytesSync();
                                                                                              String img642 = base64Encode(bytes);
                                                                                              ref.watch(endTripProvider(tripRequestId: '${data.data?[index]?.id ?? 0}', kantaWeight: '${weightController.text.toString()}', bags: "${bagsController.text.toString()}", kantaImage: img64, qualityImage: img642).future).then((value) {
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
                                                          },
                                                          child: Text(
                                                            "Trip End",
                                                            textAlign: TextAlign
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
                                                  : data.data?[index].weight !=
                                                              null &&
                                                          data.data?[index]
                                                                  .tripStart ==
                                                              null
                                                      ? Text(
                                                          'Trip Start Pending From Transporter',
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
                          }),
                      error: (e, s) => Container(),
                      loading: () => const CupertinoActivityIndicator())
                ],
              ),
              onRefresh: () {
                return Future(() {
                  ref.invalidate(tripsProvider);
                });
              })),
    );
  }
}

var currencyFormat =
    NumberFormat.currency(locale: 'HI', symbol: '\u{20B9}', decimalDigits: 2);
