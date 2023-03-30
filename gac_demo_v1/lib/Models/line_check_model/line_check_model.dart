import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'line_check_model.freezed.dart';
part 'line_check_model.g.dart';

LineCheckModel lineCheckModelFromJson(String str) =>
    LineCheckModel.fromJson(json.decode(str));

String lineCheckModelToJson(LineCheckModel data) => json.encode(data.toJson());

@freezed
class LineCheckModel with _$LineCheckModel {
  const factory LineCheckModel({
    required bool status,
    required List<CargoDatum> cargoData,
    required List<Datum> data,
  }) = _LineCheckModel;

  factory LineCheckModel.fromJson(Map<String, dynamic> json) =>
      _$LineCheckModelFromJson(json);
}

@freezed
class CargoDatum with _$CargoDatum {
  const factory CargoDatum({
    required int id,
    required String cargoNumber,
  }) = _CargoDatum;

  factory CargoDatum.fromJson(Map<String, dynamic> json) =>
      _$CargoDatumFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    dynamic uploadedFile,
    required Grns grns,
    required String created,
    required String updated,
    required Cargo cargo,
    required String item,
    required bool noDescrepency,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Cargo with _$Cargo {
  const factory Cargo({
    required int pieces,
    required String cargoNumber,
    dynamic length,
    dynamic width,
    dynamic height,
    dynamic weight,
    dynamic location,
    dynamic locationQrCode,
    required int id,
    required String qrCode,
    required Grns grns,
    required String created,
    required String updated,
  }) = _Cargo;

  factory Cargo.fromJson(Map<String, dynamic> json) => _$CargoFromJson(json);
}

@freezed
class Grns with _$Grns {
  const factory Grns({
    required String customer,
    required int pieces,
    required String supplier,
    required String poNumber,
    required String consignee,
    required int numberOfItems,
    required bool noDamage,
    required bool linkCheckRequired,
    required int id,
    required String grnsNumber,
    required String status,
    required String qrCode,
    required String created,
    required String updated,
    dynamic transferToDm,
    required String lineCheckStarted,
    required String currentStep,
    required String createdTime,
  }) = _Grns;

  factory Grns.fromJson(Map<String, dynamic> json) => _$GrnsFromJson(json);
}