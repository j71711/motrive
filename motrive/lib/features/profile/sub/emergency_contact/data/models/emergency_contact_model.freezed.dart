// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmergencyContactModel {

 String get id;@JsonKey(name: 'user_id') String get userId; String get name;@JsonKey(name: 'phone_number') String get phoneNumber; String get relation;@JsonKey(name: 'notify_emergency') bool get notifyEmergency;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of EmergencyContactModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyContactModelCopyWith<EmergencyContactModel> get copyWith => _$EmergencyContactModelCopyWithImpl<EmergencyContactModel>(this as EmergencyContactModel, _$identity);

  /// Serializes this EmergencyContactModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyContactModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.relation, relation) || other.relation == relation)&&(identical(other.notifyEmergency, notifyEmergency) || other.notifyEmergency == notifyEmergency)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,phoneNumber,relation,notifyEmergency,createdAt);

@override
String toString() {
  return 'EmergencyContactModel(id: $id, userId: $userId, name: $name, phoneNumber: $phoneNumber, relation: $relation, notifyEmergency: $notifyEmergency, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $EmergencyContactModelCopyWith<$Res>  {
  factory $EmergencyContactModelCopyWith(EmergencyContactModel value, $Res Function(EmergencyContactModel) _then) = _$EmergencyContactModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String name,@JsonKey(name: 'phone_number') String phoneNumber, String relation,@JsonKey(name: 'notify_emergency') bool notifyEmergency,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$EmergencyContactModelCopyWithImpl<$Res>
    implements $EmergencyContactModelCopyWith<$Res> {
  _$EmergencyContactModelCopyWithImpl(this._self, this._then);

  final EmergencyContactModel _self;
  final $Res Function(EmergencyContactModel) _then;

/// Create a copy of EmergencyContactModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? phoneNumber = null,Object? relation = null,Object? notifyEmergency = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as String,notifyEmergency: null == notifyEmergency ? _self.notifyEmergency : notifyEmergency // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmergencyContactModel].
extension EmergencyContactModelPatterns on EmergencyContactModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyContactModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyContactModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyContactModel value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyContactModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyContactModel value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyContactModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String name, @JsonKey(name: 'phone_number')  String phoneNumber,  String relation, @JsonKey(name: 'notify_emergency')  bool notifyEmergency, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyContactModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.phoneNumber,_that.relation,_that.notifyEmergency,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String name, @JsonKey(name: 'phone_number')  String phoneNumber,  String relation, @JsonKey(name: 'notify_emergency')  bool notifyEmergency, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _EmergencyContactModel():
return $default(_that.id,_that.userId,_that.name,_that.phoneNumber,_that.relation,_that.notifyEmergency,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId,  String name, @JsonKey(name: 'phone_number')  String phoneNumber,  String relation, @JsonKey(name: 'notify_emergency')  bool notifyEmergency, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyContactModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.phoneNumber,_that.relation,_that.notifyEmergency,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmergencyContactModel implements EmergencyContactModel {
  const _EmergencyContactModel({required this.id, @JsonKey(name: 'user_id') required this.userId, required this.name, @JsonKey(name: 'phone_number') required this.phoneNumber, required this.relation, @JsonKey(name: 'notify_emergency') this.notifyEmergency = false, @JsonKey(name: 'created_at') this.createdAt});
  factory _EmergencyContactModel.fromJson(Map<String, dynamic> json) => _$EmergencyContactModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String name;
@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override final  String relation;
@override@JsonKey(name: 'notify_emergency') final  bool notifyEmergency;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of EmergencyContactModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyContactModelCopyWith<_EmergencyContactModel> get copyWith => __$EmergencyContactModelCopyWithImpl<_EmergencyContactModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmergencyContactModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyContactModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.relation, relation) || other.relation == relation)&&(identical(other.notifyEmergency, notifyEmergency) || other.notifyEmergency == notifyEmergency)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,phoneNumber,relation,notifyEmergency,createdAt);

@override
String toString() {
  return 'EmergencyContactModel(id: $id, userId: $userId, name: $name, phoneNumber: $phoneNumber, relation: $relation, notifyEmergency: $notifyEmergency, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$EmergencyContactModelCopyWith<$Res> implements $EmergencyContactModelCopyWith<$Res> {
  factory _$EmergencyContactModelCopyWith(_EmergencyContactModel value, $Res Function(_EmergencyContactModel) _then) = __$EmergencyContactModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String name,@JsonKey(name: 'phone_number') String phoneNumber, String relation,@JsonKey(name: 'notify_emergency') bool notifyEmergency,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$EmergencyContactModelCopyWithImpl<$Res>
    implements _$EmergencyContactModelCopyWith<$Res> {
  __$EmergencyContactModelCopyWithImpl(this._self, this._then);

  final _EmergencyContactModel _self;
  final $Res Function(_EmergencyContactModel) _then;

/// Create a copy of EmergencyContactModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? phoneNumber = null,Object? relation = null,Object? notifyEmergency = null,Object? createdAt = freezed,}) {
  return _then(_EmergencyContactModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as String,notifyEmergency: null == notifyEmergency ? _self.notifyEmergency : notifyEmergency // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
