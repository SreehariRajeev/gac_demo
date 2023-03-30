import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'search_model.freezed.dart';
part 'search_model.g.dart';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

@freezed
class SearchModel with _$SearchModel {
    const factory SearchModel({
        required bool status,
        required Page page,
    }) = _SearchModel;

    factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);
}

@freezed
class Page with _$Page {
    const factory Page({
        required int end_index,
        required bool has_next,
        required bool has_other_pages,
        required bool has_previous,
        required int start_index,
        required int number,
        required int num_pages,
        required List<Item> items,
    }) = _Page;

    factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}

@freezed
class Item with _$Item {
    const factory Item({
        required String customer,
        required int pieces,
        required String supplier,
        required String po_number,
        required String consignee,
        required int number_of_items,
        required bool no_damage,
        required bool link_check_required,
        required int id,
        required String grns_number,
        required String status,
        required String qr_code,
        required String created,
        required String updated,
        required dynamic transfer_to_dm,
        required String line_check_started,
        required String current_step,
        required String created_time,
    }) = _Item;

    factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}