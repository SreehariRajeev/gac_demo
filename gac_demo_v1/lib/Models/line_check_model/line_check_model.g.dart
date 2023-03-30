// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LineCheckModel _$$_LineCheckModelFromJson(Map<String, dynamic> json) =>
    _$_LineCheckModel(
      status: json['status'] as bool,
      cargoData: (json['cargoData'] as List<dynamic>)
          .map((e) => CargoDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LineCheckModelToJson(_$_LineCheckModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'cargoData': instance.cargoData,
      'data': instance.data,
    };

_$_CargoDatum _$$_CargoDatumFromJson(Map<String, dynamic> json) =>
    _$_CargoDatum(
      id: json['id'] as int,
      cargoNumber: json['cargoNumber'] as String,
    );

Map<String, dynamic> _$$_CargoDatumToJson(_$_CargoDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cargoNumber': instance.cargoNumber,
    };

_$_Datum _$$_DatumFromJson(Map<String, dynamic> json) => _$_Datum(
      uploadedFile: json['uploadedFile'],
      grns: Grns.fromJson(json['grns'] as Map<String, dynamic>),
      created: json['created'] as String,
      updated: json['updated'] as String,
      cargo: Cargo.fromJson(json['cargo'] as Map<String, dynamic>),
      item: json['item'] as String,
      noDescrepency: json['noDescrepency'] as bool,
    );

Map<String, dynamic> _$$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'uploadedFile': instance.uploadedFile,
      'grns': instance.grns,
      'created': instance.created,
      'updated': instance.updated,
      'cargo': instance.cargo,
      'item': instance.item,
      'noDescrepency': instance.noDescrepency,
    };

_$_Cargo _$$_CargoFromJson(Map<String, dynamic> json) => _$_Cargo(
      pieces: json['pieces'] as int,
      cargoNumber: json['cargoNumber'] as String,
      length: json['length'],
      width: json['width'],
      height: json['height'],
      weight: json['weight'],
      location: json['location'],
      locationQrCode: json['locationQrCode'],
      id: json['id'] as int,
      qrCode: json['qrCode'] as String,
      grns: Grns.fromJson(json['grns'] as Map<String, dynamic>),
      created: json['created'] as String,
      updated: json['updated'] as String,
    );

Map<String, dynamic> _$$_CargoToJson(_$_Cargo instance) => <String, dynamic>{
      'pieces': instance.pieces,
      'cargoNumber': instance.cargoNumber,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'weight': instance.weight,
      'location': instance.location,
      'locationQrCode': instance.locationQrCode,
      'id': instance.id,
      'qrCode': instance.qrCode,
      'grns': instance.grns,
      'created': instance.created,
      'updated': instance.updated,
    };

_$_Grns _$$_GrnsFromJson(Map<String, dynamic> json) => _$_Grns(
      customer: json['customer'] as String,
      pieces: json['pieces'] as int,
      supplier: json['supplier'] as String,
      poNumber: json['poNumber'] as String,
      consignee: json['consignee'] as String,
      numberOfItems: json['numberOfItems'] as int,
      noDamage: json['noDamage'] as bool,
      linkCheckRequired: json['linkCheckRequired'] as bool,
      id: json['id'] as int,
      grnsNumber: json['grnsNumber'] as String,
      status: json['status'] as String,
      qrCode: json['qrCode'] as String,
      created: json['created'] as String,
      updated: json['updated'] as String,
      transferToDm: json['transferToDm'],
      lineCheckStarted: json['lineCheckStarted'] as String,
      currentStep: json['currentStep'] as String,
      createdTime: json['createdTime'] as String,
    );

Map<String, dynamic> _$$_GrnsToJson(_$_Grns instance) => <String, dynamic>{
      'customer': instance.customer,
      'pieces': instance.pieces,
      'supplier': instance.supplier,
      'poNumber': instance.poNumber,
      'consignee': instance.consignee,
      'numberOfItems': instance.numberOfItems,
      'noDamage': instance.noDamage,
      'linkCheckRequired': instance.linkCheckRequired,
      'id': instance.id,
      'grnsNumber': instance.grnsNumber,
      'status': instance.status,
      'qrCode': instance.qrCode,
      'created': instance.created,
      'updated': instance.updated,
      'transferToDm': instance.transferToDm,
      'lineCheckStarted': instance.lineCheckStarted,
      'currentStep': instance.currentStep,
      'createdTime': instance.createdTime,
    };
