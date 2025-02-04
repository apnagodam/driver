// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromMap(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromMap(String str) => LoginResponseModel.fromMap(json.decode(str));

String loginResponseModelToMap(LoginResponseModel data) => json.encode(data.toMap());

class LoginResponseModel {
  String? authorization;
  UserDetails? userDetails;
  int? status;
  String? message;

  LoginResponseModel({
    this.authorization,
    this.userDetails,
    this.status,
    this.message,
  });

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) => LoginResponseModel(
    authorization: json["Authorization"],
    userDetails: json["user_details"] == null ? null : UserDetails.fromMap(json["user_details"]),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "Authorization": authorization,
    "user_details": userDetails?.toMap(),
    "status": status,
    "message": message,
  };
}

class UserDetails {
  int? id;
  int? userId;
  String? name;
  dynamic email;
  String? phone;
  int? wallet;
  String? address;
  String? city;
  String? state;
  int? pincode;
  String? bankName;
  String? bankBranch;
  String? accountNo;
  String? ifscCode;
  String? license;
  String? licenseImage;
  String? chequePassbook;
  String? pancardImage;
  String? aadharImage;
  String? aadharBackImage;
  String? pancardNo;
  String? aadharNo;
  int? approve;
  int? approveBy;
  String? image;
  int? verify;
  int? verifyBy;
  int? empId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserDetails({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.phone,
    this.wallet,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.bankName,
    this.bankBranch,
    this.accountNo,
    this.ifscCode,
    this.license,
    this.licenseImage,
    this.chequePassbook,
    this.pancardImage,
    this.aadharImage,
    this.aadharBackImage,
    this.pancardNo,
    this.aadharNo,
    this.approve,
    this.approveBy,
    this.image,
    this.verify,
    this.verifyBy,
    this.empId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    wallet: json["wallet"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    bankName: json["bank_name"],
    bankBranch: json["bank_branch"],
    accountNo: json["account_no"],
    ifscCode: json["ifsc_code"],
    license: json["license"],
    licenseImage: json["license_image"],
    chequePassbook: json["cheque_passbook"],
    pancardImage: json["pancard_image"],
    aadharImage: json["aadhar_image"],
    aadharBackImage: json["aadhar_back_image"],
    pancardNo: json["pancard_no"],
    aadharNo: json["aadhar_no"],
    approve: json["approve"],
    approveBy: json["approve_by"],
    image: json["image"],
    verify: json["verify"],
    verifyBy: json["verify_by"],
    empId: json["emp_id"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "email": email,
    "phone": phone,
    "wallet": wallet,
    "address": address,
    "city": city,
    "state": state,
    "pincode": pincode,
    "bank_name": bankName,
    "bank_branch": bankBranch,
    "account_no": accountNo,
    "ifsc_code": ifscCode,
    "license": license,
    "license_image": licenseImage,
    "cheque_passbook": chequePassbook,
    "pancard_image": pancardImage,
    "aadhar_image": aadharImage,
    "aadhar_back_image": aadharBackImage,
    "pancard_no": pancardNo,
    "aadhar_no": aadharNo,
    "approve": approve,
    "approve_by": approveBy,
    "image": image,
    "verify": verify,
    "verify_by": verifyBy,
    "emp_id": empId,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
