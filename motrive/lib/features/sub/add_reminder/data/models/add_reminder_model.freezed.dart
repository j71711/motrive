// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_reminder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddReminderModel {

 String get title; String get category; String get triggerType; String? get notes; DateTime? get triggerDate; int? get triggerOdometer; int? get odometerAdvanceKm; int? get dateAdvanceDays; bool get isRecurring; String? get recurrenceUnit; int? get recurrenceValue;
/// Create a copy of AddReminderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddReminderModelCopyWith<AddReminderModel> get copyWith => _$AddReminderModelCopyWithImpl<AddReminderModel>(this as AddReminderModel, _$identity);

  /// Serializes this AddReminderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddReminderModel&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.triggerType, triggerType) || other.triggerType == triggerType)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerOdometer, triggerOdometer) || other.triggerOdometer == triggerOdometer)&&(identical(other.odometerAdvanceKm, odometerAdvanceKm) || other.odometerAdvanceKm == odometerAdvanceKm)&&(identical(other.dateAdvanceDays, dateAdvanceDays) || other.dateAdvanceDays == dateAdvanceDays)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.recurrenceUnit, recurrenceUnit) || other.recurrenceUnit == recurrenceUnit)&&(identical(other.recurrenceValue, recurrenceValue) || other.recurrenceValue == recurrenceValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,category,triggerType,notes,triggerDate,triggerOdometer,odometerAdvanceKm,dateAdvanceDays,isRecurring,recurrenceUnit,recurrenceValue);

@override
String toString() {
  return 'AddReminderModel(title: $title, category: $category, triggerType: $triggerType, notes: $notes, triggerDate: $triggerDate, triggerOdometer: $triggerOdometer, odometerAdvanceKm: $odometerAdvanceKm, dateAdvanceDays: $dateAdvanceDays, isRecurring: $isRecurring, recurrenceUnit: $recurrenceUnit, recurrenceValue: $recurrenceValue)';
}


}

/// @nodoc
abstract mixin class $AddReminderModelCopyWith<$Res>  {
  factory $AddReminderModelCopyWith(AddReminderModel value, $Res Function(AddReminderModel) _then) = _$AddReminderModelCopyWithImpl;
@useResult
$Res call({
 String title, String category, String triggerType, String? notes, DateTime? triggerDate, int? triggerOdometer, int? odometerAdvanceKm, int? dateAdvanceDays, bool isRecurring, String? recurrenceUnit, int? recurrenceValue
});




}
/// @nodoc
class _$AddReminderModelCopyWithImpl<$Res>
    implements $AddReminderModelCopyWith<$Res> {
  _$AddReminderModelCopyWithImpl(this._self, this._then);

  final AddReminderModel _self;
  final $Res Function(AddReminderModel) _then;

/// Create a copy of AddReminderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? category = null,Object? triggerType = null,Object? notes = freezed,Object? triggerDate = freezed,Object? triggerOdometer = freezed,Object? odometerAdvanceKm = freezed,Object? dateAdvanceDays = freezed,Object? isRecurring = null,Object? recurrenceUnit = freezed,Object? recurrenceValue = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
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
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddReminderModel].
extension AddReminderModelPatterns on AddReminderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddReminderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddReminderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddReminderModel value)  $default,){
final _that = this;
switch (_that) {
case _AddReminderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddReminderModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddReminderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String category,  String triggerType,  String? notes,  DateTime? triggerDate,  int? triggerOdometer,  int? odometerAdvanceKm,  int? dateAdvanceDays,  bool isRecurring,  String? recurrenceUnit,  int? recurrenceValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddReminderModel() when $default != null:
return $default(_that.title,_that.category,_that.triggerType,_that.notes,_that.triggerDate,_that.triggerOdometer,_that.odometerAdvanceKm,_that.dateAdvanceDays,_that.isRecurring,_that.recurrenceUnit,_that.recurrenceValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String category,  String triggerType,  String? notes,  DateTime? triggerDate,  int? triggerOdometer,  int? odometerAdvanceKm,  int? dateAdvanceDays,  bool isRecurring,  String? recurrenceUnit,  int? recurrenceValue)  $default,) {final _that = this;
switch (_that) {
case _AddReminderModel():
return $default(_that.title,_that.category,_that.triggerType,_that.notes,_that.triggerDate,_that.triggerOdometer,_that.odometerAdvanceKm,_that.dateAdvanceDays,_that.isRecurring,_that.recurrenceUnit,_that.recurrenceValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String category,  String triggerType,  String? notes,  DateTime? triggerDate,  int? triggerOdometer,  int? odometerAdvanceKm,  int? dateAdvanceDays,  bool isRecurring,  String? recurrenceUnit,  int? recurrenceValue)?  $default,) {final _that = this;
switch (_that) {
case _AddReminderModel() when $default != null:
return $default(_that.title,_that.category,_that.triggerType,_that.notes,_that.triggerDate,_that.triggerOdometer,_that.odometerAdvanceKm,_that.dateAdvanceDays,_that.isRecurring,_that.recurrenceUnit,_that.recurrenceValue);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _AddReminderModel implements AddReminderModel {
  const _AddReminderModel({required this.title, required this.category, required this.triggerType, this.notes, this.triggerDate, this.triggerOdometer, this.odometerAdvanceKm, this.dateAdvanceDays, required this.isRecurring, this.recurrenceUnit, this.recurrenceValue});
  factory _AddReminderModel.fromJson(Map<String, dynamic> json) => _$AddReminderModelFromJson(json);

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

/// Create a copy of AddReminderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddReminderModelCopyWith<_AddReminderModel> get copyWith => __$AddReminderModelCopyWithImpl<_AddReminderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddReminderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddReminderModel&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.triggerType, triggerType) || other.triggerType == triggerType)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerOdometer, triggerOdometer) || other.triggerOdometer == triggerOdometer)&&(identical(other.odometerAdvanceKm, odometerAdvanceKm) || other.odometerAdvanceKm == odometerAdvanceKm)&&(identical(other.dateAdvanceDays, dateAdvanceDays) || other.dateAdvanceDays == dateAdvanceDays)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.recurrenceUnit, recurrenceUnit) || other.recurrenceUnit == recurrenceUnit)&&(identical(other.recurrenceValue, recurrenceValue) || other.recurrenceValue == recurrenceValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,category,triggerType,notes,triggerDate,triggerOdometer,odometerAdvanceKm,dateAdvanceDays,isRecurring,recurrenceUnit,recurrenceValue);

@override
String toString() {
  return 'AddReminderModel(title: $title, category: $category, triggerType: $triggerType, notes: $notes, triggerDate: $triggerDate, triggerOdometer: $triggerOdometer, odometerAdvanceKm: $odometerAdvanceKm, dateAdvanceDays: $dateAdvanceDays, isRecurring: $isRecurring, recurrenceUnit: $recurrenceUnit, recurrenceValue: $recurrenceValue)';
}


}

/// @nodoc
abstract mixin class _$AddReminderModelCopyWith<$Res> implements $AddReminderModelCopyWith<$Res> {
  factory _$AddReminderModelCopyWith(_AddReminderModel value, $Res Function(_AddReminderModel) _then) = __$AddReminderModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String category, String triggerType, String? notes, DateTime? triggerDate, int? triggerOdometer, int? odometerAdvanceKm, int? dateAdvanceDays, bool isRecurring, String? recurrenceUnit, int? recurrenceValue
});




}
/// @nodoc
class __$AddReminderModelCopyWithImpl<$Res>
    implements _$AddReminderModelCopyWith<$Res> {
  __$AddReminderModelCopyWithImpl(this._self, this._then);

  final _AddReminderModel _self;
  final $Res Function(_AddReminderModel) _then;

/// Create a copy of AddReminderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? category = null,Object? triggerType = null,Object? notes = freezed,Object? triggerDate = freezed,Object? triggerOdometer = freezed,Object? odometerAdvanceKm = freezed,Object? dateAdvanceDays = freezed,Object? isRecurring = null,Object? recurrenceUnit = freezed,Object? recurrenceValue = freezed,}) {
  return _then(_AddReminderModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
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
as int?,
  ));
}


}

// dart format on
