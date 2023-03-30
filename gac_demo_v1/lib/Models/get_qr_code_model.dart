// To parse this JSON data, do
//
//     final getQrCodeModel = getQrCodeModelFromJson(jsonString);

import 'dart:convert';

GetQrCodeModel getQrCodeModelFromJson(String str) =>
    GetQrCodeModel.fromJson(json.decode(str));

String getQrCodeModelToJson(GetQrCodeModel data) => json.encode(data.toJson());

class GetQrCodeModel {
  GetQrCodeModel({
    this.status,
    this.cargoQrCode,
    this.grnsQrCode,
  });

  bool? status;
  List<CargoQrCode>? cargoQrCode;
  Grns? grnsQrCode;

  factory GetQrCodeModel.fromJson(Map<String, dynamic> json) => GetQrCodeModel(
        status: json["status"] ?? null,
        cargoQrCode: json["cargo_qr_code"] == null
            ? null
            : List<CargoQrCode>.from(
                json["cargo_qr_code"].map((x) => CargoQrCode.fromJson(x))),
        grnsQrCode: json["grns_qr_code"] == null
            ? null
            : Grns.fromJson(json["grns_qr_code"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? null,
        "cargo_qr_code": cargoQrCode == null
            ? null
            : List<dynamic>.from(cargoQrCode!.map((x) => x.toJson())),
        "grns_qr_code": grnsQrCode == null ? null : grnsQrCode!.toJson(),
      };
}

class CargoQrCode {
  CargoQrCode({
    this.pieces,
    this.cargoNumber,
    this.length,
    this.width,
    this.height,
    this.weight,
    this.location,
    this.locationQrCode,
    this.id,
    this.qrCode,
    this.grns,
    this.created,
    this.updated,
  });

  int? pieces;
  String? cargoNumber;
  dynamic length;
  dynamic width;
  dynamic height;
  dynamic weight;
  dynamic location;
  dynamic locationQrCode;
  int? id;
  String? qrCode;
  Grns? grns;
  String? created;
  String? updated;

  factory CargoQrCode.fromJson(Map<String, dynamic> json) => CargoQrCode(
        pieces: json["pieces"] ?? null,
        cargoNumber: json["cargo_number"] ?? null,
        length: json["length"] ?? null,
        width: json["width"] ?? null,
        height: json["height"] ?? null,
        weight: json["weight"] ?? null,
        location: json["location"] ?? null,
        locationQrCode: json["location_qr_code"] ?? null,
        id: json["id"] ?? null,
        qrCode: json["qr_code"] ?? null,
        grns: json["grns"] == null ? null : Grns.fromJson(json["grns"]),
        created: json["created"] ?? null,
        updated: json["updated"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "pieces": pieces ?? null,
        "cargo_number": cargoNumber ?? null,
        "length": length ?? null,
        "width": width ?? null,
        "height": height ?? null,
        "weight": weight ?? null,
        "location": location ?? null,
        "location_qr_code": locationQrCode ?? null,
        "id": id ?? null,
        "qr_code": qrCode ?? null,
        "grns": grns!.toJson(),
        "created": created ?? null,
        "updated": updated ?? null,
      };
}

class Grns {
  Grns({
    this.customer,
    this.pieces,
    this.supplier,
    this.poNumber,
    this.consignee,
    this.numberOfItems,
    this.noDamage,
    this.linkCheckRequired,
    this.id,
    this.grnsNumber,
    this.status,
    this.qrCode,
    this.created,
    this.updated,
    this.transferToDm,
    this.lineCheckStarted,
    this.currentStep,
    this.createdTime,
  });

  String? customer;
  int? pieces;
  String? supplier;
  String? poNumber;
  String? consignee;
  int? numberOfItems;
  bool? noDamage;
  bool? linkCheckRequired;
  int? id;
  String? grnsNumber;
  String? status;
  String? qrCode;
  String? created;
  String? updated;
  dynamic transferToDm;
  dynamic lineCheckStarted;
  String? currentStep;
  String? createdTime;

  factory Grns.fromJson(Map<String, dynamic> json) => Grns(
        customer: json["customer"] ?? null,
        pieces: json["pieces"] ?? null,
        supplier: json["supplier"] ?? null,
        poNumber: json["po_number"] ?? null,
        consignee: json["consignee"] ?? null,
        numberOfItems: json["number_of_items"] ?? null,
        noDamage: json["no_damage"] ?? null,
        linkCheckRequired: json["link_check_required"] ?? null,
        id: json["id"] ?? null,
        grnsNumber: json["grns_number"] ?? null,
        status: json["status"] ?? null,
        qrCode: json["qr_code"] ?? null,
        created: json["created"] ?? null,
        updated: json["updated"] ?? null,
        transferToDm: json["transfer_to_dm"] ?? null,
        lineCheckStarted: json["line_check_started"] ?? null,
        currentStep: json["current_step"] ?? null,
        createdTime: json["created_time"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "customer": customer ?? null,
        "pieces": pieces ?? null,
        "supplier": supplier ?? null,
        "po_number": poNumber ?? null,
        "consignee": consignee ?? null,
        "number_of_items": numberOfItems ?? null,
        "no_damage": noDamage ?? null,
        "link_check_required": linkCheckRequired ?? null,
        "id": id ?? null,
        "grns_number": grnsNumber ?? null,
        "status": status ?? null,
        "qr_code": qrCode ?? null,
        "created": created ?? null,
        "updated": updated ?? null,
        "transfer_to_dm": transferToDm ?? null,
        "line_check_started": lineCheckStarted ?? null,
        "current_step": currentStep ?? null,
        "created_time": createdTime ?? null,
      };
}
