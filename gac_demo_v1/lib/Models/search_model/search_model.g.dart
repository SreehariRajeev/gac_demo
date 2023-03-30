// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchModel _$$_SearchModelFromJson(Map<String, dynamic> json) =>
    _$_SearchModel(
      status: json['status'] as bool,
      page: Page.fromJson(json['page'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SearchModelToJson(_$_SearchModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'page': instance.page,
    };

_$_Page _$$_PageFromJson(Map<String, dynamic> json) => _$_Page(
      end_index: json['end_index'] as int,
      has_next: json['has_next'] as bool,
      has_other_pages: json['has_other_pages'] as bool,
      has_previous: json['has_previous'] as bool,
      start_index: json['start_index'] as int,
      number: json['number'] as int,
      num_pages: json['num_pages'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PageToJson(_$_Page instance) => <String, dynamic>{
      'end_index': instance.end_index,
      'has_next': instance.has_next,
      'has_other_pages': instance.has_other_pages,
      'has_previous': instance.has_previous,
      'start_index': instance.start_index,
      'number': instance.number,
      'num_pages': instance.num_pages,
      'items': instance.items,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      customer: json['customer'] as String,
      pieces: json['pieces'] as int,
      supplier: json['supplier'] as String,
      po_number: json['po_number'] as String,
      consignee: json['consignee'] as String,
      number_of_items: json['number_of_items'] as int,
      no_damage: json['no_damage'] as bool,
      link_check_required: json['link_check_required'] as bool,
      id: json['id'] as int,
      grns_number: json['grns_number'] as String,
      status: json['status'] as String,
      qr_code: json['qr_code'] as String,
      created: json['created'] as String,
      updated: json['updated'] as String,
      transfer_to_dm: json['transfer_to_dm'],
      line_check_started: json['line_check_started'] as String,
      current_step: json['current_step'] as String,
      created_time: json['created_time'] as String,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'customer': instance.customer,
      'pieces': instance.pieces,
      'supplier': instance.supplier,
      'po_number': instance.po_number,
      'consignee': instance.consignee,
      'number_of_items': instance.number_of_items,
      'no_damage': instance.no_damage,
      'link_check_required': instance.link_check_required,
      'id': instance.id,
      'grns_number': instance.grns_number,
      'status': instance.status,
      'qr_code': instance.qr_code,
      'created': instance.created,
      'updated': instance.updated,
      'transfer_to_dm': instance.transfer_to_dm,
      'line_check_started': instance.line_check_started,
      'current_step': instance.current_step,
      'created_time': instance.created_time,
    };
