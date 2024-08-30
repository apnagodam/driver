import 'dart:io';

import 'package:apnagodam_driver/Domain/Trip/TripService.dart';
import 'package:apnagodam_driver/Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';
import 'package:apnagodam_driver/Presentation/Utils/pdf/FreightPdf.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Routes/routes_strings.dart';
import '../../Utils/pdf/BiltyPdf.dart';
import '../../Utils/pdf/GoodsPdf.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
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
                        ClipOval(
                          child: Icon(Icons.person_2),
                        ),
                        // CircleAvatar(
                        //   foregroundImage: NetworkImage(ref
                        //       .watch(sharedUtilityProvider)
                        //       .getUser()
                        //       ?.profileImage ??
                        //       ""),
                        // ),
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
            CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () async {
                      ref
                          .watch(createGoodsTaxInvoiceProvider(context: context)
                              .future)
                          .then((value) async {
                        if (value != null) {
                          await value
                              .copy('/storage/emulated/0/Download/bilty.pdf');
                          PDFDocument doc =
                              await PDFDocument.fromFile(value ?? File(''));
                          showBarModalBottomSheet(
                              context: context,
                              builder: (context) => PDFViewer(document: doc));
                        }
                      });
                      //context.goNamed(RoutesStrings.profile);
                    },
                    child: Text('Goods Invoice',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                CupertinoActionSheetAction(
                    onPressed: () async {
                      ref
                          .watch(
                              createFreightPdfProvider(context: context).future)
                          .then((value) async {
                        if (value != null) {
                          await value
                              .copy('/storage/emulated/0/Download/bilty.pdf');
                          PDFDocument doc =
                              await PDFDocument.fromFile(value ?? File(''));
                          showBarModalBottomSheet(
                              context: context,
                              builder: (context) => PDFViewer(document: doc));
                        }
                      });
                      //context.goNamed(RoutesStrings.profile);
                    },
                    child: Text('Freight Invoice',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                CupertinoActionSheetAction(
                    onPressed: () async {
                      ref
                          .watch(
                              createBiltyPdfProvider(context: context).future)
                          .then((value) async {
                        if (value != null) {
                          await value
                              .copy('/storage/emulated/0/Download/bilty.pdf');
                          PDFDocument doc =
                              await PDFDocument.fromFile(value ?? File(''));
                          showBarModalBottomSheet(
                              context: context,
                              builder: (context) => PDFViewer(document: doc));
                        }
                      });
                      //context.goNamed(RoutesStrings.profile);
                    },
                    child: Text('Bilty',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.moneyRequests);
                      // if (ref
                      //         .watch(sharedUtilityProvider)
                      //         .getUser()
                      //         ?.tryPartyStatus !=
                      //     2) {
                      //   tripartyDialog(context, ref);
                      // } else {
                      //   context.goNamed(RoutesStrings.sanctionedAmount);
                      // }
                    },
                    child: Text('Add Money Requests',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.withdrawMoney);
                      // if (ref
                      //         .watch(sharedUtilityProvider)
                      //         .getUser()
                      //         ?.tryPartyStatus !=
                      //     2) {
                      //   tripartyDialog(context, ref);
                      // } else {
                      //   context.goNamed(RoutesStrings.sanctionedAmount);
                      // }
                    },
                    child: Text('Withdraw Money',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.withdrawRequests);
                      // if (ref
                      //         .watch(sharedUtilityProvider)
                      //         .getUser()
                      //         ?.tryPartyStatus !=
                      //     2) {
                      //   tripartyDialog(context, ref);
                      // } else {
                      //   context.goNamed(RoutesStrings.sanctionedAmount);
                      // }
                    },
                    child: Text('Withdraw Requests',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
              ],
            ),
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
          child: ListView(
        children: [
          ref.watch(tripsProvider).when(
              data: (data) => Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.data?.length ?? 0,
                        itemBuilder: (context, index) =>
                            Text("${data.data?[0].status ?? 0}")),
                  ),
              error: (e, s) => Container(),
              loading: () => CupertinoActivityIndicator())
        ],
      )),
    );
  }
}
