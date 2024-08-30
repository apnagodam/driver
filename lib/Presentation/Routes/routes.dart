import 'package:apnagodam_driver/Presentation/Routes/routes_strings.dart';
import 'package:apnagodam_driver/Presentation/UI/Authentication/LoginScreen.dart';
import 'package:apnagodam_driver/Presentation/UI/Authentication/RegistrationScreen.dart';
import 'package:apnagodam_driver/Presentation/UI/Authentication/VerifyOtp.dart';
import 'package:apnagodam_driver/Presentation/UI/Home/Dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Utils/Preferences/SharedPrefs/SharedUtility.dart';

part 'routes.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
      debugLogDiagnostics: kDebugMode,
      redirect: (context, state) {
        if (ref.watch(sharedUtilityProvider).getToken().isEmpty) {
          if (state.fullPath == RoutesStrings.dashboard)
            return RoutesStrings.login;
          return null;
        }
      },
      routes: [
        GoRoute(
          path: RoutesStrings.dashboard,
          name: RoutesStrings.dashboard,
          builder: (context, state) => const Dashboard(),
        ),
        GoRoute(
            path: RoutesStrings.login,
            name: RoutesStrings.login,
            builder: (context, state) => const Loginscreen(),
            routes: [
              GoRoute(
                  path: RoutesStrings.verifyOtp,
                  name: RoutesStrings.verifyOtp,
                  builder: (context, state) {
                    final data = state.extra! as Map<String, dynamic>;
                    return Verifyotp(
                      mobileNumber: data['mobile'],
                    );
                  }),
              GoRoute(
                  path: RoutesStrings.register,
                  name: RoutesStrings.register,
                  builder: (context, state) => const Registrationscreen()),
            ]),
      ]);
}
