// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParkingModel {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'vehicle_id') String? get vehicleId; double get latitude; double get longitude; String? get address; String? get notes;@JsonKey(name: 'detection_method') String get detectionMethod;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'parked_at') String get parkedAt;
/// Create a copy of ParkingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingModelCopyWith<ParkingModel> get copyWith => _$ParkingModelCopyWithImpl<ParkingModel>(this as ParkingModel, _$identity);

  /// Serializes this ParkingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.detectionMethod, detectionMethod) || other.detectionMethod == detectionMethod)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.parkedAt, parkedAt) || other.parkedAt == parkedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,vehicleId,latitude,longitude,address,notes,detectionMethod,isActive,parkedAt);

@override
String toString() {
  return 'ParkingModel(id: $id, userId: $userId, vehicleId: $vehicleId, latitude: $latitude, longitude: $longitude, address: $address, notes: $notes, detectionMethod: $detectionMethod, isActive: $isActive, parkedAt: $parkedAt)';
}


}

/// @nodoc
abstract mixin class $ParkingModelCopyWith<$Res>  {
  factory $ParkingModelCopyWith(ParkingModel value, $Res Function(ParkingModel) _then) = _$ParkingModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'vehicle_id') String? vehicleId, double latitude, double longitude, String? address, String? notes,@JsonKey(name: 'detection_method') String detectionMethod,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'parked_at') String parkedAt
});




}
/// @nodoc
class _$ParkingModelCopyWithImpl<$Res>
    implements $ParkingModelCopyWith<$Res> {
  _$ParkingModelCopyWithImpl(this._self, this._then);

  final ParkingModel _self;
  final $Res Function(ParkingModel) _then;

/// Create a copy of ParkingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? vehicleId = freezed,Object? latitude = null,Object? longitude = null,Object? address = freezed,Object? notes = freezed,Object? detectionMethod = null,Object? isActive = null,Object? parkedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,vehicleId: freezed == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,detectionMethod: null == detectionMethod ? _self.detectionMethod : detectionMethod // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,parkedAt: null == parkedAt ? _self.parkedAt : parkedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ParkingModel].
extension ParkingModelPatterns on ParkingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParkingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParkingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParkingModel value)  $default,){
final _that = this;
switch (_that) {
case _ParkingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParkingModel value)?  $default,){
final _that = this;
switch (_that) {
case _ParkingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'vehicle_id')  String? vehicleId,  double latitude,  double longitude,  String? address,  String? notes, @JsonKey(name: 'detection_method')  String detectionMethod, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'parked_at')  String parkedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParkingModel() when $default != null:
return $default(_that.id,_that.userId,_that.vehicleId,_that.latitude,_that.longitude,_that.address,_that.notes,_that.detectionMethod,_that.isActive,_that.parkedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'vehicle_id')  String? vehicleId,  double latitude,  double longitude,  String? address,  String? notes, @JsonKey(name: 'detection_method')  String detectionMethod, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'parked_at')  String parkedAt)  $default,) {final _that = this;
switch (_that) {
case _ParkingModel():
return $default(_that.id,_that.userId,_that.vehicleId,_that.latitude,_that.longitude,_that.address,_that.notes,_that.detectionMethod,_that.isActive,_that.parkedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'vehicle_id')  String? vehicleId,  double latitude,  double longitude,  String? address,  String? notes, @JsonKey(name: 'detection_method')  String detectionMethod, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'parked_at')  String parkedAt)?  $default,) {final _that = this;
switch (_that) {
case _ParkingModel() when $default != null:
return $default(_that.id,_that.userId,_that.vehicleId,_that.latitude,_that.longitude,_that.address,_that.notes,_that.detectionMethod,_that.isActive,_that.parkedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParkingModel implements ParkingModel {
  const _ParkingModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'vehicle_id') this.vehicleId, required this.latitude, required this.longitude, this.address, this.notes, @JsonKey(name: 'detection_method') required this.detectionMethod, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'parked_at') required this.parkedAt});
  factory _ParkingModel.fromJson(Map<String, dynamic> json) => _$ParkingModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'vehicle_id') final  String? vehicleId;
@override final  double latitude;
@override final  double longitude;
@override final  String? address;
@override final  String? notes;
@override@JsonKey(name: 'detection_method') final  String detectionMethod;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'parked_at') final  String parkedAt;

/// Create a copy of ParkingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingModelCopyWith<_ParkingModel> get copyWith => __$ParkingModelCopyWithImpl<_ParkingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParkingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.detectionMethod, detectionMethod) || other.detectionMethod == detectionMethod)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.parkedAt, parkedAt) || other.parkedAt == parkedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,vehicleId,latitude,longitude,address,notes,detectionMethod,isActive,parkedAt);

@override
String toString() {
  return 'ParkingModel(id: $id, userId: $userId, vehicleId: $vehicleId, latitude: $latitude, longitude: $longitude, address: $address, notes: $notes, detectionMethod: $detectionMethod, isActive: $isActive, parkedAt: $parkedAt)';
}


}

/// @nodoc
abstract mixin class _$ParkingModelCopyWith<$Res> implements $ParkingModelCopyWith<$Res> {
  factory _$ParkingModelCopyWith(_ParkingModel value, $Res Function(_ParkingModel) _then) = __$ParkingModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'vehicle_id') String? vehicleId, double latitude, double longitude, String? address, String? notes,@JsonKey(name: 'detection_method') String detectionMethod,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'parked_at') String parkedAt
});




}
/// @nodoc
class __$ParkingModelCopyWithImpl<$Res>
    implements _$ParkingModelCopyWith<$Res> {
  __$ParkingModelCopyWithImpl(this._self, this._then);

  final _ParkingModel _self;
  final $Res Function(_ParkingModel) _then;

/// Create a copy of ParkingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? vehicleId = freezed,Object? latitude = null,Object? longitude = null,Object? address = freezed,Object? notes = freezed,Object? detectionMethod = null,Object? isActive = null,Object? parkedAt = null,}) {
  return _then(_ParkingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,vehicleId: freezed == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,detectionMethod: null == detectionMethod ? _self.detectionMethod : detectionMethod // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,parkedAt: null == parkedAt ? _self.parkedAt : parkedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
