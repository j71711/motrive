// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceInfoModel {

 String get id; int get serviceOdometer; int get dateIntervalMonths; String get severity; String get recommendation;
/// Create a copy of ServiceInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceInfoModelCopyWith<ServiceInfoModel> get copyWith => _$ServiceInfoModelCopyWithImpl<ServiceInfoModel>(this as ServiceInfoModel, _$identity);

  /// Serializes this ServiceInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceOdometer, serviceOdometer) || other.serviceOdometer == serviceOdometer)&&(identical(other.dateIntervalMonths, dateIntervalMonths) || other.dateIntervalMonths == dateIntervalMonths)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceOdometer,dateIntervalMonths,severity,recommendation);

@override
String toString() {
  return 'ServiceInfoModel(id: $id, serviceOdometer: $serviceOdometer, dateIntervalMonths: $dateIntervalMonths, severity: $severity, recommendation: $recommendation)';
}


}

/// @nodoc
abstract mixin class $ServiceInfoModelCopyWith<$Res>  {
  factory $ServiceInfoModelCopyWith(ServiceInfoModel value, $Res Function(ServiceInfoModel) _then) = _$ServiceInfoModelCopyWithImpl;
@useResult
$Res call({
 String id, int serviceOdometer, int dateIntervalMonths, String severity, String recommendation
});




}
/// @nodoc
class _$ServiceInfoModelCopyWithImpl<$Res>
    implements $ServiceInfoModelCopyWith<$Res> {
  _$ServiceInfoModelCopyWithImpl(this._self, this._then);

  final ServiceInfoModel _self;
  final $Res Function(ServiceInfoModel) _then;

/// Create a copy of ServiceInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceOdometer = null,Object? dateIntervalMonths = null,Object? severity = null,Object? recommendation = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,serviceOdometer: null == serviceOdometer ? _self.serviceOdometer : serviceOdometer // ignore: cast_nullable_to_non_nullable
as int,dateIntervalMonths: null == dateIntervalMonths ? _self.dateIntervalMonths : dateIntervalMonths // ignore: cast_nullable_to_non_nullable
as int,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,recommendation: null == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceInfoModel].
extension ServiceInfoModelPatterns on ServiceInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int serviceOdometer,  int dateIntervalMonths,  String severity,  String recommendation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceInfoModel() when $default != null:
return $default(_that.id,_that.serviceOdometer,_that.dateIntervalMonths,_that.severity,_that.recommendation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int serviceOdometer,  int dateIntervalMonths,  String severity,  String recommendation)  $default,) {final _that = this;
switch (_that) {
case _ServiceInfoModel():
return $default(_that.id,_that.serviceOdometer,_that.dateIntervalMonths,_that.severity,_that.recommendation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int serviceOdometer,  int dateIntervalMonths,  String severity,  String recommendation)?  $default,) {final _that = this;
switch (_that) {
case _ServiceInfoModel() when $default != null:
return $default(_that.id,_that.serviceOdometer,_that.dateIntervalMonths,_that.severity,_that.recommendation);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _ServiceInfoModel implements ServiceInfoModel {
  const _ServiceInfoModel({required this.id, required this.serviceOdometer, required this.dateIntervalMonths, required this.severity, required this.recommendation});
  factory _ServiceInfoModel.fromJson(Map<String, dynamic> json) => _$ServiceInfoModelFromJson(json);

@override final  String id;
@override final  int serviceOdometer;
@override final  int dateIntervalMonths;
@override final  String severity;
@override final  String recommendation;

/// Create a copy of ServiceInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceInfoModelCopyWith<_ServiceInfoModel> get copyWith => __$ServiceInfoModelCopyWithImpl<_ServiceInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceOdometer, serviceOdometer) || other.serviceOdometer == serviceOdometer)&&(identical(other.dateIntervalMonths, dateIntervalMonths) || other.dateIntervalMonths == dateIntervalMonths)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceOdometer,dateIntervalMonths,severity,recommendation);

@override
String toString() {
  return 'ServiceInfoModel(id: $id, serviceOdometer: $serviceOdometer, dateIntervalMonths: $dateIntervalMonths, severity: $severity, recommendation: $recommendation)';
}


}

/// @nodoc
abstract mixin class _$ServiceInfoModelCopyWith<$Res> implements $ServiceInfoModelCopyWith<$Res> {
  factory _$ServiceInfoModelCopyWith(_ServiceInfoModel value, $Res Function(_ServiceInfoModel) _then) = __$ServiceInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int serviceOdometer, int dateIntervalMonths, String severity, String recommendation
});




}
/// @nodoc
class __$ServiceInfoModelCopyWithImpl<$Res>
    implements _$ServiceInfoModelCopyWith<$Res> {
  __$ServiceInfoModelCopyWithImpl(this._self, this._then);

  final _ServiceInfoModel _self;
  final $Res Function(_ServiceInfoModel) _then;

/// Create a copy of ServiceInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceOdometer = null,Object? dateIntervalMonths = null,Object? severity = null,Object? recommendation = null,}) {
  return _then(_ServiceInfoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,serviceOdometer: null == serviceOdometer ? _self.serviceOdometer : serviceOdometer // ignore: cast_nullable_to_non_nullable
as int,dateIntervalMonths: null == dateIntervalMonths ? _self.dateIntervalMonths : dateIntervalMonths // ignore: cast_nullable_to_non_nullable
as int,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,recommendation: null == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
