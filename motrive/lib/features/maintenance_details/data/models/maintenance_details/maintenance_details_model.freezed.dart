// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaintenanceDetailsModel {

 String get id; List<ServicePartInfoModel> get parts;
/// Create a copy of MaintenanceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceDetailsModelCopyWith<MaintenanceDetailsModel> get copyWith => _$MaintenanceDetailsModelCopyWithImpl<MaintenanceDetailsModel>(this as MaintenanceDetailsModel, _$identity);

  /// Serializes this MaintenanceDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceDetailsModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.parts, parts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(parts));

@override
String toString() {
  return 'MaintenanceDetailsModel(id: $id, parts: $parts)';
}


}

/// @nodoc
abstract mixin class $MaintenanceDetailsModelCopyWith<$Res>  {
  factory $MaintenanceDetailsModelCopyWith(MaintenanceDetailsModel value, $Res Function(MaintenanceDetailsModel) _then) = _$MaintenanceDetailsModelCopyWithImpl;
@useResult
$Res call({
 String id, List<ServicePartInfoModel> parts
});




}
/// @nodoc
class _$MaintenanceDetailsModelCopyWithImpl<$Res>
    implements $MaintenanceDetailsModelCopyWith<$Res> {
  _$MaintenanceDetailsModelCopyWithImpl(this._self, this._then);

  final MaintenanceDetailsModel _self;
  final $Res Function(MaintenanceDetailsModel) _then;

/// Create a copy of MaintenanceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? parts = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<ServicePartInfoModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceDetailsModel].
extension MaintenanceDetailsModelPatterns on MaintenanceDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<ServicePartInfoModel> parts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceDetailsModel() when $default != null:
return $default(_that.id,_that.parts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<ServicePartInfoModel> parts)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceDetailsModel():
return $default(_that.id,_that.parts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<ServicePartInfoModel> parts)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceDetailsModel() when $default != null:
return $default(_that.id,_that.parts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceDetailsModel implements MaintenanceDetailsModel {
  const _MaintenanceDetailsModel({required this.id, required final  List<ServicePartInfoModel> parts}): _parts = parts;
  factory _MaintenanceDetailsModel.fromJson(Map<String, dynamic> json) => _$MaintenanceDetailsModelFromJson(json);

@override final  String id;
 final  List<ServicePartInfoModel> _parts;
@override List<ServicePartInfoModel> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}


/// Create a copy of MaintenanceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceDetailsModelCopyWith<_MaintenanceDetailsModel> get copyWith => __$MaintenanceDetailsModelCopyWithImpl<_MaintenanceDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceDetailsModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._parts, _parts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_parts));

@override
String toString() {
  return 'MaintenanceDetailsModel(id: $id, parts: $parts)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceDetailsModelCopyWith<$Res> implements $MaintenanceDetailsModelCopyWith<$Res> {
  factory _$MaintenanceDetailsModelCopyWith(_MaintenanceDetailsModel value, $Res Function(_MaintenanceDetailsModel) _then) = __$MaintenanceDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, List<ServicePartInfoModel> parts
});




}
/// @nodoc
class __$MaintenanceDetailsModelCopyWithImpl<$Res>
    implements _$MaintenanceDetailsModelCopyWith<$Res> {
  __$MaintenanceDetailsModelCopyWithImpl(this._self, this._then);

  final _MaintenanceDetailsModel _self;
  final $Res Function(_MaintenanceDetailsModel) _then;

/// Create a copy of MaintenanceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? parts = null,}) {
  return _then(_MaintenanceDetailsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<ServicePartInfoModel>,
  ));
}


}

// dart format on
