// To parse this JSON data, do
//
//     final driverResponseModel = driverResponseModelFromMap(jsonString);

import 'dart:convert';

DriverResponseModel driverResponseModelFromMap(String str) => DriverResponseModel.fromMap(json.decode(str));

String driverResponseModelToMap(DriverResponseModel data) => json.encode(data.toMap());

class DriverResponseModel {
  String? status;
  String? message;
  List<Datum>? data;

  DriverResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DriverResponseModel.fromMap(Map<String, dynamic> json) => DriverResponseModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  dynamic id;
  DateTime? date;
  String? tripId;
  String? transporterName;
  String? transporterPhone;
  String? userName;
  String? userPhone;
  String? fromAddress;
  String? toAddress;
  dynamic rate;
  String? commodity;
  String? weight;
  dynamic noOfBags;
  String? recevingWeight;
  dynamic recevingBags;
  String? biltyImage;
  String? kantaImage;
  dynamic goodsInvoiceImage;
  String? recevingInvoiceImage;
  String? inOutTypes;
  dynamic status;
  DateTime? tripStart;
  DateTime? tripEnd;

  Datum({
    this.id,
    this.date,
    this.tripId,
    this.transporterName,
    this.transporterPhone,
    this.userName,
    this.userPhone,
    this.fromAddress,
    this.toAddress,
    this.rate,
    this.commodity,
    this.weight,
    this.noOfBags,
    this.recevingWeight,
    this.recevingBags,
    this.biltyImage,
    this.kantaImage,
    this.goodsInvoiceImage,
    this.recevingInvoiceImage,
    this.inOutTypes,
    this.status,
    this.tripStart,
    this.tripEnd,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    tripId: json["trip_id"],
    transporterName: json["transporter_name"],
    transporterPhone: json["transporter_phone"],
    userName: json["user_name"],
    userPhone: json["user_phone"],
    fromAddress: json["from_address"],
    toAddress: json["to_address"],
    rate: json["rate"],
    commodity: json["commodity"],
    weight: json["weight"],
    noOfBags: json["no_of_bags"],
    recevingWeight: json["receving_weight"],
    recevingBags: json["receving_bags"],
    biltyImage: json["bilty_image"],
    kantaImage: json["kanta_image"],
    goodsInvoiceImage: json["goods_invoice_image"],
    recevingInvoiceImage: json["receving_invoice_image"],
    inOutTypes: json["in_out_types"],
    status: json["status"],
    tripStart: json["trip_start"] == null ? null : DateTime.parse(json["trip_start"]),
    tripEnd: json["trip_end"] == null ? null : DateTime.parse(json["trip_end"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "date": date?.toIso8601String(),
    "trip_id": tripId,
    "transporter_name": transporterName,
    "transporter_phone": transporterPhone,
    "user_name": userName,
    "user_phone": userPhone,
    "from_address": fromAddress,
    "to_address": toAddress,
    "rate": rate,
    "commodity": commodity,
    "weight": weight,
    "no_of_bags": noOfBags,
    "receving_weight": recevingWeight,
    "receving_bags": recevingBags,
    "bilty_image": biltyImage,
    "kanta_image": kantaImage,
    "goods_invoice_image": goodsInvoiceImage,
    "receving_invoice_image": recevingInvoiceImage,
    "in_out_types": inOutTypes,
    "status": status,
    "trip_start": tripStart?.toIso8601String(),
    "trip_end": tripEnd?.toIso8601String(),
  };
}
