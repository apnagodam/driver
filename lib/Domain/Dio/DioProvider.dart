import 'package:apnagodam_driver/Domain/Dio/DioInterceptor.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Presentation/Utils/Preferences/SharedPrefs/SharedUtility.dart';

part 'DioProvider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(
      baseUrl: ApiClient.testBaseUrl,
      headers: {
        "Authorization": "${ref.watch(sharedUtilityProvider).getToken()}",
      },
      connectTimeout: const Duration(minutes: 45),
      receiveTimeout: const Duration(minutes: 45),
      sendTimeout: const Duration(minutes: 45)))
      ..interceptors.add(DioInterceptor(ref))
      ..interceptors.add(LogInterceptor(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
    ));
}

@riverpod
Dio dioStates(DioStatesRef ref) {
  return Dio(BaseOptions(
      baseUrl: ApiClient.statesUrl,
      headers: {
        "Authorization": "${ref.watch(sharedUtilityProvider).getToken()}",
      },
      connectTimeout: const Duration(minutes: 45),
      receiveTimeout: const Duration(minutes: 45),
      sendTimeout: const Duration(minutes: 45)));
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
  static const testBaseUrl = "https://test.apnagodam.com/driver_api/";

  /*
  sates url from api controller.php
*/
  static const statesUrl = 'https://test.apnagodam.com/api/';

/*
state and district api
*
*
*
*/
  static const getStates = "get_state_name_new";
  static const getDistricts = 'district-list-new';

  /*
Authentication api
*
*
*
*/

  static const registerUser = 'driver_store';
  static const verifyOtp = 'driver_verify_otp';
  static const login = 'login';
  static const sendOtp = 'v1_driver_send_otp';

/*
trip api
*
*
*
*/
  static const getTrips = 'driver_trip_request';
  static const getTripsHistory = 'trip_history';
  static const biltyPdfData = 'bilty_data';
  static const tripEnd = 'driver_trip_request_update';
}
