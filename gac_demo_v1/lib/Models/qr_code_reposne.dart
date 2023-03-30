// To parse this JSON data, do
//
//     final getQrResponse = getQrResponseFromJson(jsonString);

import 'dart:convert';

GetQrResponse getQrResponseFromJson(String str) =>
    GetQrResponse.fromJson(json.decode(str));

String getQrResponseToJson(GetQrResponse data) => json.encode(data.toJson());

class GetQrResponse {
  GetQrResponse({
    this.status,
    this.packagePicture,
    this.documentUpload,
    this.cargoQrCode,
    this.lineCheck,
    this.grnsData,
  });

  bool? status;
  int? packagePicture;
  int? documentUpload;
  List<CargoQrCode>? cargoQrCode;
  List<dynamic>? lineCheck;
  Grns? grnsData;

  factory GetQrResponse.fromJson(Map<String, dynamic> json) => GetQrResponse(
        status: json["status"],
        packagePicture: json["package_picture"],
        documentUpload: json["document_upload"],
        cargoQrCode: json["cargo_qr_code"] == null
            ? []
            : List<CargoQrCode>.from(
                json["cargo_qr_code"]!.map((x) => CargoQrCode.fromJson(x))),
        lineCheck: json["line_check"] == null
            ? []
            : List<dynamic>.from(json["line_check"]!.map((x) => x)),
        grnsData:
            json["grns_data"] == null ? null : Grns.fromJson(json["grns_data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "package_picture": packagePicture,
        "document_upload": documentUpload,
        "cargo_qr_code": cargoQrCode == null
            ? []
            : List<dynamic>.from(cargoQrCode!.map((x) => x.toJson())),
        "line_check": lineCheck == null
            ? []
            : List<dynamic>.from(lineCheck!.map((x) => x)),
        "grns_data": grnsData?.toJson(),
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
        pieces: json["pieces"],
        cargoNumber: json["cargo_number"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        weight: json["weight"],
        location: json["location"],
        locationQrCode: json["location_qr_code"],
        id: json["id"],
        qrCode: json["qr_code"],
        grns: json["grns"] == null ? null : Grns.fromJson(json["grns"]),
        created: json["created"],
        updated: json["updated"],
      );

  Map<String, dynamic> toJson() => {
        "pieces": pieces,
        "cargo_number": cargoNumber,
        "length": length,
        "width": width,
        "height": height,
        "weight": weight,
        "location": location,
        "location_qr_code": locationQrCode,
        "id": id,
        "qr_code": qrCode,
        "grns": grns?.toJson(),
        "created": created,
        "updated": updated,
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
        customer: json["customer"],
        pieces: json["pieces"],
        supplier: json["supplier"],
        poNumber: json["po_number"],
        consignee: json["consignee"],
        numberOfItems: json["number_of_items"],
        noDamage: json["no_damage"],
        linkCheckRequired: json["link_check_required"],
        id: json["id"],
        grnsNumber: json["grns_number"],
        status: json["status"],
        qrCode: json["qr_code"],
        created: json["created"],
        updated: json["updated"],
        transferToDm: json["transfer_to_dm"],
        lineCheckStarted: json["line_check_started"],
        currentStep: json["current_step"],
        createdTime: json["created_time"],
      );

  Map<String, dynamic> toJson() => {
        "customer": customer,
        "pieces": pieces,
        "supplier": supplier,
        "po_number": poNumber,
        "consignee": consignee,
        "number_of_items": numberOfItems,
        "no_damage": noDamage,
        "link_check_required": linkCheckRequired,
        "id": id,
        "grns_number": grnsNumber,
        "status": status,
        "qr_code": qrCode,
        "created": created,
        "updated": updated,
        "transfer_to_dm": transferToDm,
        "line_check_started": lineCheckStarted,
        "current_step": currentStep,
        "created_time": createdTime,
      };
}
