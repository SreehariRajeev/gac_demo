// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'line_check_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LineCheckModel _$LineCheckModelFromJson(Map<String, dynamic> json) {
  return _LineCheckModel.fromJson(json);
}

/// @nodoc
mixin _$LineCheckModel {
  bool get status => throw _privateConstructorUsedError;
  List<CargoDatum> get cargoData => throw _privateConstructorUsedError;
  List<Datum> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineCheckModelCopyWith<LineCheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineCheckModelCopyWith<$Res> {
  factory $LineCheckModelCopyWith(
          LineCheckModel value, $Res Function(LineCheckModel) then) =
      _$LineCheckModelCopyWithImpl<$Res, LineCheckModel>;
  @useResult
  $Res call({bool status, List<CargoDatum> cargoData, List<Datum> data});
}

/// @nodoc
class _$LineCheckModelCopyWithImpl<$Res, $Val extends LineCheckModel>
    implements $LineCheckModelCopyWith<$Res> {
  _$LineCheckModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cargoData = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      cargoData: null == cargoData
          ? _value.cargoData
          : cargoData // ignore: cast_nullable_to_non_nullable
              as List<CargoDatum>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LineCheckModelCopyWith<$Res>
    implements $LineCheckModelCopyWith<$Res> {
  factory _$$_LineCheckModelCopyWith(
          _$_LineCheckModel value, $Res Function(_$_LineCheckModel) then) =
      __$$_LineCheckModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, List<CargoDatum> cargoData, List<Datum> data});
}

/// @nodoc
class __$$_LineCheckModelCopyWithImpl<$Res>
    extends _$LineCheckModelCopyWithImpl<$Res, _$_LineCheckModel>
    implements _$$_LineCheckModelCopyWith<$Res> {
  __$$_LineCheckModelCopyWithImpl(
      _$_LineCheckModel _value, $Res Function(_$_LineCheckModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cargoData = null,
    Object? data = null,
  }) {
    return _then(_$_LineCheckModel(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      cargoData: null == cargoData
          ? _value._cargoData
          : cargoData // ignore: cast_nullable_to_non_nullable
              as List<CargoDatum>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LineCheckModel implements _LineCheckModel {
  const _$_LineCheckModel(
      {required this.status,
      required final List<CargoDatum> cargoData,
      required final List<Datum> data})
      : _cargoData = cargoData,
        _data = data;

  factory _$_LineCheckModel.fromJson(Map<String, dynamic> json) =>
      _$$_LineCheckModelFromJson(json);

  @override
  final bool status;
  final List<CargoDatum> _cargoData;
  @override
  List<CargoDatum> get cargoData {
    if (_cargoData is EqualUnmodifiableListView) return _cargoData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cargoData);
  }

  final List<Datum> _data;
  @override
  List<Datum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LineCheckModel(status: $status, cargoData: $cargoData, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LineCheckModel &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._cargoData, _cargoData) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_cargoData),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LineCheckModelCopyWith<_$_LineCheckModel> get copyWith =>
      __$$_LineCheckModelCopyWithImpl<_$_LineCheckModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LineCheckModelToJson(
      this,
    );
  }
}

abstract class _LineCheckModel implements LineCheckModel {
  const factory _LineCheckModel(
      {required final bool status,
      required final List<CargoDatum> cargoData,
      required final List<Datum> data}) = _$_LineCheckModel;

  factory _LineCheckModel.fromJson(Map<String, dynamic> json) =
      _$_LineCheckModel.fromJson;

  @override
  bool get status;
  @override
  List<CargoDatum> get cargoData;
  @override
  List<Datum> get data;
  @override
  @JsonKey(ignore: true)
  _$$_LineCheckModelCopyWith<_$_LineCheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CargoDatum _$CargoDatumFromJson(Map<String, dynamic> json) {
  return _CargoDatum.fromJson(json);
}

/// @nodoc
mixin _$CargoDatum {
  int get id => throw _privateConstructorUsedError;
  String get cargoNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CargoDatumCopyWith<CargoDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CargoDatumCopyWith<$Res> {
  factory $CargoDatumCopyWith(
          CargoDatum value, $Res Function(CargoDatum) then) =
      _$CargoDatumCopyWithImpl<$Res, CargoDatum>;
  @useResult
  $Res call({int id, String cargoNumber});
}

/// @nodoc
class _$CargoDatumCopyWithImpl<$Res, $Val extends CargoDatum>
    implements $CargoDatumCopyWith<$Res> {
  _$CargoDatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cargoNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cargoNumber: null == cargoNumber
          ? _value.cargoNumber
          : cargoNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CargoDatumCopyWith<$Res>
    implements $CargoDatumCopyWith<$Res> {
  factory _$$_CargoDatumCopyWith(
          _$_CargoDatum value, $Res Function(_$_CargoDatum) then) =
      __$$_CargoDatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String cargoNumber});
}

/// @nodoc
class __$$_CargoDatumCopyWithImpl<$Res>
    extends _$CargoDatumCopyWithImpl<$Res, _$_CargoDatum>
    implements _$$_CargoDatumCopyWith<$Res> {
  __$$_CargoDatumCopyWithImpl(
      _$_CargoDatum _value, $Res Function(_$_CargoDatum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cargoNumber = null,
  }) {
    return _then(_$_CargoDatum(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cargoNumber: null == cargoNumber
          ? _value.cargoNumber
          : cargoNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CargoDatum implements _CargoDatum {
  const _$_CargoDatum({required this.id, required this.cargoNumber});

  factory _$_CargoDatum.fromJson(Map<String, dynamic> json) =>
      _$$_CargoDatumFromJson(json);

  @override
  final int id;
  @override
  final String cargoNumber;

  @override
  String toString() {
    return 'CargoDatum(id: $id, cargoNumber: $cargoNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CargoDatum &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cargoNumber, cargoNumber) ||
                other.cargoNumber == cargoNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, cargoNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CargoDatumCopyWith<_$_CargoDatum> get copyWith =>
      __$$_CargoDatumCopyWithImpl<_$_CargoDatum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CargoDatumToJson(
      this,
    );
  }
}

abstract class _CargoDatum implements CargoDatum {
  const factory _CargoDatum(
      {required final int id,
      required final String cargoNumber}) = _$_CargoDatum;

  factory _CargoDatum.fromJson(Map<String, dynamic> json) =
      _$_CargoDatum.fromJson;

  @override
  int get id;
  @override
  String get cargoNumber;
  @override
  @JsonKey(ignore: true)
  _$$_CargoDatumCopyWith<_$_CargoDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  dynamic get uploadedFile => throw _privateConstructorUsedError;
  Grns get grns => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;
  String get updated => throw _privateConstructorUsedError;
  Cargo get cargo => throw _privateConstructorUsedError;
  String get item => throw _privateConstructorUsedError;
  bool get noDescrepency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {dynamic uploadedFile,
      Grns grns,
      String created,
      String updated,
      Cargo cargo,
      String item,
      bool noDescrepency});

  $GrnsCopyWith<$Res> get grns;
  $CargoCopyWith<$Res> get cargo;
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadedFile = freezed,
    Object? grns = null,
    Object? created = null,
    Object? updated = null,
    Object? cargo = null,
    Object? item = null,
    Object? noDescrepency = null,
  }) {
    return _then(_value.copyWith(
      uploadedFile: freezed == uploadedFile
          ? _value.uploadedFile
          : uploadedFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      grns: null == grns
          ? _value.grns
          : grns // ignore: cast_nullable_to_non_nullable
              as Grns,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      cargo: null == cargo
          ? _value.cargo
          : cargo // ignore: cast_nullable_to_non_nullable
              as Cargo,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      noDescrepency: null == noDescrepency
          ? _value.noDescrepency
          : noDescrepency // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GrnsCopyWith<$Res> get grns {
    return $GrnsCopyWith<$Res>(_value.grns, (value) {
      return _then(_value.copyWith(grns: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CargoCopyWith<$Res> get cargo {
    return $CargoCopyWith<$Res>(_value.cargo, (value) {
      return _then(_value.copyWith(cargo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$_DatumCopyWith(_$_Datum value, $Res Function(_$_Datum) then) =
      __$$_DatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic uploadedFile,
      Grns grns,
      String created,
      String updated,
      Cargo cargo,
      String item,
      bool noDescrepency});

  @override
  $GrnsCopyWith<$Res> get grns;
  @override
  $CargoCopyWith<$Res> get cargo;
}

/// @nodoc
class __$$_DatumCopyWithImpl<$Res> extends _$DatumCopyWithImpl<$Res, _$_Datum>
    implements _$$_DatumCopyWith<$Res> {
  __$$_DatumCopyWithImpl(_$_Datum _value, $Res Function(_$_Datum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadedFile = freezed,
    Object? grns = null,
    Object? created = null,
    Object? updated = null,
    Object? cargo = null,
    Object? item = null,
    Object? noDescrepency = null,
  }) {
    return _then(_$_Datum(
      uploadedFile: freezed == uploadedFile
          ? _value.uploadedFile
          : uploadedFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      grns: null == grns
          ? _value.grns
          : grns // ignore: cast_nullable_to_non_nullable
              as Grns,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      cargo: null == cargo
          ? _value.cargo
          : cargo // ignore: cast_nullable_to_non_nullable
              as Cargo,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      noDescrepency: null == noDescrepency
          ? _value.noDescrepency
          : noDescrepency // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Datum implements _Datum {
  const _$_Datum(
      {this.uploadedFile,
      required this.grns,
      required this.created,
      required this.updated,
      required this.cargo,
      required this.item,
      required this.noDescrepency});

  factory _$_Datum.fromJson(Map<String, dynamic> json) =>
      _$$_DatumFromJson(json);

  @override
  final dynamic uploadedFile;
  @override
  final Grns grns;
  @override
  final String created;
  @override
  final String updated;
  @override
  final Cargo cargo;
  @override
  final String item;
  @override
  final bool noDescrepency;

  @override
  String toString() {
    return 'Datum(uploadedFile: $uploadedFile, grns: $grns, created: $created, updated: $updated, cargo: $cargo, item: $item, noDescrepency: $noDescrepency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Datum &&
            const DeepCollectionEquality()
                .equals(other.uploadedFile, uploadedFile) &&
            (identical(other.grns, grns) || other.grns == grns) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.cargo, cargo) || other.cargo == cargo) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.noDescrepency, noDescrepency) ||
                other.noDescrepency == noDescrepency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uploadedFile),
      grns,
      created,
      updated,
      cargo,
      item,
      noDescrepency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatumCopyWith<_$_Datum> get copyWith =>
      __$$_DatumCopyWithImpl<_$_Datum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatumToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {final dynamic uploadedFile,
      required final Grns grns,
      required final String created,
      required final String updated,
      required final Cargo cargo,
      required final String item,
      required final bool noDescrepency}) = _$_Datum;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$_Datum.fromJson;

  @override
  dynamic get uploadedFile;
  @override
  Grns get grns;
  @override
  String get created;
  @override
  String get updated;
  @override
  Cargo get cargo;
  @override
  String get item;
  @override
  bool get noDescrepency;
  @override
  @JsonKey(ignore: true)
  _$$_DatumCopyWith<_$_Datum> get copyWith =>
      throw _privateConstructorUsedError;
}

Cargo _$CargoFromJson(Map<String, dynamic> json) {
  return _Cargo.fromJson(json);
}

/// @nodoc
mixin _$Cargo {
  int get pieces => throw _privateConstructorUsedError;
  String get cargoNumber => throw _privateConstructorUsedError;
  dynamic get length => throw _privateConstructorUsedError;
  dynamic get width => throw _privateConstructorUsedError;
  dynamic get height => throw _privateConstructorUsedError;
  dynamic get weight => throw _privateConstructorUsedError;
  dynamic get location => throw _privateConstructorUsedError;
  dynamic get locationQrCode => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;
  Grns get grns => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;
  String get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CargoCopyWith<Cargo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CargoCopyWith<$Res> {
  factory $CargoCopyWith(Cargo value, $Res Function(Cargo) then) =
      _$CargoCopyWithImpl<$Res, Cargo>;
  @useResult
  $Res call(
      {int pieces,
      String cargoNumber,
      dynamic length,
      dynamic width,
      dynamic height,
      dynamic weight,
      dynamic location,
      dynamic locationQrCode,
      int id,
      String qrCode,
      Grns grns,
      String created,
      String updated});

  $GrnsCopyWith<$Res> get grns;
}

/// @nodoc
class _$CargoCopyWithImpl<$Res, $Val extends Cargo>
    implements $CargoCopyWith<$Res> {
  _$CargoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pieces = null,
    Object? cargoNumber = null,
    Object? length = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? location = freezed,
    Object? locationQrCode = freezed,
    Object? id = null,
    Object? qrCode = null,
    Object? grns = null,
    Object? created = null,
    Object? updated = null,
  }) {
    return _then(_value.copyWith(
      pieces: null == pieces
          ? _value.pieces
          : pieces // ignore: cast_nullable_to_non_nullable
              as int,
      cargoNumber: null == cargoNumber
          ? _value.cargoNumber
          : cargoNumber // ignore: cast_nullable_to_non_nullable
              as String,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as dynamic,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as dynamic,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as dynamic,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as dynamic,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locationQrCode: freezed == locationQrCode
          ? _value.locationQrCode
          : locationQrCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      grns: null == grns
          ? _value.grns
          : grns // ignore: cast_nullable_to_non_nullable
              as Grns,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GrnsCopyWith<$Res> get grns {
    return $GrnsCopyWith<$Res>(_value.grns, (value) {
      return _then(_value.copyWith(grns: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CargoCopyWith<$Res> implements $CargoCopyWith<$Res> {
  factory _$$_CargoCopyWith(_$_Cargo value, $Res Function(_$_Cargo) then) =
      __$$_CargoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int pieces,
      String cargoNumber,
      dynamic length,
      dynamic width,
      dynamic height,
      dynamic weight,
      dynamic location,
      dynamic locationQrCode,
      int id,
      String qrCode,
      Grns grns,
      String created,
      String updated});

  @override
  $GrnsCopyWith<$Res> get grns;
}

/// @nodoc
class __$$_CargoCopyWithImpl<$Res> extends _$CargoCopyWithImpl<$Res, _$_Cargo>
    implements _$$_CargoCopyWith<$Res> {
  __$$_CargoCopyWithImpl(_$_Cargo _value, $Res Function(_$_Cargo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pieces = null,
    Object? cargoNumber = null,
    Object? length = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? location = freezed,
    Object? locationQrCode = freezed,
    Object? id = null,
    Object? qrCode = null,
    Object? grns = null,
    Object? created = null,
    Object? updated = null,
  }) {
    return _then(_$_Cargo(
      pieces: null == pieces
          ? _value.pieces
          : pieces // ignore: cast_nullable_to_non_nullable
              as int,
      cargoNumber: null == cargoNumber
          ? _value.cargoNumber
          : cargoNumber // ignore: cast_nullable_to_non_nullable
              as String,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as dynamic,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as dynamic,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as dynamic,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as dynamic,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locationQrCode: freezed == locationQrCode
          ? _value.locationQrCode
          : locationQrCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      grns: null == grns
          ? _value.grns
          : grns // ignore: cast_nullable_to_non_nullable
              as Grns,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cargo implements _Cargo {
  const _$_Cargo(
      {required this.pieces,
      required this.cargoNumber,
      this.length,
      this.width,
      this.height,
      this.weight,
      this.location,
      this.locationQrCode,
      required this.id,
      required this.qrCode,
      required this.grns,
      required this.created,
      required this.updated});

  factory _$_Cargo.fromJson(Map<String, dynamic> json) =>
      _$$_CargoFromJson(json);

  @override
  final int pieces;
  @override
  final String cargoNumber;
  @override
  final dynamic length;
  @override
  final dynamic width;
  @override
  final dynamic height;
  @override
  final dynamic weight;
  @override
  final dynamic location;
  @override
  final dynamic locationQrCode;
  @override
  final int id;
  @override
  final String qrCode;
  @override
  final Grns grns;
  @override
  final String created;
  @override
  final String updated;

  @override
  String toString() {
    return 'Cargo(pieces: $pieces, cargoNumber: $cargoNumber, length: $length, width: $width, height: $height, weight: $weight, location: $location, locationQrCode: $locationQrCode, id: $id, qrCode: $qrCode, grns: $grns, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cargo &&
            (identical(other.pieces, pieces) || other.pieces == pieces) &&
            (identical(other.cargoNumber, cargoNumber) ||
                other.cargoNumber == cargoNumber) &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality()
                .equals(other.locationQrCode, locationQrCode) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.grns, grns) || other.grns == grns) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pieces,
      cargoNumber,
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(locationQrCode),
      id,
      qrCode,
      grns,
      created,
      updated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CargoCopyWith<_$_Cargo> get copyWith =>
      __$$_CargoCopyWithImpl<_$_Cargo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CargoToJson(
      this,
    );
  }
}

abstract class _Cargo implements Cargo {
  const factory _Cargo(
      {required final int pieces,
      required final String cargoNumber,
      final dynamic length,
      final dynamic width,
      final dynamic height,
      final dynamic weight,
      final dynamic location,
      final dynamic locationQrCode,
      required final int id,
      required final String qrCode,
      required final Grns grns,
      required final String created,
      required final String updated}) = _$_Cargo;

  factory _Cargo.fromJson(Map<String, dynamic> json) = _$_Cargo.fromJson;

  @override
  int get pieces;
  @override
  String get cargoNumber;
  @override
  dynamic get length;
  @override
  dynamic get width;
  @override
  dynamic get height;
  @override
  dynamic get weight;
  @override
  dynamic get location;
  @override
  dynamic get locationQrCode;
  @override
  int get id;
  @override
  String get qrCode;
  @override
  Grns get grns;
  @override
  String get created;
  @override
  String get updated;
  @override
  @JsonKey(ignore: true)
  _$$_CargoCopyWith<_$_Cargo> get copyWith =>
      throw _privateConstructorUsedError;
}

Grns _$GrnsFromJson(Map<String, dynamic> json) {
  return _Grns.fromJson(json);
}

/// @nodoc
mixin _$Grns {
  String get customer => throw _privateConstructorUsedError;
  int get pieces => throw _privateConstructorUsedError;
  String get supplier => throw _privateConstructorUsedError;
  String get poNumber => throw _privateConstructorUsedError;
  String get consignee => throw _privateConstructorUsedError;
  int get numberOfItems => throw _privateConstructorUsedError;
  bool get noDamage => throw _privateConstructorUsedError;
  bool get linkCheckRequired => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get grnsNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;
  String get updated => throw _privateConstructorUsedError;
  dynamic get transferToDm => throw _privateConstructorUsedError;
  String get lineCheckStarted => throw _privateConstructorUsedError;
  String get currentStep => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrnsCopyWith<Grns> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrnsCopyWith<$Res> {
  factory $GrnsCopyWith(Grns value, $Res Function(Grns) then) =
      _$GrnsCopyWithImpl<$Res, Grns>;
  @useResult
  $Res call(
      {String customer,
      int pieces,
      String supplier,
      String poNumber,
      String consignee,
      int numberOfItems,
      bool noDamage,
      bool linkCheckRequired,
      int id,
      String grnsNumber,
      String status,
      String qrCode,
      String created,
      String updated,
      dynamic transferToDm,
      String lineCheckStarted,
      String currentStep,
      String createdTime});
}

/// @nodoc
class _$GrnsCopyWithImpl<$Res, $Val extends Grns>
    implements $GrnsCopyWith<$Res> {
  _$GrnsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? pieces = null,
    Object? supplier = null,
    Object? poNumber = null,
    Object? consignee = null,
    Object? numberOfItems = null,
    Object? noDamage = null,
    Object? linkCheckRequired = null,
    Object? id = null,
    Object? grnsNumber = null,
    Object? status = null,
    Object? qrCode = null,
    Object? created = null,
    Object? updated = null,
    Object? transferToDm = freezed,
    Object? lineCheckStarted = null,
    Object? currentStep = null,
    Object? createdTime = null,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      pieces: null == pieces
          ? _value.pieces
          : pieces // ignore: cast_nullable_to_non_nullable
              as int,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      poNumber: null == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String,
      consignee: null == consignee
          ? _value.consignee
          : consignee // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfItems: null == numberOfItems
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as int,
      noDamage: null == noDamage
          ? _value.noDamage
          : noDamage // ignore: cast_nullable_to_non_nullable
              as bool,
      linkCheckRequired: null == linkCheckRequired
          ? _value.linkCheckRequired
          : linkCheckRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      grnsNumber: null == grnsNumber
          ? _value.grnsNumber
          : grnsNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      transferToDm: freezed == transferToDm
          ? _value.transferToDm
          : transferToDm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lineCheckStarted: null == lineCheckStarted
          ? _value.lineCheckStarted
          : lineCheckStarted // ignore: cast_nullable_to_non_nullable
              as String,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GrnsCopyWith<$Res> implements $GrnsCopyWith<$Res> {
  factory _$$_GrnsCopyWith(_$_Grns value, $Res Function(_$_Grns) then) =
      __$$_GrnsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customer,
      int pieces,
      String supplier,
      String poNumber,
      String consignee,
      int numberOfItems,
      bool noDamage,
      bool linkCheckRequired,
      int id,
      String grnsNumber,
      String status,
      String qrCode,
      String created,
      String updated,
      dynamic transferToDm,
      String lineCheckStarted,
      String currentStep,
      String createdTime});
}

/// @nodoc
class __$$_GrnsCopyWithImpl<$Res> extends _$GrnsCopyWithImpl<$Res, _$_Grns>
    implements _$$_GrnsCopyWith<$Res> {
  __$$_GrnsCopyWithImpl(_$_Grns _value, $Res Function(_$_Grns) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? pieces = null,
    Object? supplier = null,
    Object? poNumber = null,
    Object? consignee = null,
    Object? numberOfItems = null,
    Object? noDamage = null,
    Object? linkCheckRequired = null,
    Object? id = null,
    Object? grnsNumber = null,
    Object? status = null,
    Object? qrCode = null,
    Object? created = null,
    Object? updated = null,
    Object? transferToDm = freezed,
    Object? lineCheckStarted = null,
    Object? currentStep = null,
    Object? createdTime = null,
  }) {
    return _then(_$_Grns(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      pieces: null == pieces
          ? _value.pieces
          : pieces // ignore: cast_nullable_to_non_nullable
              as int,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      poNumber: null == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String,
      consignee: null == consignee
          ? _value.consignee
          : consignee // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfItems: null == numberOfItems
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as int,
      noDamage: null == noDamage
          ? _value.noDamage
          : noDamage // ignore: cast_nullable_to_non_nullable
              as bool,
      linkCheckRequired: null == linkCheckRequired
          ? _value.linkCheckRequired
          : linkCheckRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      grnsNumber: null == grnsNumber
          ? _value.grnsNumber
          : grnsNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      transferToDm: freezed == transferToDm
          ? _value.transferToDm
          : transferToDm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lineCheckStarted: null == lineCheckStarted
          ? _value.lineCheckStarted
          : lineCheckStarted // ignore: cast_nullable_to_non_nullable
              as String,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Grns implements _Grns {
  const _$_Grns(
      {required this.customer,
      required this.pieces,
      required this.supplier,
      required this.poNumber,
      required this.consignee,
      required this.numberOfItems,
      required this.noDamage,
      required this.linkCheckRequired,
      required this.id,
      required this.grnsNumber,
      required this.status,
      required this.qrCode,
      required this.created,
      required this.updated,
      this.transferToDm,
      required this.lineCheckStarted,
      required this.currentStep,
      required this.createdTime});

  factory _$_Grns.fromJson(Map<String, dynamic> json) => _$$_GrnsFromJson(json);

  @override
  final String customer;
  @override
  final int pieces;
  @override
  final String supplier;
  @override
  final String poNumber;
  @override
  final String consignee;
  @override
  final int numberOfItems;
  @override
  final bool noDamage;
  @override
  final bool linkCheckRequired;
  @override
  final int id;
  @override
  final String grnsNumber;
  @override
  final String status;
  @override
  final String qrCode;
  @override
  final String created;
  @override
  final String updated;
  @override
  final dynamic transferToDm;
  @override
  final String lineCheckStarted;
  @override
  final String currentStep;
  @override
  final String createdTime;

  @override
  String toString() {
    return 'Grns(customer: $customer, pieces: $pieces, supplier: $supplier, poNumber: $poNumber, consignee: $consignee, numberOfItems: $numberOfItems, noDamage: $noDamage, linkCheckRequired: $linkCheckRequired, id: $id, grnsNumber: $grnsNumber, status: $status, qrCode: $qrCode, created: $created, updated: $updated, transferToDm: $transferToDm, lineCheckStarted: $lineCheckStarted, currentStep: $currentStep, createdTime: $createdTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Grns &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.pieces, pieces) || other.pieces == pieces) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.poNumber, poNumber) ||
                other.poNumber == poNumber) &&
            (identical(other.consignee, consignee) ||
                other.consignee == consignee) &&
            (identical(other.numberOfItems, numberOfItems) ||
                other.numberOfItems == numberOfItems) &&
            (identical(other.noDamage, noDamage) ||
                other.noDamage == noDamage) &&
            (identical(other.linkCheckRequired, linkCheckRequired) ||
                other.linkCheckRequired == linkCheckRequired) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.grnsNumber, grnsNumber) ||
                other.grnsNumber == grnsNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            const DeepCollectionEquality()
                .equals(other.transferToDm, transferToDm) &&
            (identical(other.lineCheckStarted, lineCheckStarted) ||
                other.lineCheckStarted == lineCheckStarted) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customer,
      pieces,
      supplier,
      poNumber,
      consignee,
      numberOfItems,
      noDamage,
      linkCheckRequired,
      id,
      grnsNumber,
      status,
      qrCode,
      created,
      updated,
      const DeepCollectionEquality().hash(transferToDm),
      lineCheckStarted,
      currentStep,
      createdTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GrnsCopyWith<_$_Grns> get copyWith =>
      __$$_GrnsCopyWithImpl<_$_Grns>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GrnsToJson(
      this,
    );
  }
}

abstract class _Grns implements Grns {
  const factory _Grns(
      {required final String customer,
      required final int pieces,
      required final String supplier,
      required final String poNumber,
      required final String consignee,
      required final int numberOfItems,
      required final bool noDamage,
      required final bool linkCheckRequired,
      required final int id,
      required final String grnsNumber,
      required final String status,
      required final String qrCode,
      required final String created,
      required final String updated,
      final dynamic transferToDm,
      required final String lineCheckStarted,
      required final String currentStep,
      required final String createdTime}) = _$_Grns;

  factory _Grns.fromJson(Map<String, dynamic> json) = _$_Grns.fromJson;

  @override
  String get customer;
  @override
  int get pieces;
  @override
  String get supplier;
  @override
  String get poNumber;
  @override
  String get consignee;
  @override
  int get numberOfItems;
  @override
  bool get noDamage;
  @override
  bool get linkCheckRequired;
  @override
  int get id;
  @override
  String get grnsNumber;
  @override
  String get status;
  @override
  String get qrCode;
  @override
  String get created;
  @override
  String get updated;
  @override
  dynamic get transferToDm;
  @override
  String get lineCheckStarted;
  @override
  String get currentStep;
  @override
  String get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$_GrnsCopyWith<_$_Grns> get copyWith => throw _privateConstructorUsedError;
}
