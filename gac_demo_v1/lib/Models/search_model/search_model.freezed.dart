// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) {
  return _SearchModel.fromJson(json);
}

/// @nodoc
mixin _$SearchModel {
  bool get status => throw _privateConstructorUsedError;
  Page get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchModelCopyWith<SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchModelCopyWith<$Res> {
  factory $SearchModelCopyWith(
          SearchModel value, $Res Function(SearchModel) then) =
      _$SearchModelCopyWithImpl<$Res, SearchModel>;
  @useResult
  $Res call({bool status, Page page});

  $PageCopyWith<$Res> get page;
}

/// @nodoc
class _$SearchModelCopyWithImpl<$Res, $Val extends SearchModel>
    implements $SearchModelCopyWith<$Res> {
  _$SearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageCopyWith<$Res> get page {
    return $PageCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SearchModelCopyWith<$Res>
    implements $SearchModelCopyWith<$Res> {
  factory _$$_SearchModelCopyWith(
          _$_SearchModel value, $Res Function(_$_SearchModel) then) =
      __$$_SearchModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, Page page});

  @override
  $PageCopyWith<$Res> get page;
}

/// @nodoc
class __$$_SearchModelCopyWithImpl<$Res>
    extends _$SearchModelCopyWithImpl<$Res, _$_SearchModel>
    implements _$$_SearchModelCopyWith<$Res> {
  __$$_SearchModelCopyWithImpl(
      _$_SearchModel _value, $Res Function(_$_SearchModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
  }) {
    return _then(_$_SearchModel(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchModel implements _SearchModel {
  const _$_SearchModel({required this.status, required this.page});

  factory _$_SearchModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchModelFromJson(json);

  @override
  final bool status;
  @override
  final Page page;

  @override
  String toString() {
    return 'SearchModel(status: $status, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchModelCopyWith<_$_SearchModel> get copyWith =>
      __$$_SearchModelCopyWithImpl<_$_SearchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchModelToJson(
      this,
    );
  }
}

abstract class _SearchModel implements SearchModel {
  const factory _SearchModel(
      {required final bool status, required final Page page}) = _$_SearchModel;

  factory _SearchModel.fromJson(Map<String, dynamic> json) =
      _$_SearchModel.fromJson;

  @override
  bool get status;
  @override
  Page get page;
  @override
  @JsonKey(ignore: true)
  _$$_SearchModelCopyWith<_$_SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Page _$PageFromJson(Map<String, dynamic> json) {
  return _Page.fromJson(json);
}

/// @nodoc
mixin _$Page {
  int get end_index => throw _privateConstructorUsedError;
  bool get has_next => throw _privateConstructorUsedError;
  bool get has_other_pages => throw _privateConstructorUsedError;
  bool get has_previous => throw _privateConstructorUsedError;
  int get start_index => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  int get num_pages => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageCopyWith<Page> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageCopyWith<$Res> {
  factory $PageCopyWith(Page value, $Res Function(Page) then) =
      _$PageCopyWithImpl<$Res, Page>;
  @useResult
  $Res call(
      {int end_index,
      bool has_next,
      bool has_other_pages,
      bool has_previous,
      int start_index,
      int number,
      int num_pages,
      List<Item> items});
}

/// @nodoc
class _$PageCopyWithImpl<$Res, $Val extends Page>
    implements $PageCopyWith<$Res> {
  _$PageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? end_index = null,
    Object? has_next = null,
    Object? has_other_pages = null,
    Object? has_previous = null,
    Object? start_index = null,
    Object? number = null,
    Object? num_pages = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      end_index: null == end_index
          ? _value.end_index
          : end_index // ignore: cast_nullable_to_non_nullable
              as int,
      has_next: null == has_next
          ? _value.has_next
          : has_next // ignore: cast_nullable_to_non_nullable
              as bool,
      has_other_pages: null == has_other_pages
          ? _value.has_other_pages
          : has_other_pages // ignore: cast_nullable_to_non_nullable
              as bool,
      has_previous: null == has_previous
          ? _value.has_previous
          : has_previous // ignore: cast_nullable_to_non_nullable
              as bool,
      start_index: null == start_index
          ? _value.start_index
          : start_index // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      num_pages: null == num_pages
          ? _value.num_pages
          : num_pages // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$$_PageCopyWith(_$_Page value, $Res Function(_$_Page) then) =
      __$$_PageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int end_index,
      bool has_next,
      bool has_other_pages,
      bool has_previous,
      int start_index,
      int number,
      int num_pages,
      List<Item> items});
}

/// @nodoc
class __$$_PageCopyWithImpl<$Res> extends _$PageCopyWithImpl<$Res, _$_Page>
    implements _$$_PageCopyWith<$Res> {
  __$$_PageCopyWithImpl(_$_Page _value, $Res Function(_$_Page) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? end_index = null,
    Object? has_next = null,
    Object? has_other_pages = null,
    Object? has_previous = null,
    Object? start_index = null,
    Object? number = null,
    Object? num_pages = null,
    Object? items = null,
  }) {
    return _then(_$_Page(
      end_index: null == end_index
          ? _value.end_index
          : end_index // ignore: cast_nullable_to_non_nullable
              as int,
      has_next: null == has_next
          ? _value.has_next
          : has_next // ignore: cast_nullable_to_non_nullable
              as bool,
      has_other_pages: null == has_other_pages
          ? _value.has_other_pages
          : has_other_pages // ignore: cast_nullable_to_non_nullable
              as bool,
      has_previous: null == has_previous
          ? _value.has_previous
          : has_previous // ignore: cast_nullable_to_non_nullable
              as bool,
      start_index: null == start_index
          ? _value.start_index
          : start_index // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      num_pages: null == num_pages
          ? _value.num_pages
          : num_pages // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Page implements _Page {
  const _$_Page(
      {required this.end_index,
      required this.has_next,
      required this.has_other_pages,
      required this.has_previous,
      required this.start_index,
      required this.number,
      required this.num_pages,
      required final List<Item> items})
      : _items = items;

  factory _$_Page.fromJson(Map<String, dynamic> json) => _$$_PageFromJson(json);

  @override
  final int end_index;
  @override
  final bool has_next;
  @override
  final bool has_other_pages;
  @override
  final bool has_previous;
  @override
  final int start_index;
  @override
  final int number;
  @override
  final int num_pages;
  final List<Item> _items;
  @override
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Page(end_index: $end_index, has_next: $has_next, has_other_pages: $has_other_pages, has_previous: $has_previous, start_index: $start_index, number: $number, num_pages: $num_pages, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Page &&
            (identical(other.end_index, end_index) ||
                other.end_index == end_index) &&
            (identical(other.has_next, has_next) ||
                other.has_next == has_next) &&
            (identical(other.has_other_pages, has_other_pages) ||
                other.has_other_pages == has_other_pages) &&
            (identical(other.has_previous, has_previous) ||
                other.has_previous == has_previous) &&
            (identical(other.start_index, start_index) ||
                other.start_index == start_index) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.num_pages, num_pages) ||
                other.num_pages == num_pages) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      end_index,
      has_next,
      has_other_pages,
      has_previous,
      start_index,
      number,
      num_pages,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageCopyWith<_$_Page> get copyWith =>
      __$$_PageCopyWithImpl<_$_Page>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageToJson(
      this,
    );
  }
}

abstract class _Page implements Page {
  const factory _Page(
      {required final int end_index,
      required final bool has_next,
      required final bool has_other_pages,
      required final bool has_previous,
      required final int start_index,
      required final int number,
      required final int num_pages,
      required final List<Item> items}) = _$_Page;

  factory _Page.fromJson(Map<String, dynamic> json) = _$_Page.fromJson;

  @override
  int get end_index;
  @override
  bool get has_next;
  @override
  bool get has_other_pages;
  @override
  bool get has_previous;
  @override
  int get start_index;
  @override
  int get number;
  @override
  int get num_pages;
  @override
  List<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$$_PageCopyWith<_$_Page> get copyWith => throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get customer => throw _privateConstructorUsedError;
  int get pieces => throw _privateConstructorUsedError;
  String get supplier => throw _privateConstructorUsedError;
  String get po_number => throw _privateConstructorUsedError;
  String get consignee => throw _privateConstructorUsedError;
  int get number_of_items => throw _privateConstructorUsedError;
  bool get no_damage => throw _privateConstructorUsedError;
  bool get link_check_required => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get grns_number => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get qr_code => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;
  String get updated => throw _privateConstructorUsedError;
  dynamic get transfer_to_dm => throw _privateConstructorUsedError;
  String get line_check_started => throw _privateConstructorUsedError;
  String get current_step => throw _privateConstructorUsedError;
  String get created_time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String customer,
      int pieces,
      String supplier,
      String po_number,
      String consignee,
      int number_of_items,
      bool no_damage,
      bool link_check_required,
      int id,
      String grns_number,
      String status,
      String qr_code,
      String created,
      String updated,
      dynamic transfer_to_dm,
      String line_check_started,
      String current_step,
      String created_time});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

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
    Object? po_number = null,
    Object? consignee = null,
    Object? number_of_items = null,
    Object? no_damage = null,
    Object? link_check_required = null,
    Object? id = null,
    Object? grns_number = null,
    Object? status = null,
    Object? qr_code = null,
    Object? created = null,
    Object? updated = null,
    Object? transfer_to_dm = freezed,
    Object? line_check_started = null,
    Object? current_step = null,
    Object? created_time = null,
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
      po_number: null == po_number
          ? _value.po_number
          : po_number // ignore: cast_nullable_to_non_nullable
              as String,
      consignee: null == consignee
          ? _value.consignee
          : consignee // ignore: cast_nullable_to_non_nullable
              as String,
      number_of_items: null == number_of_items
          ? _value.number_of_items
          : number_of_items // ignore: cast_nullable_to_non_nullable
              as int,
      no_damage: null == no_damage
          ? _value.no_damage
          : no_damage // ignore: cast_nullable_to_non_nullable
              as bool,
      link_check_required: null == link_check_required
          ? _value.link_check_required
          : link_check_required // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      grns_number: null == grns_number
          ? _value.grns_number
          : grns_number // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      qr_code: null == qr_code
          ? _value.qr_code
          : qr_code // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      transfer_to_dm: freezed == transfer_to_dm
          ? _value.transfer_to_dm
          : transfer_to_dm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      line_check_started: null == line_check_started
          ? _value.line_check_started
          : line_check_started // ignore: cast_nullable_to_non_nullable
              as String,
      current_step: null == current_step
          ? _value.current_step
          : current_step // ignore: cast_nullable_to_non_nullable
              as String,
      created_time: null == created_time
          ? _value.created_time
          : created_time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customer,
      int pieces,
      String supplier,
      String po_number,
      String consignee,
      int number_of_items,
      bool no_damage,
      bool link_check_required,
      int id,
      String grns_number,
      String status,
      String qr_code,
      String created,
      String updated,
      dynamic transfer_to_dm,
      String line_check_started,
      String current_step,
      String created_time});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? pieces = null,
    Object? supplier = null,
    Object? po_number = null,
    Object? consignee = null,
    Object? number_of_items = null,
    Object? no_damage = null,
    Object? link_check_required = null,
    Object? id = null,
    Object? grns_number = null,
    Object? status = null,
    Object? qr_code = null,
    Object? created = null,
    Object? updated = null,
    Object? transfer_to_dm = freezed,
    Object? line_check_started = null,
    Object? current_step = null,
    Object? created_time = null,
  }) {
    return _then(_$_Item(
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
      po_number: null == po_number
          ? _value.po_number
          : po_number // ignore: cast_nullable_to_non_nullable
              as String,
      consignee: null == consignee
          ? _value.consignee
          : consignee // ignore: cast_nullable_to_non_nullable
              as String,
      number_of_items: null == number_of_items
          ? _value.number_of_items
          : number_of_items // ignore: cast_nullable_to_non_nullable
              as int,
      no_damage: null == no_damage
          ? _value.no_damage
          : no_damage // ignore: cast_nullable_to_non_nullable
              as bool,
      link_check_required: null == link_check_required
          ? _value.link_check_required
          : link_check_required // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      grns_number: null == grns_number
          ? _value.grns_number
          : grns_number // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      qr_code: null == qr_code
          ? _value.qr_code
          : qr_code // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      transfer_to_dm: freezed == transfer_to_dm
          ? _value.transfer_to_dm
          : transfer_to_dm // ignore: cast_nullable_to_non_nullable
              as dynamic,
      line_check_started: null == line_check_started
          ? _value.line_check_started
          : line_check_started // ignore: cast_nullable_to_non_nullable
              as String,
      current_step: null == current_step
          ? _value.current_step
          : current_step // ignore: cast_nullable_to_non_nullable
              as String,
      created_time: null == created_time
          ? _value.created_time
          : created_time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item(
      {required this.customer,
      required this.pieces,
      required this.supplier,
      required this.po_number,
      required this.consignee,
      required this.number_of_items,
      required this.no_damage,
      required this.link_check_required,
      required this.id,
      required this.grns_number,
      required this.status,
      required this.qr_code,
      required this.created,
      required this.updated,
      required this.transfer_to_dm,
      required this.line_check_started,
      required this.current_step,
      required this.created_time});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String customer;
  @override
  final int pieces;
  @override
  final String supplier;
  @override
  final String po_number;
  @override
  final String consignee;
  @override
  final int number_of_items;
  @override
  final bool no_damage;
  @override
  final bool link_check_required;
  @override
  final int id;
  @override
  final String grns_number;
  @override
  final String status;
  @override
  final String qr_code;
  @override
  final String created;
  @override
  final String updated;
  @override
  final dynamic transfer_to_dm;
  @override
  final String line_check_started;
  @override
  final String current_step;
  @override
  final String created_time;

  @override
  String toString() {
    return 'Item(customer: $customer, pieces: $pieces, supplier: $supplier, po_number: $po_number, consignee: $consignee, number_of_items: $number_of_items, no_damage: $no_damage, link_check_required: $link_check_required, id: $id, grns_number: $grns_number, status: $status, qr_code: $qr_code, created: $created, updated: $updated, transfer_to_dm: $transfer_to_dm, line_check_started: $line_check_started, current_step: $current_step, created_time: $created_time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.pieces, pieces) || other.pieces == pieces) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.po_number, po_number) ||
                other.po_number == po_number) &&
            (identical(other.consignee, consignee) ||
                other.consignee == consignee) &&
            (identical(other.number_of_items, number_of_items) ||
                other.number_of_items == number_of_items) &&
            (identical(other.no_damage, no_damage) ||
                other.no_damage == no_damage) &&
            (identical(other.link_check_required, link_check_required) ||
                other.link_check_required == link_check_required) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.grns_number, grns_number) ||
                other.grns_number == grns_number) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.qr_code, qr_code) || other.qr_code == qr_code) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            const DeepCollectionEquality()
                .equals(other.transfer_to_dm, transfer_to_dm) &&
            (identical(other.line_check_started, line_check_started) ||
                other.line_check_started == line_check_started) &&
            (identical(other.current_step, current_step) ||
                other.current_step == current_step) &&
            (identical(other.created_time, created_time) ||
                other.created_time == created_time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customer,
      pieces,
      supplier,
      po_number,
      consignee,
      number_of_items,
      no_damage,
      link_check_required,
      id,
      grns_number,
      status,
      qr_code,
      created,
      updated,
      const DeepCollectionEquality().hash(transfer_to_dm),
      line_check_started,
      current_step,
      created_time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required final String customer,
      required final int pieces,
      required final String supplier,
      required final String po_number,
      required final String consignee,
      required final int number_of_items,
      required final bool no_damage,
      required final bool link_check_required,
      required final int id,
      required final String grns_number,
      required final String status,
      required final String qr_code,
      required final String created,
      required final String updated,
      required final dynamic transfer_to_dm,
      required final String line_check_started,
      required final String current_step,
      required final String created_time}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get customer;
  @override
  int get pieces;
  @override
  String get supplier;
  @override
  String get po_number;
  @override
  String get consignee;
  @override
  int get number_of_items;
  @override
  bool get no_damage;
  @override
  bool get link_check_required;
  @override
  int get id;
  @override
  String get grns_number;
  @override
  String get status;
  @override
  String get qr_code;
  @override
  String get created;
  @override
  String get updated;
  @override
  dynamic get transfer_to_dm;
  @override
  String get line_check_started;
  @override
  String get current_step;
  @override
  String get created_time;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
