// To parse this JSON data, do
//
//     final dropDownResult = dropDownResultFromJson(jsonString);

import 'dart:convert';

DropDownResult dropDownResultFromJson(String str) => DropDownResult.fromJson(json.decode(str));

String dropDownResultToJson(DropDownResult data) => json.encode(data.toJson());

class DropDownResult {
  DropDownResult({
    this.status,
    this.cargoData,
    this.data,
  });

  bool? status;
  List<CargoDatum>? cargoData;
  List<dynamic>? data;

  factory DropDownResult.fromJson(Map<String, dynamic> json) => DropDownResult(
    status: json["status"],
    cargoData: json["cargo_data"] == null ? [] : List<CargoDatum>.from(json["cargo_data"]!.map((x) => CargoDatum.fromJson(x))),
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "cargo_data": cargoData == null ? [] : List<dynamic>.from(cargoData!.map((x) => x.toJson())),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}

class CargoDatum {
  CargoDatum({
    this.id,
    this.cargoNumber,
  });

  int? id;
  String? cargoNumber;

  factory CargoDatum.fromJson(Map<String, dynamic> json) => CargoDatum(
    id: json["id"],
    cargoNumber: json["cargo_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cargo_number": cargoNumber,
  };
}
