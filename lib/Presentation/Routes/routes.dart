// ignore_for_file: body_might_complete_normally_nullable

import 'package:apnagodam_driver/Presentation/Routes/routes_strings.dart';
import 'package:apnagodam_driver/Presentation/UI/Authentication/LoginScreen.dart';
import 'package:apnagodam_driver/Presentation/UI/Authentication/OnbordScreen.dart';
import 'package:apnagodam_driver/Presentation/UI/Authentication/RegistrationScreen.dart';
import 'package:apnagodam_driver/Presentation/UI/Authentication/VerifyOtp.dart';
import 'package:apnagodam_driver/Presentation/UI/Home/Dashboard.dart';
import 'package:apnagodam_driver/Presentation/UI/Home/TripTypes/EndTrips.dart';
import 'package:apnagodam_driver/Presentation/UI/Home/TripTypes/StartTrips.dart';
import 'package:apnagodam_driver/Presentation/UI/Home/TripsInProcess.dart';
import 'package:apnagodam_driver/Presentation/UI/Profile/ProfileScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Data/Model/DriverResponseModel.dart';
import '../../Domain/Trip/Paoti/PaotiEndTrip.dart';
import '../UI/Home/Tripshistory.dart';
import '../Utils/Preferences/SharedPrefs/SharedUtility.dart';

part 'routes.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
      debugLogDiagnostics: kDebugMode,
      redirect: (context, state) {
        if (ref.watch(sharedUtilityProvider).getToken().isEmpty) {
          if (state.fullPath == RoutesStrings.dashboard)
            return RoutesStrings.onbord;
          return null;
        }
      },
      routes: [
        GoRoute(
            path: RoutesStrings.dashboard,
            name: RoutesStrings.dashboard,
            builder: (context, state) =>  Dashboard(),
            routes: [
              GoRoute(
                  path: RoutesStrings.profile,
                  name: RoutesStrings.profile,
                  builder: (context, state) => const Profilescreen()),
              GoRoute(
                  path: RoutesStrings.tripsHistory,
                  name: RoutesStrings.tripsHistory,
                  builder: (context, state) => const Tripshistory()),
              GoRoute(
                  path: RoutesStrings.tripsInProcess,
                  name: RoutesStrings.tripsInProcess,
                  builder: (context, state) => const Tripsinprocess()),
              GoRoute(
                path: RoutesStrings.paotiEndTrip,
                name: RoutesStrings.paotiEndTrip,
                builder: (context, state) {
                  Datum? dataList = state.extra as Datum?;
                  return Paotiendtrip(dataList: dataList);
                },
              ),
              GoRoute(
                  path: RoutesStrings.startTrips,
                  name: RoutesStrings.startTrips,
                  builder: (context, state) => const Starttrips()),
              GoRoute(
                  path: RoutesStrings.endTrips,
                  name: RoutesStrings.endTrips,
                  builder: (context, state) => const Endtrips()),
            ]),
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
        GoRoute(
            path: RoutesStrings.onbord,
            name: RoutesStrings.onbord,
            builder: (context, state) => OnBordingScreen(),
            routes: [])
      ]);
}
