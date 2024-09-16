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

@riverpod
Future<Map<String, dynamic>> endTrip(EndTripRef ref,
    {String? tripRequestId,
    String? kantaWeight,
    String? bags,
    String? kantaImage,
    String? qualityImage}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.tripEnd, data:{
    'trip_request_id': tripRequestId,
    'kanta_weight': kantaWeight,
    'bags': bags,
    'kanta_img': kantaImage,
    'quality_img': qualityImage
  } );
  return response.data;
}
