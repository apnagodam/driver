import 'dart:convert';

import 'package:apnagodam_driver/Data/Model/DriverResponseModel.dart';
import 'package:apnagodam_driver/Domain/Dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'TripService.g.dart';

@riverpod
Future<DriverResponseModel> trips(TripsRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getTrips);
  return driverResponseModelFromMap(jsonEncode(response.data));
}
