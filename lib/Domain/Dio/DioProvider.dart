import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';

part 'DioProvider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(baseUrl: ApiClient.testBaseUrl, headers: {
    "Authorization": "${ref.watch(sharedUtilityProvider).getToken()}",
  },connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1)))
    ..interceptors.add(LogInterceptor(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
    ));
}
class ImageClient {
  static const employeeImageUrl =
      "https://apnagodam.com/resources/assets/upload/employees/";
  static const frontEndAssetsUrl =
      "https://apnagodam.com/resources/frontend_asse-ts/uploads/";
  static const assetsImageUrl =
      "https://apnagodam.com/resources/assets/upload/";
  static const displegedImageUrl =
      "https://apnagodam.com/resources/assets/upload/displedge/";

  static const conveyanceImageUrl =
      'https://apnagodam.com/test/resources/assets/upload/conveyance/';
}
class ApiClient {
  static const baseUrl = "https://apnagodam.com/driver_api/";
    static const testBaseUrl = "https://apnagodam.com/test/driver_api/";


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
  static const biltyPdfData = 'bilty_data';
  static const tripEnd ='driver_trip_request_update';
}
