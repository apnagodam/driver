// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:apnagodam_driver/Data/Model/DriverResponseModel.dart';
import 'package:apnagodam_driver/Domain/Trip/TripService.dart';
import 'package:apnagodam_driver/Presentation/Routes/routes.dart';
import 'package:apnagodam_driver/Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';
import 'package:apnagodam_driver/Presentation/Utils/color_constants.dart';
import 'package:apnagodam_driver/Presentation/Utils/height_w.dart';
import 'package:apnagodam_driver/Presentation/Utils/style_constants.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restart_app/restart_app.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dashboard".tr()),
      ),
      drawer: Drawer(
        child: Scaffold(
          backgroundColor: ColorConstants.primaryColor,
          body: Column(
            children: [
              InkWell(
                onTap: () {
                  ref.watch(goRouterProvider).goNamed(RoutesStrings.profile);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                      // CircleAvatar(
                      //   radius: 40,
                      //   backgroundImage: ref
                      //               .watch(sharedUtilityProvider)
                      //               .getUser()
                      //               ?.image
                      //               ?.isNotEmpty ??
                      //           false
                      //       ? NetworkImage(ref
                      //           .watch(sharedUtilityProvider)
                      //           .getUser()!
                      //           .image!)
                      //       : AssetImage('assets/logo.png')
                      //           as ImageProvider,
                      //   child: ref
                      //               .watch(sharedUtilityProvider)
                      //               .getUser()
                      //               ?.image
                      //               ?.isNotEmpty ??
                      //           false
                      //       ? null
                      //       : Text(
                      //           'OK',
                      //           style:
                      //               TextStyle(fontSize: 16, color: Colors.white),
                      //         ),
                      // ),
                      // CircleAvatar(
                      //   radius: 40,
                      //   foregroundImage: NetworkImage(
                      //       ref.watch(sharedUtilityProvider).getUser()?.image ??
                      //           ""),
                      // ),
                      Height10,
                      RichText(
                          text: TextSpan(
                              text: 'नाम:- ',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                              children: [
                            TextSpan(
                                text:
                                    '${ref.watch(sharedUtilityProvider).getUser()?.name ?? ""}',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 14, fontWeight: FontWeight.w600))
                          ])),
                      RichText(
                          text: TextSpan(
                              text: 'नंबर :- ',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                              children: [
                            TextSpan(
                                text:
                                    '${ref.watch(sharedUtilityProvider).getUser()?.phone ?? ""}',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 13, fontWeight: FontWeight.w600))
                          ])),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                      ),
                      color: ColorConstants.secondaryColorWSP),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'प्रोफ़ाइल'.tr(),
                        style: GoogleFonts.aBeeZee(
                            color: ColorConstants.primaryColorDriver,
                            fontWeight: FontWeight.w600,
                            fontSize: Adaptive.sp(14)),
                      ),
                      leading: Icon(
                        Icons.account_circle_outlined,
                        color: ColorConstants.primaryColorDriver,
                      ),
                      onTap: () {
                        context.goNamed(RoutesStrings.profile);
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'tripsHistory'.tr(),
                        style: GoogleFonts.aBeeZee(
                            color: ColorConstants.primaryColorDriver,
                            fontWeight: FontWeight.w600,
                            fontSize: Adaptive.sp(14)),
                      ),
                      leading: Image.asset(
                        'assets/delivery-car-icon-512x423-t7gs5e74-removebg-preview.png',
                        color: ColorConstants.primaryColorDriver,
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
                      leading: Image.asset(
                        'assets/truckmenu.png',
                        color: ColorConstants.primaryColorDriver,
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        'tripsInProcess'.tr(),
                        style: GoogleFonts.aBeeZee(
                            color: ColorConstants.primaryColorDriver,
                            fontWeight: FontWeight.w600,
                            fontSize: Adaptive.sp(14)),
                      ),
                      onTap: () {
                        ref
                            .watch(goRouterProvider)
                            .goNamed(RoutesStrings.tripsInProcess);
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.language,
                        color: ColorConstants.primaryColorDriver,
                      ),
                      title: Text(
                        'changeLanguage'.tr(),
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.primaryColorDriver,
                          fontSize: Adaptive.sp(14),
                        ),
                      ),
                      onTap: () {
                        String newLocale =
                            context.locale.languageCode == 'hi' ? 'en' : 'hi';

                        context.setLocale(Locale(newLocale, 'IN'));

                        Restart.restartApp();
                      },
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
          bottomSheet: InkWell(
            onTap: () async {
              ref.watch(sharedPreferencesProvider).clear();
              context.go(RoutesStrings.login);
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                  ),
                  color: ColorConstants.secondaryColorWSP),
              child: Center(
                child: Text(
                  'Logout'.tr(),
                  style: GoogleFonts.aBeeZee(
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
              ),
            ),
          ),
        ),
      ),
      //
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
                            "runningTripId".tr() + " :-",
                            style: TextStyle(
                                color: ColorConstants.primaryColorDriver,
                                fontSize: Adaptive.sp(16),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              color: ColorConstants.secondaryColorWSP,
                              padding: const Pad(all: 10),
                              child: IntrinsicHeight(
                                child: Row(children: [
                                  Expanded(
                                      child: Text(
                                    'Date'.tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: Adaptive.sp(14)),
                                  )),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Text(
                                    'ट्रिप  आईडी'.tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: Adaptive.sp(14)),
                                  )),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Text(
                                    'from'.tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: Adaptive.sp(14)),
                                  )),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Text(
                                    'to'.tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: Adaptive.sp(14)),
                                  )),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Text(
                                    "commodity".tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: Adaptive.sp(14)),
                                  )),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Text(
                                    'action'.tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: Adaptive.sp(14)),
                                  )),
                                ]),
                              ),
                            ),
                            ListView.builder(
                              itemCount: dataList?.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Container(
                                color: index % 2 == 0
                                    ? Colors.grey.withOpacity(0.2)
                                    : Colors.white,
                                padding: const Pad(all: 10),
                                child: IntrinsicHeight(
                                  child: Row(children: [
                                    Expanded(
                                        child: Text.rich(
                                      TextSpan(
                                        text: "${dataList?[index].date}",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            showCupertinoModalBottomSheet(
                                                context: context,
                                                builder: (context) => Material(
                                                      color: Colors.white,
                                                      child: Padding(
                                                        padding: Pad(all: 10),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              "tripDetails"
                                                                  .tr(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      Adaptive.sp(
                                                                          18),
                                                                  color: ColorConstants
                                                                      .primaryColorDriver),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                children: [
                                                                  Text(
                                                                    'ट्रिप आईडी'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    '${dataList?[index].tripId ?? "--"}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),

                                                            Height10,
                                                            RowSuper(
                                                                fill: true,
                                                                children: [
                                                                  Text(
                                                                    'transporterName'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    '${dataList?[index].transporterName ?? "--"}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                children: [
                                                                  Text(
                                                                    'transporterPhone'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    '${dataList?[index].transporterPhone ?? "--"}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                children: [
                                                                  Text(
                                                                    'customer'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Text.rich(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      TextSpan(
                                                                        text:
                                                                            '${dataList?[index].userName}',
                                                                        style: TextStyle(
                                                                            color:
                                                                                ColorConstants.primaryColorDriver,
                                                                            fontSize: Adaptive.sp(14),
                                                                            fontWeight: FontWeight.w800),
                                                                      )),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'customerPhone'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    '${dataList?[index].userPhone}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'ratePerQtl'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    '${currencyFormat.format(num.parse("${dataList?[index].rate ?? 0}"))} / perQtl'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'finalWeight'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    '${dataList?[index].weight ?? "pending".tr()}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'finalNoOfBags'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    '${dataList?[index].noOfBags ?? "pending".tr()}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'receivingWeight'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    '${dataList?[index].recevingWeight ?? "pending".tr()}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'receivingBags'
                                                                        .tr(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    '${dataList?[index].recevingBags ?? "pending".tr()}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    '${dataList?[index].weight == null ? 'provBilty'.tr() : "provBilty".tr()}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        ref.watch(tripDataProvider(tripRequestid: "${dataList?[index].id}").future).then(
                                                                            (value) {
                                                                          ref.watch(createBiltyPdfProvider(context: context, model: value).future).then(
                                                                              (value) async {
                                                                            if (value !=
                                                                                null) {
                                                                              PDFDocument doc = await PDFDocument.fromFile(value ?? File(''));
                                                                              showBarModalBottomSheet(context: context, builder: (context) => PDFViewer(document: doc));
                                                                            }
                                                                          });
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        CupertinoIcons
                                                                            .eye,
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                      ),
                                                                    ),
                                                                  )
                                                                ]),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'कंटा इमेज',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: TextStyle(
                                                                        color: ColorConstants
                                                                            .primaryColorDriver,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                  Container(
                                                                    height: 60,
                                                                    width: 60,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle),
                                                                    child: dataList?[index].kantaImage !=
                                                                                null &&
                                                                            dataList?[index].kantaImage.isNotEmpty
                                                                        ? InstaImageViewer(
                                                                            child:
                                                                                Image.network(
                                                                              dataList?[index].kantaImage,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          )
                                                                        : IconButton(
                                                                            icon:
                                                                                Icon(Icons.visibility),
                                                                            color:
                                                                                ColorConstants.primaryColorVendor,
                                                                            onPressed:
                                                                                () {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'Image not found. Please try again later.',
                                                                                    style: GoogleFonts.archivoBlack(),
                                                                                  ),
                                                                                  duration: Duration(seconds: 3),
                                                                                  backgroundColor: ColorConstants.primaryColorVendor,
                                                                                ),
                                                                              );
                                                                              Navigator.pop(context);
                                                                            },
                                                                          ),
                                                                  )
                                                                ]),
                                                            // Row(
                                                            //     mainAxisAlignment:
                                                            //         MainAxisAlignment
                                                            //             .spaceBetween,
                                                            //     children: [
                                                            //       Text(
                                                            //         'Paoti Image',
                                                            //         textAlign:
                                                            //             TextAlign
                                                            //                 .start,
                                                            //         style: TextStyle(
                                                            //             color: ColorConstants
                                                            //                 .primaryColorDriver,
                                                            //             fontSize:
                                                            //                 Adaptive.sp(
                                                            //                     14),
                                                            //             fontWeight:
                                                            //                 FontWeight.w800),
                                                            //       ),
                                                            //       Container(
                                                            //         height: 60,
                                                            //         width: 60,
                                                            //         decoration:
                                                            //             BoxDecoration(
                                                            //                 shape:
                                                            //                     BoxShape.circle),
                                                            //         child: dataList?[index].biltyImage !=
                                                            //                     null &&
                                                            //                 dataList?[index].biltyImage.isNotEmpty
                                                            //             ? InstaImageViewer(
                                                            //                 child:
                                                            //                     Image.network(
                                                            //                   dataList?[index].biltyImage ?? 'default_image_url',
                                                            //                   fit: BoxFit.cover,
                                                            //                 ),
                                                            //               )
                                                            //             : IconButton(
                                                            //                 icon:
                                                            //                     Icon(Icons.visibility),
                                                            //                 color:
                                                            //                     ColorConstants.primaryColorVendor,
                                                            //                 onPressed:
                                                            //                     () {
                                                            //                   ScaffoldMessenger.of(context).showSnackBar(
                                                            //                     SnackBar(
                                                            //                       content: Text(
                                                            //                         'Image not found. Please try again later.',
                                                            //                         style: GoogleFonts.archivoBlack(),
                                                            //                       ),
                                                            //                       duration: Duration(seconds: 3),
                                                            //                       backgroundColor: ColorConstants.primaryColorVendor,
                                                            //                     ),
                                                            //                   );
                                                            //                   Navigator.pop(context);
                                                            //                 },
                                                            //               ),
                                                            //       )
                                                            //     ]),
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
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color:
                                              ColorConstants.secondaryColorWSP,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Adaptive.sp(14)),
                                    )),
                                    const VerticalDivider(),
                                    Expanded(
                                        child: Text(
                                      "${dataList?[index].tripId}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: Adaptive.sp(14)),
                                    )),
                                    const VerticalDivider(),
                                    Expanded(
                                        child: Text(
                                      "${dataList?[index].fromAddress}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: Adaptive.sp(14)),
                                    )),
                                    const VerticalDivider(),
                                    Expanded(
                                        child: Text.rich(
                                      TextSpan(
                                        text: "${dataList?[index].toAddress}",
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Adaptive.sp(14)),
                                    )),
                                    const VerticalDivider(),
                                    Expanded(
                                        child: Text.rich(
                                      TextSpan(
                                        text: "${dataList?[index].commodity}",
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Adaptive.sp(14)),
                                    )),
                                    const VerticalDivider(),
                                    Expanded(
                                      child: actionLayout(dataList?[index]),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        )
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
                        Text(
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
                          Text(
                            "tripEnd".tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: Adaptive.sp(16)),
                          ),
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
                        ? ElevatedButton(
                            onPressed: () {
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
                            style: StyleConstants.submitButtonStyle(),
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
                    : ElevatedButton(
                        onPressed: () {
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
                        style: StyleConstants.submitButtonStyle(),
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
