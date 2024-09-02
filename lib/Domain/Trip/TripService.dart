import 'dart:convert';

import 'package:apnagodam_driver/Data/Model/BiltyResponseModel.dart';
import 'package:apnagodam_driver/Data/Model/DriverResponseModel.dart';
import 'package:apnagodam_driver/Domain/Dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'TripService.g.dart';

@riverpod
Future<DriverResponseModel> trips(TripsRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getTrips);
  return driverResponseModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<BiltyResponseData> tripData(TripDataRef ref,
    {required String? tripRequestid}) async {
  var response = await ref.watch(dioProvider).get(ApiClient.biltyPdfData,
      queryParameters: {'trip_request_id': tripRequestid});

  return biltyResponseDataFromMap(jsonEncode(response.data));
}
