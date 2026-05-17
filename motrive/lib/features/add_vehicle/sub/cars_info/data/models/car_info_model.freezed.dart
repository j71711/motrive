// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CarsInfoModel {

 String get id; String get make; String get model; int get year; String? get engine; String? get manualSource; DateTime? get createdAt;
/// Create a copy of CarsInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarsInfoModelCopyWith<CarsInfoModel> get copyWith => _$CarsInfoModelCopyWithImpl<CarsInfoModel>(this as CarsInfoModel, _$identity);

  /// Serializes this CarsInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarsInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.engine, engine) || other.engine == engine)&&(identical(other.manualSource, manualSource) || other.manualSource == manualSource)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,make,model,year,engine,manualSource,createdAt);

@override
String toString() {
  return 'CarsInfoModel(id: $id, make: $make, model: $model, year: $year, engine: $engine, manualSource: $manualSource, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CarsInfoModelCopyWith<$Res>  {
  factory $CarsInfoModelCopyWith(CarsInfoModel value, $Res Function(CarsInfoModel) _then) = _$CarsInfoModelCopyWithImpl;
@useResult
$Res call({
 String id, String make, String model, int year, String? engine, String? manualSource, DateTime? createdAt
});




}
/// @nodoc
class _$CarsInfoModelCopyWithImpl<$Res>
    implements $CarsInfoModelCopyWith<$Res> {
  _$CarsInfoModelCopyWithImpl(this._self, this._then);

  final CarsInfoModel _self;
  final $Res Function(CarsInfoModel) _then;

/// Create a copy of CarsInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? make = null,Object? model = null,Object? year = null,Object? engine = freezed,Object? manualSource = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,engine: freezed == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as String?,manualSource: freezed == manualSource ? _self.manualSource : manualSource // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CarsInfoModel].
extension CarsInfoModelPatterns on CarsInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarsInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarsInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarsInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _CarsInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarsInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _CarsInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String make,  String model,  int year,  String? engine,  String? manualSource,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarsInfoModel() when $default != null:
return $default(_that.id,_that.make,_that.model,_that.year,_that.engine,_that.manualSource,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String make,  String model,  int year,  String? engine,  String? manualSource,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CarsInfoModel():
return $default(_that.id,_that.make,_that.model,_that.year,_that.engine,_that.manualSource,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String make,  String model,  int year,  String? engine,  String? manualSource,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CarsInfoModel() when $default != null:
return $default(_that.id,_that.make,_that.model,_that.year,_that.engine,_that.manualSource,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _CarsInfoModel implements CarsInfoModel {
  const _CarsInfoModel({required this.id, required this.make, required this.model, required this.year, this.engine, this.manualSource, this.createdAt});
  factory _CarsInfoModel.fromJson(Map<String, dynamic> json) => _$CarsInfoModelFromJson(json);

@override final  String id;
@override final  String make;
@override final  String model;
@override final  int year;
@override final  String? engine;
@override final  String? manualSource;
@override final  DateTime? createdAt;

/// Create a copy of CarsInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarsInfoModelCopyWith<_CarsInfoModel> get copyWith => __$CarsInfoModelCopyWithImpl<_CarsInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarsInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarsInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.engine, engine) || other.engine == engine)&&(identical(other.manualSource, manualSource) || other.manualSource == manualSource)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,make,model,year,engine,manualSource,createdAt);

@override
String toString() {
  return 'CarsInfoModel(id: $id, make: $make, model: $model, year: $year, engine: $engine, manualSource: $manualSource, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CarsInfoModelCopyWith<$Res> implements $CarsInfoModelCopyWith<$Res> {
  factory _$CarsInfoModelCopyWith(_CarsInfoModel value, $Res Function(_CarsInfoModel) _then) = __$CarsInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String make, String model, int year, String? engine, String? manualSource, DateTime? createdAt
});




}
/// @nodoc
class __$CarsInfoModelCopyWithImpl<$Res>
    implements _$CarsInfoModelCopyWith<$Res> {
  __$CarsInfoModelCopyWithImpl(this._self, this._then);

  final _CarsInfoModel _self;
  final $Res Function(_CarsInfoModel) _then;

/// Create a copy of CarsInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? make = null,Object? model = null,Object? year = null,Object? engine = freezed,Object? manualSource = freezed,Object? createdAt = freezed,}) {
  return _then(_CarsInfoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,engine: freezed == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as String?,manualSource: freezed == manualSource ? _self.manualSource : manualSource // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
