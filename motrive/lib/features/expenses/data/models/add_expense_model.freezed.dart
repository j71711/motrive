// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddExpenseModel {

 String? get id;@JsonKey(name: 'vehicle_id') String? get vehicleId; String get category; double get cost;@JsonKey(name: 'odometer_at_expense') int get odometer; String? get notes;@JsonKey(name: 'expense_date') DateTime? get expenseDate;
/// Create a copy of AddExpenseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddExpenseModelCopyWith<AddExpenseModel> get copyWith => _$AddExpenseModelCopyWithImpl<AddExpenseModel>(this as AddExpenseModel, _$identity);

  /// Serializes this AddExpenseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddExpenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.category, category) || other.category == category)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.odometer, odometer) || other.odometer == odometer)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleId,category,cost,odometer,notes,expenseDate);

@override
String toString() {
  return 'AddExpenseModel(id: $id, vehicleId: $vehicleId, category: $category, cost: $cost, odometer: $odometer, notes: $notes, expenseDate: $expenseDate)';
}


}

/// @nodoc
abstract mixin class $AddExpenseModelCopyWith<$Res>  {
  factory $AddExpenseModelCopyWith(AddExpenseModel value, $Res Function(AddExpenseModel) _then) = _$AddExpenseModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'vehicle_id') String? vehicleId, String category, double cost,@JsonKey(name: 'odometer_at_expense') int odometer, String? notes,@JsonKey(name: 'expense_date') DateTime? expenseDate
});




}
/// @nodoc
class _$AddExpenseModelCopyWithImpl<$Res>
    implements $AddExpenseModelCopyWith<$Res> {
  _$AddExpenseModelCopyWithImpl(this._self, this._then);

  final AddExpenseModel _self;
  final $Res Function(AddExpenseModel) _then;

/// Create a copy of AddExpenseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? vehicleId = freezed,Object? category = null,Object? cost = null,Object? odometer = null,Object? notes = freezed,Object? expenseDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,vehicleId: freezed == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,odometer: null == odometer ? _self.odometer : odometer // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddExpenseModel].
extension AddExpenseModelPatterns on AddExpenseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddExpenseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddExpenseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddExpenseModel value)  $default,){
final _that = this;
switch (_that) {
case _AddExpenseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddExpenseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddExpenseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'vehicle_id')  String? vehicleId,  String category,  double cost, @JsonKey(name: 'odometer_at_expense')  int odometer,  String? notes, @JsonKey(name: 'expense_date')  DateTime? expenseDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddExpenseModel() when $default != null:
return $default(_that.id,_that.vehicleId,_that.category,_that.cost,_that.odometer,_that.notes,_that.expenseDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'vehicle_id')  String? vehicleId,  String category,  double cost, @JsonKey(name: 'odometer_at_expense')  int odometer,  String? notes, @JsonKey(name: 'expense_date')  DateTime? expenseDate)  $default,) {final _that = this;
switch (_that) {
case _AddExpenseModel():
return $default(_that.id,_that.vehicleId,_that.category,_that.cost,_that.odometer,_that.notes,_that.expenseDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'vehicle_id')  String? vehicleId,  String category,  double cost, @JsonKey(name: 'odometer_at_expense')  int odometer,  String? notes, @JsonKey(name: 'expense_date')  DateTime? expenseDate)?  $default,) {final _that = this;
switch (_that) {
case _AddExpenseModel() when $default != null:
return $default(_that.id,_that.vehicleId,_that.category,_that.cost,_that.odometer,_that.notes,_that.expenseDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddExpenseModel implements AddExpenseModel {
  const _AddExpenseModel({this.id, @JsonKey(name: 'vehicle_id') this.vehicleId, required this.category, required this.cost, @JsonKey(name: 'odometer_at_expense') required this.odometer, this.notes, @JsonKey(name: 'expense_date') this.expenseDate});
  factory _AddExpenseModel.fromJson(Map<String, dynamic> json) => _$AddExpenseModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'vehicle_id') final  String? vehicleId;
@override final  String category;
@override final  double cost;
@override@JsonKey(name: 'odometer_at_expense') final  int odometer;
@override final  String? notes;
@override@JsonKey(name: 'expense_date') final  DateTime? expenseDate;

/// Create a copy of AddExpenseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddExpenseModelCopyWith<_AddExpenseModel> get copyWith => __$AddExpenseModelCopyWithImpl<_AddExpenseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddExpenseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddExpenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.category, category) || other.category == category)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.odometer, odometer) || other.odometer == odometer)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleId,category,cost,odometer,notes,expenseDate);

@override
String toString() {
  return 'AddExpenseModel(id: $id, vehicleId: $vehicleId, category: $category, cost: $cost, odometer: $odometer, notes: $notes, expenseDate: $expenseDate)';
}


}

/// @nodoc
abstract mixin class _$AddExpenseModelCopyWith<$Res> implements $AddExpenseModelCopyWith<$Res> {
  factory _$AddExpenseModelCopyWith(_AddExpenseModel value, $Res Function(_AddExpenseModel) _then) = __$AddExpenseModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'vehicle_id') String? vehicleId, String category, double cost,@JsonKey(name: 'odometer_at_expense') int odometer, String? notes,@JsonKey(name: 'expense_date') DateTime? expenseDate
});




}
/// @nodoc
class __$AddExpenseModelCopyWithImpl<$Res>
    implements _$AddExpenseModelCopyWith<$Res> {
  __$AddExpenseModelCopyWithImpl(this._self, this._then);

  final _AddExpenseModel _self;
  final $Res Function(_AddExpenseModel) _then;

/// Create a copy of AddExpenseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? vehicleId = freezed,Object? category = null,Object? cost = null,Object? odometer = null,Object? notes = freezed,Object? expenseDate = freezed,}) {
  return _then(_AddExpenseModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,vehicleId: freezed == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,odometer: null == odometer ? _self.odometer : odometer // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
