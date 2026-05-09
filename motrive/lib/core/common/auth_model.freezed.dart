// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthModel {

 String get id; String get email; String? get phone;@JsonKey(name: 'full_name') String? get fullName; String? get gender;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'date_of_birth') DateTime? get dateOfBirth;@JsonKey(name: 'auth_id') String? get authId;@JsonKey(name: 'notification_id') String? get notificationId;
/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthModelCopyWith<AuthModel> get copyWith => _$AuthModelCopyWithImpl<AuthModel>(this as AuthModel, _$identity);

  /// Serializes this AuthModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,phone,fullName,gender,avatarUrl,dateOfBirth,authId,notificationId);

@override
String toString() {
  return 'AuthModel(id: $id, email: $email, phone: $phone, fullName: $fullName, gender: $gender, avatarUrl: $avatarUrl, dateOfBirth: $dateOfBirth, authId: $authId, notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class $AuthModelCopyWith<$Res>  {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) _then) = _$AuthModelCopyWithImpl;
@useResult
$Res call({
 String id, String email, String? phone,@JsonKey(name: 'full_name') String? fullName, String? gender,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,@JsonKey(name: 'auth_id') String? authId,@JsonKey(name: 'notification_id') String? notificationId
});




}
/// @nodoc
class _$AuthModelCopyWithImpl<$Res>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._self, this._then);

  final AuthModel _self;
  final $Res Function(AuthModel) _then;

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? phone = freezed,Object? fullName = freezed,Object? gender = freezed,Object? avatarUrl = freezed,Object? dateOfBirth = freezed,Object? authId = freezed,Object? notificationId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,authId: freezed == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String?,notificationId: freezed == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthModel].
extension AuthModelPatterns on AuthModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String? phone, @JsonKey(name: 'full_name')  String? fullName,  String? gender, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'auth_id')  String? authId, @JsonKey(name: 'notification_id')  String? notificationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthModel() when $default != null:
return $default(_that.id,_that.email,_that.phone,_that.fullName,_that.gender,_that.avatarUrl,_that.dateOfBirth,_that.authId,_that.notificationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String? phone, @JsonKey(name: 'full_name')  String? fullName,  String? gender, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'auth_id')  String? authId, @JsonKey(name: 'notification_id')  String? notificationId)  $default,) {final _that = this;
switch (_that) {
case _AuthModel():
return $default(_that.id,_that.email,_that.phone,_that.fullName,_that.gender,_that.avatarUrl,_that.dateOfBirth,_that.authId,_that.notificationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String? phone, @JsonKey(name: 'full_name')  String? fullName,  String? gender, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'auth_id')  String? authId, @JsonKey(name: 'notification_id')  String? notificationId)?  $default,) {final _that = this;
switch (_that) {
case _AuthModel() when $default != null:
return $default(_that.id,_that.email,_that.phone,_that.fullName,_that.gender,_that.avatarUrl,_that.dateOfBirth,_that.authId,_that.notificationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthModel implements AuthModel {
  const _AuthModel({required this.id, required this.email, this.phone, @JsonKey(name: 'full_name') this.fullName, this.gender, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'date_of_birth') this.dateOfBirth, @JsonKey(name: 'auth_id') this.authId, @JsonKey(name: 'notification_id') this.notificationId});
  factory _AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

@override final  String id;
@override final  String email;
@override final  String? phone;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override final  String? gender;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'date_of_birth') final  DateTime? dateOfBirth;
@override@JsonKey(name: 'auth_id') final  String? authId;
@override@JsonKey(name: 'notification_id') final  String? notificationId;

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthModelCopyWith<_AuthModel> get copyWith => __$AuthModelCopyWithImpl<_AuthModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,phone,fullName,gender,avatarUrl,dateOfBirth,authId,notificationId);

@override
String toString() {
  return 'AuthModel(id: $id, email: $email, phone: $phone, fullName: $fullName, gender: $gender, avatarUrl: $avatarUrl, dateOfBirth: $dateOfBirth, authId: $authId, notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class _$AuthModelCopyWith<$Res> implements $AuthModelCopyWith<$Res> {
  factory _$AuthModelCopyWith(_AuthModel value, $Res Function(_AuthModel) _then) = __$AuthModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String? phone,@JsonKey(name: 'full_name') String? fullName, String? gender,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,@JsonKey(name: 'auth_id') String? authId,@JsonKey(name: 'notification_id') String? notificationId
});




}
/// @nodoc
class __$AuthModelCopyWithImpl<$Res>
    implements _$AuthModelCopyWith<$Res> {
  __$AuthModelCopyWithImpl(this._self, this._then);

  final _AuthModel _self;
  final $Res Function(_AuthModel) _then;

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? phone = freezed,Object? fullName = freezed,Object? gender = freezed,Object? avatarUrl = freezed,Object? dateOfBirth = freezed,Object? authId = freezed,Object? notificationId = freezed,}) {
  return _then(_AuthModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,authId: freezed == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String?,notificationId: freezed == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
