import 'dart:convert';
import 'package:http/http.dart' as http;

class Branch {
  final int id;
  final String name;
  final String imageName;
  final String address;
  final int startTime;
  final int closeTime;
  final int room;
  final String mobileNumber;
  final bool isActive;

  Branch({
    required this.id,
    required this.name,
    required this.imageName,
    required this.address,
    required this.startTime,
    required this.closeTime,
    required this.room,
    required this.mobileNumber,
    required this.isActive,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'],
      name: json['name'],
      imageName: json['imageName'],
      address: json['address'],
      startTime: json['startTime'],
      closeTime: json['closeTime'],
      room: json['room'],
      mobileNumber: json['mobileNumber'],
      isActive: json['isActive'],
    );
  }
}

class ApiResponse {
  final List<Branch> listResult;
  final bool isSuccess;
  final int affectedRecords;
  final String statusMessage;
  final List<dynamic> validationErrors;
  final dynamic exception;
  final dynamic links;

  ApiResponse({
    required this.listResult,
    required this.isSuccess,
    required this.affectedRecords,
    required this.statusMessage,
    required this.validationErrors,
    required this.exception,
    required this.links,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> listResultJson = json['listResult'] ?? [];
    List<Branch> listResult =
        listResultJson.map((e) => Branch.fromJson(e)).toList();

    return ApiResponse(
      listResult: listResult,
      isSuccess: json['isSuccess'],
      affectedRecords: json['affectedRecords'],
      statusMessage: json['statusMessage'],
      validationErrors: json['validationErrors'] ?? [],
      exception: json['exception'],
      links: json['links'],
    );
  }
}
