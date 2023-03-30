// To parse this JSON data, do
//
//     final receiptSummary = receiptSummaryFromJson(jsonString);

import 'dart:convert';

ReceiptSummary receiptSummaryFromJson(String str) =>
    ReceiptSummary.fromJson(json.decode(str));

String receiptSummaryToJson(ReceiptSummary data) => json.encode(data.toJson());

class ReceiptSummary {
  ReceiptSummary({
    this.status,
    this.grnsData,
  });

  bool? status;
  GrnsData? grnsData;

  factory ReceiptSummary.fromJson(Map<String, dynamic> json) => ReceiptSummary(
        status: json["status"],
        grnsData: GrnsData.fromJson(json["grns_data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "grns_data": grnsData!.toJson(),
      };
}

class GrnsData {
  GrnsData({
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
  dynamic qrCode;
  String? created;
  String? updated;
  dynamic transferToDm;
  dynamic lineCheckStarted;
  String? currentStep;
  String? createdTime;



  factory GrnsData.fromJson(Map<String, dynamic> json) => GrnsData(
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
        createdTime: json["created_time"] ??  null,

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
