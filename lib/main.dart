import 'dart:io';
import 'package:apnagodam_driver/Presentation/Utils/color_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:one_context/one_context.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';
import 'Presentation/Routes/routes.dart';
import 'Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();

  if (Platform.isAndroid) {
    InAppUpdate.checkForUpdate().then((updateInfo) {
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {}
          });
        } else if (updateInfo.flexibleUpdateAllowed) {
          InAppUpdate.startFlexibleUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              InAppUpdate.completeFlexibleUpdate();
            }
          });
        }
      }
    });
  }

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ToastificationWrapper(
            child: EasyLocalization(
                fallbackLocale: Locale('en', 'IN'),
                startLocale: Locale('hi', 'IN'),
                supportedLocales: [Locale('hi', 'IN'), Locale('en', 'US')],
                path: 'assets/translations',
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  builder: OneContext().builder,
                  navigatorKey: OneContext().key,
                  home: const MyApp(),
                )));
      },
    ),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(context.supportedLocales);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(goRouterProvider),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: ref.watch(sharedUtilityProvider).getLocale(),
      title: 'driver'.tr(),
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorConstants.primaryColorDriver),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            color: ColorConstants.primaryColorDriver,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Adaptive.sp(18),
                color: Colors.white)),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}


