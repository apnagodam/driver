
import 'package:flutter/material.dart';

class ColorConstants {
  static const Color primaryColorWSP = Color(0xffe5b10d);
  // static const Color secondaryColorWSP = Color(0xff3d7138);
  static const Color secondaryColorWSP = Color(0xff003366);

  static const Color secondaryAppColorNavyBlue = Color(0xff003366);
  // static const Color primaryColorVendor = Color(0xff3d7138);
  static const Color primaryColorVendor = Color(0xff003366);

  // static const Color primaryColorDriver = Color(0xff3d7138);
  static const Color primaryColorDriver = Color(0xff003366);

  static const Color primaryColor = Colors.white;
}
// Drawer(
      //   child: ListView(
      //     children: [
      //       InkWell(
      //         child: Card(
      //           color: Colors.white,
      //           margin: Pad(all: 10),
      //           elevation: 5,
      //           child: Column(
      //             children: [
      //               SizedBox(
      //                 height: 10,
      //               ),
                    // CircleAvatar(
                    //   foregroundImage: NetworkImage(
                    //       ref.watch(sharedUtilityProvider).getUser()?.image ??
                    //           ""),
      //                 radius: 50,
      //               ),
                    // CupertinoActionSheetAction(
                    //     onPressed: () {
                    //       context.goNamed(RoutesStrings.profile);
                    //     },
                    //     child: RowSuper(
                    //       alignment: Alignment.centerLeft,
                    //       children: [
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text(
                    //           '${ref.watch(sharedUtilityProvider).getUser()?.name ?? ""}',
                    //           style: TextStyle(
                    //               fontSize: Adaptive.sp(16),
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.w700),
                    //         )
                    //       ],
                    //     )),
            //       ],
            //     ),
            //   ),
            //   onTap: () {
            //     ref.watch(goRouterProvider).goNamed(RoutesStrings.profile);
            //   },
            // ),
      //       Card(
      //         color: Colors.white,
      //         margin: Pad(all: 10),
      //         elevation: 5,
      //         child: Column(
      //           children: [
                  // ListTile(
                  //   title: Text(
                  //     'tripsHistory'.tr(),
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: Adaptive.sp(16)),
                  //   ),
                  //   leading: Image.network(
                  //     'https://static-00.iconduck.com/assets.00/delivery-car-icon-512x423-t7gs5e74.png',
                  //     width: 25,
                  //     height: 25,
                  //   ),
                  //   onTap: () {
                  //     ref
                  //         .watch(goRouterProvider)
                  //         .goNamed(RoutesStrings.tripsHistory);
                  //   },
                  // ),
                  // Divider(),
                  // ListTile(
                  //   leading: Image.network(
                  //     'https://banner2.cleanpng.com/20181207/psa/kisspng-clip-art-vector-graphics-computer-icons-illustrati-kalyan-profi-shop-1713912417297.webp',
                  //     width: 30,
                  //     height: 30,
                  //   ),
                  //   title: Text(
                  //     'tripsInProcess'.tr(),
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: Adaptive.sp(16)),
                  //   ),
                  //   onTap: () {
                  //     ref
                  //         .watch(goRouterProvider)
                  //         .goNamed(RoutesStrings.tripsInProcess);
                  //   },
                  // ),
                  // // Divider(),
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
      //           ],
      //         ),
      //       ),

      //       // CupertinoActionSheet(
      //       //   actions: [
      //       //     // CupertinoActionSheetAction(
      //       //     //     onPressed: () async {
      //       //     //       ref
      //       //     //           .watch(createGoodsTaxInvoiceProvider(context: context)
      //       //     //               .future)
      //       //     //           .then((value) async {
      //       //     //         if (value != null) {
      //       //     //           await value
      //       //     //               .copy('/storage/emulated/0/Download/bilty.pdf');
      //       //     //           PDFDocument doc =
      //       //     //               await PDFDocument.fromFile(value ?? File(''));
      //       //     //           showBarModalBottomSheet(
      //       //     //               context: context,
      //       //     //               builder: (context) => PDFViewer(document: doc));
      //       //     //         }
      //       //     //       });
      //       //     //       //context.goNamed(RoutesStrings.profile);
      //       //     //     },
      //       //     //     child: Text('Goods Invoice',
      //       //     //         textAlign: TextAlign.start,
      //       //     //         style: TextStyle(
      //       //     //             fontSize: Adaptive.sp(16),
      //       //     //             color: Colors.black,
      //       //     //             fontWeight: FontWeight.w500))),
      //       //     // CupertinoActionSheetAction(
      //       //     //     onPressed: () async {
      //       //     //       ref
      //       //     //           .watch(
      //       //     //               createFreightPdfProvider(context: context).future)
      //       //     //           .then((value) async {
      //       //     //         if (value != null) {
      //       //     //           await value
      //       //     //               .copy('/storage/emulated/0/Download/bilty.pdf');
      //       //     //           PDFDocument doc =
      //       //     //               await PDFDocument.fromFile(value ?? File(''));
      //       //     //           showBarModalBottomSheet(
      //       //     //               context: context,
      //       //     //               builder: (context) => PDFViewer(document: doc));
      //       //     //         }
      //       //     //       });
      //       //     //       //context.goNamed(RoutesStrings.profile);
      //       //     //     },
      //       //     //     child: Text('Freight Invoice',
      //       //     //         textAlign: TextAlign.start,
      //       //     //         style: TextStyle(
      //       //     //             fontSize: Adaptive.sp(16),
      //       //     //             color: Colors.black,
      //       //     //             fontWeight: FontWeight.w500))),
      //       //     // CupertinoActionSheetAction(
      //       //     //     onPressed: () async {
      //       //     //       // ref
      //       //     //       //     .watch(
      //       //     //       //         createBiltyPdfProvider(context: context).future)
      //       //     //       //     .then((value) async {
      //       //     //       //   if (value != null) {
      //       //     //       //     await value
      //       //     //       //         .copy('/storage/emulated/0/Download/bilty.pdf');
      //       //     //       //     PDFDocument doc =
      //       //     //       //         await PDFDocument.fromFile(value ?? File(''));
      //       //     //       //     showBarModalBottomSheet(
      //       //     //       //         context: context,
      //       //     //       //         builder: (context) => PDFViewer(document: doc));
      //       //     //       //   }
      //       //     //       // });
      //       //     //       //context.goNamed(RoutesStrings.profile);
      //       //     //     },
      //       //     //     child: Text('Bilty',
      //       //     //         textAlign: TextAlign.start,
      //       //     //         style: TextStyle(
      //       //     //             fontSize: Adaptive.sp(16),
      //       //     //             color: Colors.black,
      //       //     //             fontWeight: FontWeight.w500))),
      //       //     CupertinoActionSheetAction(
      //       //         onPressed: () {
      //       //           context.goNamed(RoutesStrings.moneyRequests);
      //       //           // if (ref
      //       //           //         .watch(sharedUtilityProvider)
      //       //           //         .getUser()
      //       //           //         ?.tryPartyStatus !=
      //       //           //     2) {
      //       //           //   tripartyDialog(context, ref);
      //       //           // } else {
      //       //           //   context.goNamed(RoutesStrings.sanctionedAmount);
      //       //           // }
      //       //         },
      //       //         child: Text('Add Money Requests',
      //       //             textAlign: TextAlign.start,
      //       //             style: TextStyle(
      //       //                 fontSize: Adaptive.sp(16),
      //       //                 color: Colors.black,
      //       //                 fontWeight: FontWeight.w500))),
      //       //     CupertinoActionSheetAction(
      //       //         onPressed: () {
      //       //           context.goNamed(RoutesStrings.withdrawMoney);
      //       //           // if (ref
      //       //           //         .watch(sharedUtilityProvider)
      //       //           //         .getUser()
      //       //           //         ?.tryPartyStatus !=
      //       //           //     2) {
      //       //           //   tripartyDialog(context, ref);
      //       //           // } else {
      //       //           //   context.goNamed(RoutesStrings.sanctionedAmount);
      //       //           // }
      //       //         },
      //       //         child: Text('Withdraw Money',
      //       //             textAlign: TextAlign.start,
      //       //             style: TextStyle(
      //       //                 fontSize: Adaptive.sp(16),
      //       //                 color: Colors.black,
      //       //                 fontWeight: FontWeight.w500))),
      //       //     CupertinoActionSheetAction(
      //       //         onPressed: () {
      //       //           context.goNamed(RoutesStrings.withdrawRequests);
      //       //           // if (ref
      //       //           //         .watch(sharedUtilityProvider)
      //       //           //         .getUser()
      //       //           //         ?.tryPartyStatus !=
      //       //           //     2) {
      //       //           //   tripartyDialog(context, ref);
      //       //           // } else {
      //       //           //   context.goNamed(RoutesStrings.sanctionedAmount);
      //       //           // }
      //       //         },
      //       //         child: Text('Withdraw Requests',
      //       //             textAlign: TextAlign.start,
      //       //             style: TextStyle(
      //       //                 fontSize: Adaptive.sp(16),
      //       //                 color: Colors.black,
      //       //                 fontWeight: FontWeight.w500))),
      //       //   ],
      //       // ),

      //       CupertinoActionSheet(
      //         actions: [
      //           CupertinoActionSheetAction(
                    // onPressed: () async {
                    //   ref.watch(sharedPreferencesProvider).clear();
                    //   context.go(RoutesStrings.login);
                    // },
      //               child: Text(
      //                 'logout'.tr(),
      //                 style: TextStyle(
      //                     fontSize: Adaptive.sp(16),
      //                     color: Colors.red,
      //                     fontWeight: FontWeight.w700),
      //               )),
      //         ],
      //       )
      //     ],
      //   ),
      // ),