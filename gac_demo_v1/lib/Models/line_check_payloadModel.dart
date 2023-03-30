// To parse this JSON data, do
//
//     final lineCheckPayloadModel = lineCheckPayloadModelFromJson(jsonString);

import 'dart:convert';

LineCheckPayloadModel lineCheckPayloadModelFromJson(String str) => LineCheckPayloadModel.fromJson(json.decode(str));

String lineCheckPayloadModelToJson(LineCheckPayloadModel data) => json.encode(data.toJson());

class LineCheckPayloadModel {
  LineCheckPayloadModel({
    this.items,
  });

  List<Item>? items;

  factory LineCheckPayloadModel.fromJson(Map<String, dynamic> json) => LineCheckPayloadModel(
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.cargo,
    this.itemData,
    this.uploadedFile,
    this.noDescrepency,
  });

  int? cargo;
  String? itemData;
  String? uploadedFile;
  int? noDescrepency;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    cargo: json["cargo"],
    itemData: json["item_data"],
    uploadedFile: json["uploaded_file"],
    noDescrepency: json["no_descrepency"],
  );

  Map<String, dynamic> toJson() => {
    "cargo": cargo,
    "item_data": itemData,
    "uploaded_file": uploadedFile,
    "no_descrepency": noDescrepency,
  };
}
