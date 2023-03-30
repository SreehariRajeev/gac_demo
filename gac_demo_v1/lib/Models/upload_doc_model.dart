// To parse this JSON data, do
//
//     final uploadDocModel = uploadDocModelFromJson(jsonString);

import 'dart:convert';

UploadDocModel uploadDocModelFromJson(String str) => UploadDocModel.fromJson(json.decode(str));

String uploadDocModelToJson(UploadDocModel data) => json.encode(data.toJson());

class UploadDocModel {
  UploadDocModel({
    this.status,
    this.grns,
    this.data,
    this.message,
  });

  bool? status;
  String? grns;
  List<Datum>? data;
  String? message;

  factory UploadDocModel.fromJson(Map<String, dynamic> json) => UploadDocModel(
    status: json["status"],
    grns: json["grns"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "grns": grns,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    this.uploadedFile,
    this.grns,
    this.created,
    this.updated,
  });

  String? uploadedFile;
  Grns? grns;
  String? created;
  String? updated;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uploadedFile: json["uploaded_file"],
    grns: json["grns"] == null ? null : Grns.fromJson(json["grns"]),
    created: json["created"],
    updated: json["updated"],
  );

  Map<String, dynamic> toJson() => {
    "uploaded_file": uploadedFile,
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
