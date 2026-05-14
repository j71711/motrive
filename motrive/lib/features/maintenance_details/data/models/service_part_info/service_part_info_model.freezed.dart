// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_part_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServicePartInfoModel {

 String get id; String get partName; String get oemPartNumber; String get action; String get specification; double get quantity; String get quantityUnit;
/// Create a copy of ServicePartInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServicePartInfoModelCopyWith<ServicePartInfoModel> get copyWith => _$ServicePartInfoModelCopyWithImpl<ServicePartInfoModel>(this as ServicePartInfoModel, _$identity);

  /// Serializes this ServicePartInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServicePartInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.partName, partName) || other.partName == partName)&&(identical(other.oemPartNumber, oemPartNumber) || other.oemPartNumber == oemPartNumber)&&(identical(other.action, action) || other.action == action)&&(identical(other.specification, specification) || other.specification == specification)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.quantityUnit, quantityUnit) || other.quantityUnit == quantityUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,partName,oemPartNumber,action,specification,quantity,quantityUnit);

@override
String toString() {
  return 'ServicePartInfoModel(id: $id, partName: $partName, oemPartNumber: $oemPartNumber, action: $action, specification: $specification, quantity: $quantity, quantityUnit: $quantityUnit)';
}


}

/// @nodoc
abstract mixin class $ServicePartInfoModelCopyWith<$Res>  {
  factory $ServicePartInfoModelCopyWith(ServicePartInfoModel value, $Res Function(ServicePartInfoModel) _then) = _$ServicePartInfoModelCopyWithImpl;
@useResult
$Res call({
 String id, String partName, String oemPartNumber, String action, String specification, double quantity, String quantityUnit
});




}
/// @nodoc
class _$ServicePartInfoModelCopyWithImpl<$Res>
    implements $ServicePartInfoModelCopyWith<$Res> {
  _$ServicePartInfoModelCopyWithImpl(this._self, this._then);

  final ServicePartInfoModel _self;
  final $Res Function(ServicePartInfoModel) _then;

/// Create a copy of ServicePartInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? partName = null,Object? oemPartNumber = null,Object? action = null,Object? specification = null,Object? quantity = null,Object? quantityUnit = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,partName: null == partName ? _self.partName : partName // ignore: cast_nullable_to_non_nullable
as String,oemPartNumber: null == oemPartNumber ? _self.oemPartNumber : oemPartNumber // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,specification: null == specification ? _self.specification : specification // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,quantityUnit: null == quantityUnit ? _self.quantityUnit : quantityUnit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ServicePartInfoModel].
extension ServicePartInfoModelPatterns on ServicePartInfoModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServicePartInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServicePartInfoModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServicePartInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ServicePartInfoModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServicePartInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServicePartInfoModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String partName,  String oemPartNumber,  String action,  String specification,  double quantity,  String quantityUnit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServicePartInfoModel() when $default != null:
return $default(_that.id,_that.partName,_that.oemPartNumber,_that.action,_that.specification,_that.quantity,_that.quantityUnit);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String partName,  String oemPartNumber,  String action,  String specification,  double quantity,  String quantityUnit)  $default,) {final _that = this;
switch (_that) {
case _ServicePartInfoModel():
return $default(_that.id,_that.partName,_that.oemPartNumber,_that.action,_that.specification,_that.quantity,_that.quantityUnit);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String partName,  String oemPartNumber,  String action,  String specification,  double quantity,  String quantityUnit)?  $default,) {final _that = this;
switch (_that) {
case _ServicePartInfoModel() when $default != null:
return $default(_that.id,_that.partName,_that.oemPartNumber,_that.action,_that.specification,_that.quantity,_that.quantityUnit);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _ServicePartInfoModel implements ServicePartInfoModel {
  const _ServicePartInfoModel({required this.id, required this.partName, required this.oemPartNumber, required this.action, required this.specification, required this.quantity, required this.quantityUnit});
  factory _ServicePartInfoModel.fromJson(Map<String, dynamic> json) => _$ServicePartInfoModelFromJson(json);

@override final  String id;
@override final  String partName;
@override final  String oemPartNumber;
@override final  String action;
@override final  String specification;
@override final  double quantity;
@override final  String quantityUnit;

/// Create a copy of ServicePartInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServicePartInfoModelCopyWith<_ServicePartInfoModel> get copyWith => __$ServicePartInfoModelCopyWithImpl<_ServicePartInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServicePartInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServicePartInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.partName, partName) || other.partName == partName)&&(identical(other.oemPartNumber, oemPartNumber) || other.oemPartNumber == oemPartNumber)&&(identical(other.action, action) || other.action == action)&&(identical(other.specification, specification) || other.specification == specification)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.quantityUnit, quantityUnit) || other.quantityUnit == quantityUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,partName,oemPartNumber,action,specification,quantity,quantityUnit);

@override
String toString() {
  return 'ServicePartInfoModel(id: $id, partName: $partName, oemPartNumber: $oemPartNumber, action: $action, specification: $specification, quantity: $quantity, quantityUnit: $quantityUnit)';
}


}

/// @nodoc
abstract mixin class _$ServicePartInfoModelCopyWith<$Res> implements $ServicePartInfoModelCopyWith<$Res> {
  factory _$ServicePartInfoModelCopyWith(_ServicePartInfoModel value, $Res Function(_ServicePartInfoModel) _then) = __$ServicePartInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String partName, String oemPartNumber, String action, String specification, double quantity, String quantityUnit
});




}
/// @nodoc
class __$ServicePartInfoModelCopyWithImpl<$Res>
    implements _$ServicePartInfoModelCopyWith<$Res> {
  __$ServicePartInfoModelCopyWithImpl(this._self, this._then);

  final _ServicePartInfoModel _self;
  final $Res Function(_ServicePartInfoModel) _then;

/// Create a copy of ServicePartInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? partName = null,Object? oemPartNumber = null,Object? action = null,Object? specification = null,Object? quantity = null,Object? quantityUnit = null,}) {
  return _then(_ServicePartInfoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,partName: null == partName ? _self.partName : partName // ignore: cast_nullable_to_non_nullable
as String,oemPartNumber: null == oemPartNumber ? _self.oemPartNumber : oemPartNumber // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,specification: null == specification ? _self.specification : specification // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,quantityUnit: null == quantityUnit ? _self.quantityUnit : quantityUnit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
