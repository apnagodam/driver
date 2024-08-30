import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';

part 'DioProvider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(baseUrl: ApiClient.baseUrl, headers: {
    "Authorization": "${ref.watch(sharedUtilityProvider).getToken()}",
  }))
    ..interceptors.add(LogInterceptor(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
    ));
}

class ApiClient {
  static const baseUrl = "https://apnagodam.com/test/driver_api/";

/*
state and district api
*
*
*
*/

  static const getStates = "states";
  static const getDistricts = 'district-list';

  /*
Authentication api
*
*
*
*/
  static const registerUser = 'register';
  static const verifyOtp = 'driver_verify_otp';
  static const login = 'login';
  static const sendOtp = 'driver_send_otp';

  /*
trip api
*
*
*
*/
  static const getTrips = 'driver_trip_request';
}
