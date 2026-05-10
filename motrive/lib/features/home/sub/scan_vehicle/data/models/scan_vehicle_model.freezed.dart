// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_vehicle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanVehicleModel {

 String get vin; String get make; String get model; int get year;
/// Create a copy of ScanVehicleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanVehicleModelCopyWith<ScanVehicleModel> get copyWith => _$ScanVehicleModelCopyWithImpl<ScanVehicleModel>(this as ScanVehicleModel, _$identity);

  /// Serializes this ScanVehicleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanVehicleModel&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vin,make,model,year);

@override
String toString() {
  return 'ScanVehicleModel(vin: $vin, make: $make, model: $model, year: $year)';
}


}

/// @nodoc
abstract mixin class $ScanVehicleModelCopyWith<$Res>  {
  factory $ScanVehicleModelCopyWith(ScanVehicleModel value, $Res Function(ScanVehicleModel) _then) = _$ScanVehicleModelCopyWithImpl;
@useResult
$Res call({
 String vin, String make, String model, int year
});




}
/// @nodoc
class _$ScanVehicleModelCopyWithImpl<$Res>
    implements $ScanVehicleModelCopyWith<$Res> {
  _$ScanVehicleModelCopyWithImpl(this._self, this._then);

  final ScanVehicleModel _self;
  final $Res Function(ScanVehicleModel) _then;

/// Create a copy of ScanVehicleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vin = null,Object? make = null,Object? model = null,Object? year = null,}) {
  return _then(_self.copyWith(
vin: null == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanVehicleModel].
extension ScanVehicleModelPatterns on ScanVehicleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanVehicleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanVehicleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanVehicleModel value)  $default,){
final _that = this;
switch (_that) {
case _ScanVehicleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanVehicleModel value)?  $default,){
final _that = this;
switch (_that) {
case _ScanVehicleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String vin,  String make,  String model,  int year)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanVehicleModel() when $default != null:
return $default(_that.vin,_that.make,_that.model,_that.year);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String vin,  String make,  String model,  int year)  $default,) {final _that = this;
switch (_that) {
case _ScanVehicleModel():
return $default(_that.vin,_that.make,_that.model,_that.year);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String vin,  String make,  String model,  int year)?  $default,) {final _that = this;
switch (_that) {
case _ScanVehicleModel() when $default != null:
return $default(_that.vin,_that.make,_that.model,_that.year);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScanVehicleModel implements ScanVehicleModel {
  const _ScanVehicleModel({required this.vin, required this.make, required this.model, required this.year});
  factory _ScanVehicleModel.fromJson(Map<String, dynamic> json) => _$ScanVehicleModelFromJson(json);

@override final  String vin;
@override final  String make;
@override final  String model;
@override final  int year;

/// Create a copy of ScanVehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanVehicleModelCopyWith<_ScanVehicleModel> get copyWith => __$ScanVehicleModelCopyWithImpl<_ScanVehicleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanVehicleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanVehicleModel&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vin,make,model,year);

@override
String toString() {
  return 'ScanVehicleModel(vin: $vin, make: $make, model: $model, year: $year)';
}


}

/// @nodoc
abstract mixin class _$ScanVehicleModelCopyWith<$Res> implements $ScanVehicleModelCopyWith<$Res> {
  factory _$ScanVehicleModelCopyWith(_ScanVehicleModel value, $Res Function(_ScanVehicleModel) _then) = __$ScanVehicleModelCopyWithImpl;
@override @useResult
$Res call({
 String vin, String make, String model, int year
});




}
/// @nodoc
class __$ScanVehicleModelCopyWithImpl<$Res>
    implements _$ScanVehicleModelCopyWith<$Res> {
  __$ScanVehicleModelCopyWithImpl(this._self, this._then);

  final _ScanVehicleModel _self;
  final $Res Function(_ScanVehicleModel) _then;

/// Create a copy of ScanVehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vin = null,Object? make = null,Object? model = null,Object? year = null,}) {
  return _then(_ScanVehicleModel(
vin: null == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
