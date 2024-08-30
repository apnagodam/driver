import 'dart:convert';

import 'package:apnagodam_driver/Data/Model/LoginResponseModel.dart';
import 'package:apnagodam_driver/Domain/Dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'AuthenticationService.g.dart';

@riverpod
Future<Map<String, dynamic>> sendOtp(SendOtpRef ref, {String? number}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.sendOtp,
      queryParameters: {
        'number': number,
        'app_type': "Driver",
        "otp_type": '',
        "fcm_token": ""
      });
  return jsonDecode(response.data);
}

@riverpod
Future<LoginResponseModel> verifyOtp(VerifyOtpRef ref,
    {String? number, String? otp}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.verifyOtp,
      queryParameters: {'number': number, 'otp': otp, "fcm_token": ""});
  return loginResponseModelFromMap(jsonEncode(response.data));
}
