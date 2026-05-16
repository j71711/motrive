// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoadingModel {

@JsonKey(defaultValue: false) bool get isLogin; bool? get isUser;
/// Create a copy of LoadingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingModelCopyWith<LoadingModel> get copyWith => _$LoadingModelCopyWithImpl<LoadingModel>(this as LoadingModel, _$identity);

  /// Serializes this LoadingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingModel&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.isUser, isUser) || other.isUser == isUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLogin,isUser);

@override
String toString() {
  return 'LoadingModel(isLogin: $isLogin, isUser: $isUser)';
}


}

/// @nodoc
abstract mixin class $LoadingModelCopyWith<$Res>  {
  factory $LoadingModelCopyWith(LoadingModel value, $Res Function(LoadingModel) _then) = _$LoadingModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: false) bool isLogin, bool? isUser
});




}
/// @nodoc
class _$LoadingModelCopyWithImpl<$Res>
    implements $LoadingModelCopyWith<$Res> {
  _$LoadingModelCopyWithImpl(this._self, this._then);

  final LoadingModel _self;
  final $Res Function(LoadingModel) _then;

/// Create a copy of LoadingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLogin = null,Object? isUser = freezed,}) {
  return _then(_self.copyWith(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,isUser: freezed == isUser ? _self.isUser : isUser // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoadingModel].
extension LoadingModelPatterns on LoadingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoadingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoadingModel value)  $default,){
final _that = this;
switch (_that) {
case _LoadingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoadingModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoadingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: false)  bool isLogin,  bool? isUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadingModel() when $default != null:
return $default(_that.isLogin,_that.isUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: false)  bool isLogin,  bool? isUser)  $default,) {final _that = this;
switch (_that) {
case _LoadingModel():
return $default(_that.isLogin,_that.isUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: false)  bool isLogin,  bool? isUser)?  $default,) {final _that = this;
switch (_that) {
case _LoadingModel() when $default != null:
return $default(_that.isLogin,_that.isUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoadingModel implements LoadingModel {
  const _LoadingModel({@JsonKey(defaultValue: false) required this.isLogin, this.isUser});
  factory _LoadingModel.fromJson(Map<String, dynamic> json) => _$LoadingModelFromJson(json);

@override@JsonKey(defaultValue: false) final  bool isLogin;
@override final  bool? isUser;

/// Create a copy of LoadingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingModelCopyWith<_LoadingModel> get copyWith => __$LoadingModelCopyWithImpl<_LoadingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoadingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingModel&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.isUser, isUser) || other.isUser == isUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLogin,isUser);

@override
String toString() {
  return 'LoadingModel(isLogin: $isLogin, isUser: $isUser)';
}


}

/// @nodoc
abstract mixin class _$LoadingModelCopyWith<$Res> implements $LoadingModelCopyWith<$Res> {
  factory _$LoadingModelCopyWith(_LoadingModel value, $Res Function(_LoadingModel) _then) = __$LoadingModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: false) bool isLogin, bool? isUser
});




}
/// @nodoc
class __$LoadingModelCopyWithImpl<$Res>
    implements _$LoadingModelCopyWith<$Res> {
  __$LoadingModelCopyWithImpl(this._self, this._then);

  final _LoadingModel _self;
  final $Res Function(_LoadingModel) _then;

/// Create a copy of LoadingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLogin = null,Object? isUser = freezed,}) {
  return _then(_LoadingModel(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,isUser: freezed == isUser ? _self.isUser : isUser // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
