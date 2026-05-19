// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserVehicleModel {

 String get userId; String get id; String get make; String get model; int get year; String? get color; String? get licensePlate; String? get vin; int? get currentOdometer; int? get odometerAtRegistered; String? get carInfoId;
/// Create a copy of UserVehicleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserVehicleModelCopyWith<UserVehicleModel> get copyWith => _$UserVehicleModelCopyWithImpl<UserVehicleModel>(this as UserVehicleModel, _$identity);

  /// Serializes this UserVehicleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserVehicleModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.color, color) || other.color == color)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.currentOdometer, currentOdometer) || other.currentOdometer == currentOdometer)&&(identical(other.odometerAtRegistered, odometerAtRegistered) || other.odometerAtRegistered == odometerAtRegistered)&&(identical(other.carInfoId, carInfoId) || other.carInfoId == carInfoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,id,make,model,year,color,licensePlate,vin,currentOdometer,odometerAtRegistered,carInfoId);

@override
String toString() {
  return 'UserVehicleModel(userId: $userId, id: $id, make: $make, model: $model, year: $year, color: $color, licensePlate: $licensePlate, vin: $vin, currentOdometer: $currentOdometer, odometerAtRegistered: $odometerAtRegistered, carInfoId: $carInfoId)';
}


}

/// @nodoc
abstract mixin class $UserVehicleModelCopyWith<$Res>  {
  factory $UserVehicleModelCopyWith(UserVehicleModel value, $Res Function(UserVehicleModel) _then) = _$UserVehicleModelCopyWithImpl;
@useResult
$Res call({
 String userId, String id, String make, String model, int year, String? color, String? licensePlate, String? vin, int? currentOdometer, int? odometerAtRegistered, String? carInfoId
});




}
/// @nodoc
class _$UserVehicleModelCopyWithImpl<$Res>
    implements $UserVehicleModelCopyWith<$Res> {
  _$UserVehicleModelCopyWithImpl(this._self, this._then);

  final UserVehicleModel _self;
  final $Res Function(UserVehicleModel) _then;

/// Create a copy of UserVehicleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? id = null,Object? make = null,Object? model = null,Object? year = null,Object? color = freezed,Object? licensePlate = freezed,Object? vin = freezed,Object? currentOdometer = freezed,Object? odometerAtRegistered = freezed,Object? carInfoId = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,licensePlate: freezed == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,currentOdometer: freezed == currentOdometer ? _self.currentOdometer : currentOdometer // ignore: cast_nullable_to_non_nullable
as int?,odometerAtRegistered: freezed == odometerAtRegistered ? _self.odometerAtRegistered : odometerAtRegistered // ignore: cast_nullable_to_non_nullable
as int?,carInfoId: freezed == carInfoId ? _self.carInfoId : carInfoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserVehicleModel].
extension UserVehicleModelPatterns on UserVehicleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserVehicleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserVehicleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserVehicleModel value)  $default,){
final _that = this;
switch (_that) {
case _UserVehicleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserVehicleModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserVehicleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String id,  String make,  String model,  int year,  String? color,  String? licensePlate,  String? vin,  int? currentOdometer,  int? odometerAtRegistered,  String? carInfoId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserVehicleModel() when $default != null:
return $default(_that.userId,_that.id,_that.make,_that.model,_that.year,_that.color,_that.licensePlate,_that.vin,_that.currentOdometer,_that.odometerAtRegistered,_that.carInfoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String id,  String make,  String model,  int year,  String? color,  String? licensePlate,  String? vin,  int? currentOdometer,  int? odometerAtRegistered,  String? carInfoId)  $default,) {final _that = this;
switch (_that) {
case _UserVehicleModel():
return $default(_that.userId,_that.id,_that.make,_that.model,_that.year,_that.color,_that.licensePlate,_that.vin,_that.currentOdometer,_that.odometerAtRegistered,_that.carInfoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String id,  String make,  String model,  int year,  String? color,  String? licensePlate,  String? vin,  int? currentOdometer,  int? odometerAtRegistered,  String? carInfoId)?  $default,) {final _that = this;
switch (_that) {
case _UserVehicleModel() when $default != null:
return $default(_that.userId,_that.id,_that.make,_that.model,_that.year,_that.color,_that.licensePlate,_that.vin,_that.currentOdometer,_that.odometerAtRegistered,_that.carInfoId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _UserVehicleModel implements UserVehicleModel {
  const _UserVehicleModel({required this.userId, required this.id, required this.make, required this.model, required this.year, this.color, this.licensePlate, this.vin, this.currentOdometer, this.odometerAtRegistered, this.carInfoId});
  factory _UserVehicleModel.fromJson(Map<String, dynamic> json) => _$UserVehicleModelFromJson(json);

@override final  String userId;
@override final  String id;
@override final  String make;
@override final  String model;
@override final  int year;
@override final  String? color;
@override final  String? licensePlate;
@override final  String? vin;
@override final  int? currentOdometer;
@override final  int? odometerAtRegistered;
@override final  String? carInfoId;

/// Create a copy of UserVehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserVehicleModelCopyWith<_UserVehicleModel> get copyWith => __$UserVehicleModelCopyWithImpl<_UserVehicleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserVehicleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserVehicleModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.color, color) || other.color == color)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.currentOdometer, currentOdometer) || other.currentOdometer == currentOdometer)&&(identical(other.odometerAtRegistered, odometerAtRegistered) || other.odometerAtRegistered == odometerAtRegistered)&&(identical(other.carInfoId, carInfoId) || other.carInfoId == carInfoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,id,make,model,year,color,licensePlate,vin,currentOdometer,odometerAtRegistered,carInfoId);

@override
String toString() {
  return 'UserVehicleModel(userId: $userId, id: $id, make: $make, model: $model, year: $year, color: $color, licensePlate: $licensePlate, vin: $vin, currentOdometer: $currentOdometer, odometerAtRegistered: $odometerAtRegistered, carInfoId: $carInfoId)';
}


}

/// @nodoc
abstract mixin class _$UserVehicleModelCopyWith<$Res> implements $UserVehicleModelCopyWith<$Res> {
  factory _$UserVehicleModelCopyWith(_UserVehicleModel value, $Res Function(_UserVehicleModel) _then) = __$UserVehicleModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, String id, String make, String model, int year, String? color, String? licensePlate, String? vin, int? currentOdometer, int? odometerAtRegistered, String? carInfoId
});




}
/// @nodoc
class __$UserVehicleModelCopyWithImpl<$Res>
    implements _$UserVehicleModelCopyWith<$Res> {
  __$UserVehicleModelCopyWithImpl(this._self, this._then);

  final _UserVehicleModel _self;
  final $Res Function(_UserVehicleModel) _then;

/// Create a copy of UserVehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? id = null,Object? make = null,Object? model = null,Object? year = null,Object? color = freezed,Object? licensePlate = freezed,Object? vin = freezed,Object? currentOdometer = freezed,Object? odometerAtRegistered = freezed,Object? carInfoId = freezed,}) {
  return _then(_UserVehicleModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,licensePlate: freezed == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,currentOdometer: freezed == currentOdometer ? _self.currentOdometer : currentOdometer // ignore: cast_nullable_to_non_nullable
as int?,odometerAtRegistered: freezed == odometerAtRegistered ? _self.odometerAtRegistered : odometerAtRegistered // ignore: cast_nullable_to_non_nullable
as int?,carInfoId: freezed == carInfoId ? _self.carInfoId : carInfoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
