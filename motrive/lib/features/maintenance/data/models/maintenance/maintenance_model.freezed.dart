// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaintenanceModel {

 UserVehicleModel get vehicle; List<ServiceInfoModel> get services;
/// Create a copy of MaintenanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceModelCopyWith<MaintenanceModel> get copyWith => _$MaintenanceModelCopyWithImpl<MaintenanceModel>(this as MaintenanceModel, _$identity);

  /// Serializes this MaintenanceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceModel&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&const DeepCollectionEquality().equals(other.services, services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicle,const DeepCollectionEquality().hash(services));

@override
String toString() {
  return 'MaintenanceModel(vehicle: $vehicle, services: $services)';
}


}

/// @nodoc
abstract mixin class $MaintenanceModelCopyWith<$Res>  {
  factory $MaintenanceModelCopyWith(MaintenanceModel value, $Res Function(MaintenanceModel) _then) = _$MaintenanceModelCopyWithImpl;
@useResult
$Res call({
 UserVehicleModel vehicle, List<ServiceInfoModel> services
});


$UserVehicleModelCopyWith<$Res> get vehicle;

}
/// @nodoc
class _$MaintenanceModelCopyWithImpl<$Res>
    implements $MaintenanceModelCopyWith<$Res> {
  _$MaintenanceModelCopyWithImpl(this._self, this._then);

  final MaintenanceModel _self;
  final $Res Function(MaintenanceModel) _then;

/// Create a copy of MaintenanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicle = null,Object? services = null,}) {
  return _then(_self.copyWith(
vehicle: null == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as UserVehicleModel,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceInfoModel>,
  ));
}
/// Create a copy of MaintenanceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserVehicleModelCopyWith<$Res> get vehicle {
  
  return $UserVehicleModelCopyWith<$Res>(_self.vehicle, (value) {
    return _then(_self.copyWith(vehicle: value));
  });
}
}


/// Adds pattern-matching-related methods to [MaintenanceModel].
extension MaintenanceModelPatterns on MaintenanceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceModel value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserVehicleModel vehicle,  List<ServiceInfoModel> services)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceModel() when $default != null:
return $default(_that.vehicle,_that.services);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserVehicleModel vehicle,  List<ServiceInfoModel> services)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceModel():
return $default(_that.vehicle,_that.services);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserVehicleModel vehicle,  List<ServiceInfoModel> services)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceModel() when $default != null:
return $default(_that.vehicle,_that.services);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _MaintenanceModel implements MaintenanceModel {
  const _MaintenanceModel({required this.vehicle, required final  List<ServiceInfoModel> services}): _services = services;
  factory _MaintenanceModel.fromJson(Map<String, dynamic> json) => _$MaintenanceModelFromJson(json);

@override final  UserVehicleModel vehicle;
 final  List<ServiceInfoModel> _services;
@override List<ServiceInfoModel> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}


/// Create a copy of MaintenanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceModelCopyWith<_MaintenanceModel> get copyWith => __$MaintenanceModelCopyWithImpl<_MaintenanceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceModel&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&const DeepCollectionEquality().equals(other._services, _services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicle,const DeepCollectionEquality().hash(_services));

@override
String toString() {
  return 'MaintenanceModel(vehicle: $vehicle, services: $services)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceModelCopyWith<$Res> implements $MaintenanceModelCopyWith<$Res> {
  factory _$MaintenanceModelCopyWith(_MaintenanceModel value, $Res Function(_MaintenanceModel) _then) = __$MaintenanceModelCopyWithImpl;
@override @useResult
$Res call({
 UserVehicleModel vehicle, List<ServiceInfoModel> services
});


@override $UserVehicleModelCopyWith<$Res> get vehicle;

}
/// @nodoc
class __$MaintenanceModelCopyWithImpl<$Res>
    implements _$MaintenanceModelCopyWith<$Res> {
  __$MaintenanceModelCopyWithImpl(this._self, this._then);

  final _MaintenanceModel _self;
  final $Res Function(_MaintenanceModel) _then;

/// Create a copy of MaintenanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicle = null,Object? services = null,}) {
  return _then(_MaintenanceModel(
vehicle: null == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as UserVehicleModel,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceInfoModel>,
  ));
}

/// Create a copy of MaintenanceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserVehicleModelCopyWith<$Res> get vehicle {
  
  return $UserVehicleModelCopyWith<$Res>(_self.vehicle, (value) {
    return _then(_self.copyWith(vehicle: value));
  });
}
}

// dart format on
