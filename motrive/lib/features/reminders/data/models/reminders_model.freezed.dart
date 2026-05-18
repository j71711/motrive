// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminders_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemindersModel {

 String get id; String get userId; String get vehicleId; String get title; String get category; String get triggerType; String? get notes; DateTime? get triggerDate; int? get triggerOdometer; int? get odometerAdvanceKm; int? get dateAdvanceDays; bool get isRecurring; String? get recurrenceUnit; int? get recurrenceValue; bool get isActive; bool get isDismissed; DateTime? get dismissedAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of RemindersModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemindersModelCopyWith<RemindersModel> get copyWith => _$RemindersModelCopyWithImpl<RemindersModel>(this as RemindersModel, _$identity);

  /// Serializes this RemindersModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemindersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.triggerType, triggerType) || other.triggerType == triggerType)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerOdometer, triggerOdometer) || other.triggerOdometer == triggerOdometer)&&(identical(other.odometerAdvanceKm, odometerAdvanceKm) || other.odometerAdvanceKm == odometerAdvanceKm)&&(identical(other.dateAdvanceDays, dateAdvanceDays) || other.dateAdvanceDays == dateAdvanceDays)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.recurrenceUnit, recurrenceUnit) || other.recurrenceUnit == recurrenceUnit)&&(identical(other.recurrenceValue, recurrenceValue) || other.recurrenceValue == recurrenceValue)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isDismissed, isDismissed) || other.isDismissed == isDismissed)&&(identical(other.dismissedAt, dismissedAt) || other.dismissedAt == dismissedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,vehicleId,title,category,triggerType,notes,triggerDate,triggerOdometer,odometerAdvanceKm,dateAdvanceDays,isRecurring,recurrenceUnit,recurrenceValue,isActive,isDismissed,dismissedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'RemindersModel(id: $id, userId: $userId, vehicleId: $vehicleId, title: $title, category: $category, triggerType: $triggerType, notes: $notes, triggerDate: $triggerDate, triggerOdometer: $triggerOdometer, odometerAdvanceKm: $odometerAdvanceKm, dateAdvanceDays: $dateAdvanceDays, isRecurring: $isRecurring, recurrenceUnit: $recurrenceUnit, recurrenceValue: $recurrenceValue, isActive: $isActive, isDismissed: $isDismissed, dismissedAt: $dismissedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RemindersModelCopyWith<$Res>  {
  factory $RemindersModelCopyWith(RemindersModel value, $Res Function(RemindersModel) _then) = _$RemindersModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String vehicleId, String title, String category, String triggerType, String? notes, DateTime? triggerDate, int? triggerOdometer, int? odometerAdvanceKm, int? dateAdvanceDays, bool isRecurring, String? recurrenceUnit, int? recurrenceValue, bool isActive, bool isDismissed, DateTime? dismissedAt, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$RemindersModelCopyWithImpl<$Res>
    implements $RemindersModelCopyWith<$Res> {
  _$RemindersModelCopyWithImpl(this._self, this._then);

  final RemindersModel _self;
  final $Res Function(RemindersModel) _then;

/// Create a copy of RemindersModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? vehicleId = null,Object? title = null,Object? category = null,Object? triggerType = null,Object? notes = freezed,Object? triggerDate = freezed,Object? triggerOdometer = freezed,Object? odometerAdvanceKm = freezed,Object? dateAdvanceDays = freezed,Object? isRecurring = null,Object? recurrenceUnit = freezed,Object? recurrenceValue = freezed,Object? isActive = null,Object? isDismissed = null,Object? dismissedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,triggerType: null == triggerType ? _self.triggerType : triggerType // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,triggerDate: freezed == triggerDate ? _self.triggerDate : triggerDate // ignore: cast_nullable_to_non_nullable
as DateTime?,triggerOdometer: freezed == triggerOdometer ? _self.triggerOdometer : triggerOdometer // ignore: cast_nullable_to_non_nullable
as int?,odometerAdvanceKm: freezed == odometerAdvanceKm ? _self.odometerAdvanceKm : odometerAdvanceKm // ignore: cast_nullable_to_non_nullable
as int?,dateAdvanceDays: freezed == dateAdvanceDays ? _self.dateAdvanceDays : dateAdvanceDays // ignore: cast_nullable_to_non_nullable
as int?,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,recurrenceUnit: freezed == recurrenceUnit ? _self.recurrenceUnit : recurrenceUnit // ignore: cast_nullable_to_non_nullable
as String?,recurrenceValue: freezed == recurrenceValue ? _self.recurrenceValue : recurrenceValue // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isDismissed: null == isDismissed ? _self.isDismissed : isDismissed // ignore: cast_nullable_to_non_nullable
as bool,dismissedAt: freezed == dismissedAt ? _self.dismissedAt : dismissedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [RemindersModel].
extension RemindersModelPatterns on RemindersModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemindersModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemindersModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemindersModel value)  $default,){
final _that = this;
switch (_that) {
case _RemindersModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemindersModel value)?  $default,){
final _that = this;
switch (_that) {
case _RemindersModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String vehicleId,  String title,  String category,  String triggerType,  String? notes,  DateTime? triggerDate,  int? triggerOdometer,  int? odometerAdvanceKm,  int? dateAdvanceDays,  bool isRecurring,  String? recurrenceUnit,  int? recurrenceValue,  bool isActive,  bool isDismissed,  DateTime? dismissedAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemindersModel() when $default != null:
return $default(_that.id,_that.userId,_that.vehicleId,_that.title,_that.category,_that.triggerType,_that.notes,_that.triggerDate,_that.triggerOdometer,_that.odometerAdvanceKm,_that.dateAdvanceDays,_that.isRecurring,_that.recurrenceUnit,_that.recurrenceValue,_that.isActive,_that.isDismissed,_that.dismissedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String vehicleId,  String title,  String category,  String triggerType,  String? notes,  DateTime? triggerDate,  int? triggerOdometer,  int? odometerAdvanceKm,  int? dateAdvanceDays,  bool isRecurring,  String? recurrenceUnit,  int? recurrenceValue,  bool isActive,  bool isDismissed,  DateTime? dismissedAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RemindersModel():
return $default(_that.id,_that.userId,_that.vehicleId,_that.title,_that.category,_that.triggerType,_that.notes,_that.triggerDate,_that.triggerOdometer,_that.odometerAdvanceKm,_that.dateAdvanceDays,_that.isRecurring,_that.recurrenceUnit,_that.recurrenceValue,_that.isActive,_that.isDismissed,_that.dismissedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String vehicleId,  String title,  String category,  String triggerType,  String? notes,  DateTime? triggerDate,  int? triggerOdometer,  int? odometerAdvanceKm,  int? dateAdvanceDays,  bool isRecurring,  String? recurrenceUnit,  int? recurrenceValue,  bool isActive,  bool isDismissed,  DateTime? dismissedAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RemindersModel() when $default != null:
return $default(_that.id,_that.userId,_that.vehicleId,_that.title,_that.category,_that.triggerType,_that.notes,_that.triggerDate,_that.triggerOdometer,_that.odometerAdvanceKm,_that.dateAdvanceDays,_that.isRecurring,_that.recurrenceUnit,_that.recurrenceValue,_that.isActive,_that.isDismissed,_that.dismissedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _RemindersModel implements RemindersModel {
  const _RemindersModel({required this.id, required this.userId, required this.vehicleId, required this.title, required this.category, required this.triggerType, this.notes, this.triggerDate, this.triggerOdometer, this.odometerAdvanceKm, this.dateAdvanceDays, required this.isRecurring, this.recurrenceUnit, this.recurrenceValue, required this.isActive, required this.isDismissed, this.dismissedAt, this.createdAt, this.updatedAt});
  factory _RemindersModel.fromJson(Map<String, dynamic> json) => _$RemindersModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String vehicleId;
@override final  String title;
@override final  String category;
@override final  String triggerType;
@override final  String? notes;
@override final  DateTime? triggerDate;
@override final  int? triggerOdometer;
@override final  int? odometerAdvanceKm;
@override final  int? dateAdvanceDays;
@override final  bool isRecurring;
@override final  String? recurrenceUnit;
@override final  int? recurrenceValue;
@override final  bool isActive;
@override final  bool isDismissed;
@override final  DateTime? dismissedAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of RemindersModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemindersModelCopyWith<_RemindersModel> get copyWith => __$RemindersModelCopyWithImpl<_RemindersModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemindersModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemindersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.triggerType, triggerType) || other.triggerType == triggerType)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerOdometer, triggerOdometer) || other.triggerOdometer == triggerOdometer)&&(identical(other.odometerAdvanceKm, odometerAdvanceKm) || other.odometerAdvanceKm == odometerAdvanceKm)&&(identical(other.dateAdvanceDays, dateAdvanceDays) || other.dateAdvanceDays == dateAdvanceDays)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.recurrenceUnit, recurrenceUnit) || other.recurrenceUnit == recurrenceUnit)&&(identical(other.recurrenceValue, recurrenceValue) || other.recurrenceValue == recurrenceValue)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isDismissed, isDismissed) || other.isDismissed == isDismissed)&&(identical(other.dismissedAt, dismissedAt) || other.dismissedAt == dismissedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,vehicleId,title,category,triggerType,notes,triggerDate,triggerOdometer,odometerAdvanceKm,dateAdvanceDays,isRecurring,recurrenceUnit,recurrenceValue,isActive,isDismissed,dismissedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'RemindersModel(id: $id, userId: $userId, vehicleId: $vehicleId, title: $title, category: $category, triggerType: $triggerType, notes: $notes, triggerDate: $triggerDate, triggerOdometer: $triggerOdometer, odometerAdvanceKm: $odometerAdvanceKm, dateAdvanceDays: $dateAdvanceDays, isRecurring: $isRecurring, recurrenceUnit: $recurrenceUnit, recurrenceValue: $recurrenceValue, isActive: $isActive, isDismissed: $isDismissed, dismissedAt: $dismissedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RemindersModelCopyWith<$Res> implements $RemindersModelCopyWith<$Res> {
  factory _$RemindersModelCopyWith(_RemindersModel value, $Res Function(_RemindersModel) _then) = __$RemindersModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String vehicleId, String title, String category, String triggerType, String? notes, DateTime? triggerDate, int? triggerOdometer, int? odometerAdvanceKm, int? dateAdvanceDays, bool isRecurring, String? recurrenceUnit, int? recurrenceValue, bool isActive, bool isDismissed, DateTime? dismissedAt, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$RemindersModelCopyWithImpl<$Res>
    implements _$RemindersModelCopyWith<$Res> {
  __$RemindersModelCopyWithImpl(this._self, this._then);

  final _RemindersModel _self;
  final $Res Function(_RemindersModel) _then;

/// Create a copy of RemindersModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? vehicleId = null,Object? title = null,Object? category = null,Object? triggerType = null,Object? notes = freezed,Object? triggerDate = freezed,Object? triggerOdometer = freezed,Object? odometerAdvanceKm = freezed,Object? dateAdvanceDays = freezed,Object? isRecurring = null,Object? recurrenceUnit = freezed,Object? recurrenceValue = freezed,Object? isActive = null,Object? isDismissed = null,Object? dismissedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RemindersModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,triggerType: null == triggerType ? _self.triggerType : triggerType // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,triggerDate: freezed == triggerDate ? _self.triggerDate : triggerDate // ignore: cast_nullable_to_non_nullable
as DateTime?,triggerOdometer: freezed == triggerOdometer ? _self.triggerOdometer : triggerOdometer // ignore: cast_nullable_to_non_nullable
as int?,odometerAdvanceKm: freezed == odometerAdvanceKm ? _self.odometerAdvanceKm : odometerAdvanceKm // ignore: cast_nullable_to_non_nullable
as int?,dateAdvanceDays: freezed == dateAdvanceDays ? _self.dateAdvanceDays : dateAdvanceDays // ignore: cast_nullable_to_non_nullable
as int?,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,recurrenceUnit: freezed == recurrenceUnit ? _self.recurrenceUnit : recurrenceUnit // ignore: cast_nullable_to_non_nullable
as String?,recurrenceValue: freezed == recurrenceValue ? _self.recurrenceValue : recurrenceValue // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isDismissed: null == isDismissed ? _self.isDismissed : isDismissed // ignore: cast_nullable_to_non_nullable
as bool,dismissedAt: freezed == dismissedAt ? _self.dismissedAt : dismissedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
