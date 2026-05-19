// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_car_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCarCardModel {

@JsonKey(name: 'user_id') String get userId; String get id; String get make; String get model; int get year; String? get color;@JsonKey(name: 'license_plate') String? get licensePlate; String? get vin;@JsonKey(name: 'current_odometer') int? get currentOdometer;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'car_info_id') String? get carInfoId;
/// Create a copy of AddCarCardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddCarCardModelCopyWith<AddCarCardModel> get copyWith => _$AddCarCardModelCopyWithImpl<AddCarCardModel>(this as AddCarCardModel, _$identity);

  /// Serializes this AddCarCardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddCarCardModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.color, color) || other.color == color)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.currentOdometer, currentOdometer) || other.currentOdometer == currentOdometer)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.carInfoId, carInfoId) || other.carInfoId == carInfoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,id,make,model,year,color,licensePlate,vin,currentOdometer,createdAt,carInfoId);

@override
String toString() {
  return 'AddCarCardModel(userId: $userId, id: $id, make: $make, model: $model, year: $year, color: $color, licensePlate: $licensePlate, vin: $vin, currentOdometer: $currentOdometer, createdAt: $createdAt, carInfoId: $carInfoId)';
}


}

/// @nodoc
abstract mixin class $AddCarCardModelCopyWith<$Res>  {
  factory $AddCarCardModelCopyWith(AddCarCardModel value, $Res Function(AddCarCardModel) _then) = _$AddCarCardModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String id, String make, String model, int year, String? color,@JsonKey(name: 'license_plate') String? licensePlate, String? vin,@JsonKey(name: 'current_odometer') int? currentOdometer,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'car_info_id') String? carInfoId
});




}
/// @nodoc
class _$AddCarCardModelCopyWithImpl<$Res>
    implements $AddCarCardModelCopyWith<$Res> {
  _$AddCarCardModelCopyWithImpl(this._self, this._then);

  final AddCarCardModel _self;
  final $Res Function(AddCarCardModel) _then;

/// Create a copy of AddCarCardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? id = null,Object? make = null,Object? model = null,Object? year = null,Object? color = freezed,Object? licensePlate = freezed,Object? vin = freezed,Object? currentOdometer = freezed,Object? createdAt = freezed,Object? carInfoId = freezed,}) {
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
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,carInfoId: freezed == carInfoId ? _self.carInfoId : carInfoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddCarCardModel].
extension AddCarCardModelPatterns on AddCarCardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddCarCardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddCarCardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddCarCardModel value)  $default,){
final _that = this;
switch (_that) {
case _AddCarCardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddCarCardModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddCarCardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String id,  String make,  String model,  int year,  String? color, @JsonKey(name: 'license_plate')  String? licensePlate,  String? vin, @JsonKey(name: 'current_odometer')  int? currentOdometer, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'car_info_id')  String? carInfoId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddCarCardModel() when $default != null:
return $default(_that.userId,_that.id,_that.make,_that.model,_that.year,_that.color,_that.licensePlate,_that.vin,_that.currentOdometer,_that.createdAt,_that.carInfoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String id,  String make,  String model,  int year,  String? color, @JsonKey(name: 'license_plate')  String? licensePlate,  String? vin, @JsonKey(name: 'current_odometer')  int? currentOdometer, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'car_info_id')  String? carInfoId)  $default,) {final _that = this;
switch (_that) {
case _AddCarCardModel():
return $default(_that.userId,_that.id,_that.make,_that.model,_that.year,_that.color,_that.licensePlate,_that.vin,_that.currentOdometer,_that.createdAt,_that.carInfoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId,  String id,  String make,  String model,  int year,  String? color, @JsonKey(name: 'license_plate')  String? licensePlate,  String? vin, @JsonKey(name: 'current_odometer')  int? currentOdometer, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'car_info_id')  String? carInfoId)?  $default,) {final _that = this;
switch (_that) {
case _AddCarCardModel() when $default != null:
return $default(_that.userId,_that.id,_that.make,_that.model,_that.year,_that.color,_that.licensePlate,_that.vin,_that.currentOdometer,_that.createdAt,_that.carInfoId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddCarCardModel implements AddCarCardModel {
  const _AddCarCardModel({@JsonKey(name: 'user_id') required this.userId, required this.id, required this.make, required this.model, required this.year, this.color, @JsonKey(name: 'license_plate') this.licensePlate, this.vin, @JsonKey(name: 'current_odometer') this.currentOdometer, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'car_info_id') this.carInfoId});
  factory _AddCarCardModel.fromJson(Map<String, dynamic> json) => _$AddCarCardModelFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override final  String id;
@override final  String make;
@override final  String model;
@override final  int year;
@override final  String? color;
@override@JsonKey(name: 'license_plate') final  String? licensePlate;
@override final  String? vin;
@override@JsonKey(name: 'current_odometer') final  int? currentOdometer;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'car_info_id') final  String? carInfoId;

/// Create a copy of AddCarCardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCarCardModelCopyWith<_AddCarCardModel> get copyWith => __$AddCarCardModelCopyWithImpl<_AddCarCardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddCarCardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCarCardModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.color, color) || other.color == color)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.currentOdometer, currentOdometer) || other.currentOdometer == currentOdometer)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.carInfoId, carInfoId) || other.carInfoId == carInfoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,id,make,model,year,color,licensePlate,vin,currentOdometer,createdAt,carInfoId);

@override
String toString() {
  return 'AddCarCardModel(userId: $userId, id: $id, make: $make, model: $model, year: $year, color: $color, licensePlate: $licensePlate, vin: $vin, currentOdometer: $currentOdometer, createdAt: $createdAt, carInfoId: $carInfoId)';
}


}

/// @nodoc
abstract mixin class _$AddCarCardModelCopyWith<$Res> implements $AddCarCardModelCopyWith<$Res> {
  factory _$AddCarCardModelCopyWith(_AddCarCardModel value, $Res Function(_AddCarCardModel) _then) = __$AddCarCardModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String id, String make, String model, int year, String? color,@JsonKey(name: 'license_plate') String? licensePlate, String? vin,@JsonKey(name: 'current_odometer') int? currentOdometer,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'car_info_id') String? carInfoId
});




}
/// @nodoc
class __$AddCarCardModelCopyWithImpl<$Res>
    implements _$AddCarCardModelCopyWith<$Res> {
  __$AddCarCardModelCopyWithImpl(this._self, this._then);

  final _AddCarCardModel _self;
  final $Res Function(_AddCarCardModel) _then;

/// Create a copy of AddCarCardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? id = null,Object? make = null,Object? model = null,Object? year = null,Object? color = freezed,Object? licensePlate = freezed,Object? vin = freezed,Object? currentOdometer = freezed,Object? createdAt = freezed,Object? carInfoId = freezed,}) {
  return _then(_AddCarCardModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,licensePlate: freezed == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,currentOdometer: freezed == currentOdometer ? _self.currentOdometer : currentOdometer // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,carInfoId: freezed == carInfoId ? _self.carInfoId : carInfoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
