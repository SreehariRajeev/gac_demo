// To parse this JSON data, do
//
//     final extrnalImageModel = extrnalImageModelFromJson(jsonString);

import 'dart:convert';

ExtrnalImageModel extrnalImageModelFromJson(String str) => ExtrnalImageModel.fromJson(json.decode(str));

String extrnalImageModelToJson(ExtrnalImageModel data) => json.encode(data.toJson());

class ExtrnalImageModel {
  ExtrnalImageModel({
    this.status,
    this.grns,
    this.message,
  });

  bool? status;
  String? grns;
  String? message;

  factory ExtrnalImageModel.fromJson(Map<String, dynamic> json) => ExtrnalImageModel(
    status: json["status"] ?? null,
    grns: json["grns"] ??null,
    message: json["message"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "status": status ?? null,
    "grns": grns ?? null,
    "message": message ?? null,
  };
}
