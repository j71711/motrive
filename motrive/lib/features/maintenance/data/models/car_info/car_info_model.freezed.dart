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
mixin _$CarInfoModel {

 String get id; String get make; String get model; int get year; String get engine; String get manualSource; int get maintenanceOdometerInterval;
/// Create a copy of CarInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarInfoModelCopyWith<CarInfoModel> get copyWith => _$CarInfoModelCopyWithImpl<CarInfoModel>(this as CarInfoModel, _$identity);

  /// Serializes this CarInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.engine, engine) || other.engine == engine)&&(identical(other.manualSource, manualSource) || other.manualSource == manualSource)&&(identical(other.maintenanceOdometerInterval, maintenanceOdometerInterval) || other.maintenanceOdometerInterval == maintenanceOdometerInterval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,make,model,year,engine,manualSource,maintenanceOdometerInterval);

@override
String toString() {
  return 'CarInfoModel(id: $id, make: $make, model: $model, year: $year, engine: $engine, manualSource: $manualSource, maintenanceOdometerInterval: $maintenanceOdometerInterval)';
}


}

/// @nodoc
abstract mixin class $CarInfoModelCopyWith<$Res>  {
  factory $CarInfoModelCopyWith(CarInfoModel value, $Res Function(CarInfoModel) _then) = _$CarInfoModelCopyWithImpl;
@useResult
$Res call({
 String id, String make, String model, int year, String engine, String manualSource, int maintenanceOdometerInterval
});




}
/// @nodoc
class _$CarInfoModelCopyWithImpl<$Res>
    implements $CarInfoModelCopyWith<$Res> {
  _$CarInfoModelCopyWithImpl(this._self, this._then);

  final CarInfoModel _self;
  final $Res Function(CarInfoModel) _then;

/// Create a copy of CarInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? make = null,Object? model = null,Object? year = null,Object? engine = null,Object? manualSource = null,Object? maintenanceOdometerInterval = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,engine: null == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as String,manualSource: null == manualSource ? _self.manualSource : manualSource // ignore: cast_nullable_to_non_nullable
as String,maintenanceOdometerInterval: null == maintenanceOdometerInterval ? _self.maintenanceOdometerInterval : maintenanceOdometerInterval // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CarInfoModel].
extension CarInfoModelPatterns on CarInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _CarInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _CarInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String make,  String model,  int year,  String engine,  String manualSource,  int maintenanceOdometerInterval)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarInfoModel() when $default != null:
return $default(_that.id,_that.make,_that.model,_that.year,_that.engine,_that.manualSource,_that.maintenanceOdometerInterval);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String make,  String model,  int year,  String engine,  String manualSource,  int maintenanceOdometerInterval)  $default,) {final _that = this;
switch (_that) {
case _CarInfoModel():
return $default(_that.id,_that.make,_that.model,_that.year,_that.engine,_that.manualSource,_that.maintenanceOdometerInterval);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String make,  String model,  int year,  String engine,  String manualSource,  int maintenanceOdometerInterval)?  $default,) {final _that = this;
switch (_that) {
case _CarInfoModel() when $default != null:
return $default(_that.id,_that.make,_that.model,_that.year,_that.engine,_that.manualSource,_that.maintenanceOdometerInterval);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _CarInfoModel implements CarInfoModel {
  const _CarInfoModel({required this.id, required this.make, required this.model, required this.year, required this.engine, required this.manualSource, required this.maintenanceOdometerInterval});
  factory _CarInfoModel.fromJson(Map<String, dynamic> json) => _$CarInfoModelFromJson(json);

@override final  String id;
@override final  String make;
@override final  String model;
@override final  int year;
@override final  String engine;
@override final  String manualSource;
@override final  int maintenanceOdometerInterval;

/// Create a copy of CarInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarInfoModelCopyWith<_CarInfoModel> get copyWith => __$CarInfoModelCopyWithImpl<_CarInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.engine, engine) || other.engine == engine)&&(identical(other.manualSource, manualSource) || other.manualSource == manualSource)&&(identical(other.maintenanceOdometerInterval, maintenanceOdometerInterval) || other.maintenanceOdometerInterval == maintenanceOdometerInterval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,make,model,year,engine,manualSource,maintenanceOdometerInterval);

@override
String toString() {
  return 'CarInfoModel(id: $id, make: $make, model: $model, year: $year, engine: $engine, manualSource: $manualSource, maintenanceOdometerInterval: $maintenanceOdometerInterval)';
}


}

/// @nodoc
abstract mixin class _$CarInfoModelCopyWith<$Res> implements $CarInfoModelCopyWith<$Res> {
  factory _$CarInfoModelCopyWith(_CarInfoModel value, $Res Function(_CarInfoModel) _then) = __$CarInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String make, String model, int year, String engine, String manualSource, int maintenanceOdometerInterval
});




}
/// @nodoc
class __$CarInfoModelCopyWithImpl<$Res>
    implements _$CarInfoModelCopyWith<$Res> {
  __$CarInfoModelCopyWithImpl(this._self, this._then);

  final _CarInfoModel _self;
  final $Res Function(_CarInfoModel) _then;

/// Create a copy of CarInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? make = null,Object? model = null,Object? year = null,Object? engine = null,Object? manualSource = null,Object? maintenanceOdometerInterval = null,}) {
  return _then(_CarInfoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,engine: null == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as String,manualSource: null == manualSource ? _self.manualSource : manualSource // ignore: cast_nullable_to_non_nullable
as String,maintenanceOdometerInterval: null == maintenanceOdometerInterval ? _self.maintenanceOdometerInterval : maintenanceOdometerInterval // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
