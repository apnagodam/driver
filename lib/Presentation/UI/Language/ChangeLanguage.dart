// import 'package:apnagodam_driver/Presentation/UI/Language/languageProvider.dart';
// import 'package:apnagodam_driver/Presentation/UI/Language/languageScreen.dart';
// import 'package:apnagodam_driver/Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';
// import 'package:apnagodam_driver/Presentation/Utils/color_constants.dart';
// import 'package:apnagodam_driver/Presentation/Utils/height_w.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:restart_app/restart_app.dart';

// class ChangeLanguageScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final langCode = ref.watch(languageProvider);

//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // ListTile(
//           //   leading: Icon(
//           //     Icons.language,
//           //     color: ColorConstants.primaryColorDriver,
//           //   ),
//           //   title: Text(
//           //     'changeLanguage'.tr(),
//           //     style: GoogleFonts.aBeeZee(
//           //         fontWeight: FontWeight.w600,
//           //         color: ColorConstants.primaryColorDriver,
//           //         fontSize: Adaptive.sp(14)),
//           //   ),
//           //   onTap: () {
//           //     if (ref.watch(sharedUtilityProvider).getLocale() ==
//           //         Locale('hi', 'IN')) {
//           //       ref.watch(sharedUtilityProvider).setLocale("en");
//           //     } else {
//           //       ref.watch(sharedUtilityProvider).setLocale("hi");
//           //     }
//           //     Restart.restartApp().then((value) {
//           //       // setState(() {
//           //       //   if (ref.watch(sharedUtilityProvider).getLocale() ==
//           //       //       Locale('hi', 'IN')) {
//           //       //     ref.watch(sharedUtilityProvider).setLocale("hi");
//           //       //   } else {
//           //       //     ref.watch(sharedUtilityProvider).setLocale("en");
//           //       //   }
//           //       // });
//           //     });
//           //   },
//           // ),
//           // ListTile(
//           //   leading: Icon(
//           //     Icons.language,
//           //     color: ColorConstants.primaryColorDriver,
//           //   ),
//           //   title: Text(
//           //     'changeLanguage'.tr(),
//           //     style: GoogleFonts.aBeeZee(
//           //       fontWeight: FontWeight.w600,
//           //       color: ColorConstants.primaryColorDriver,
//           //       fontSize: Adaptive.sp(14),
//           //     ),
//           //   ),
//           //   onTap: () {
//           //     // Toggle between 'hi' and 'en'
//           //     String newLocale =
//           //         context.locale.languageCode == 'hi' ? 'en' : 'hi';

//           //     // Set the new locale directly using EasyLocalization
//           //     context.setLocale(Locale(newLocale, 'IN'));

//           //     // Optionally restart the app or refresh UI
//           //     Restart.restartApp();
//           //   },
//           // ),
//           // Row(
//           //   children: [
//           //     Expanded(
//           //         child: InkWell(
//           //       onTap: () =>
//           //           ref.read(languageProvider.notifier).setLanguage('en'),
//           //       child: Container(
//           //         padding: EdgeInsets.symmetric(vertical: 6),
//           //         decoration: BoxDecoration(
//           //             border: Border.all(
//           //                 width: 2, color: ColorConstants.primaryColorDriver),
//           //             borderRadius: BorderRadius.circular(5)),
//           //         child: Center(
//           //           child: Text(
//           //             'English'.tr(),
//           //             style:
//           //                 TextStyle(color: ColorConstants.primaryColorDriver),
//           //           ),
//           //         ),
//           //       ),
//           //     )),
//           //     width20,
//           //     Expanded(
//           //         child: InkWell(
//           //       onTap: () =>
//           //           ref.read(languageProvider.notifier).setLanguage('hi'),
//           //       child: Container(
//           //         padding: EdgeInsets.symmetric(vertical: 6),
//           //         decoration: BoxDecoration(
//           //             border: Border.all(
//           //                 width: 2, color: ColorConstants.primaryColorDriver),
//           //             borderRadius: BorderRadius.circular(5)),
//           //         child: Center(
//           //           child: Text(
//           //             'Hindi'.tr(),
//           //             style:
//           //                 TextStyle(color: ColorConstants.primaryColorDriver),
//           //           ),
//           //         ),
//           //       ),
//           //     )),
//           //   ],
//           // ),

//           // ElevatedButton(
//           //   onPressed: () =>
//           //       ref.read(languageProvider.notifier).setLanguage('en'),
//           //   child: Text(AppLocalizations.getText(langCode, 'english')),
//           // ),
//           // ElevatedButton(
//           //   onPressed: () =>
//           //       ref.read(languageProvider.notifier).setLanguage('hi'),
//           //   child: Text(AppLocalizations.getText(langCode, 'hindi')),
//           // ),
//           // SizedBox(height: 20),
//           // ElevatedButton(
//           //   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage())),
//           //   child: Text(AppLocalizations.getText(langCode, 'go_to_second')),
//           // ),
//         ],
//       ),
//     );
//   }
// }
