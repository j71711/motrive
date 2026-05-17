// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpensesModel implements DiagnosticableTreeMixin {

 String get id; String get category;@JsonKey(fromJson: toDouble) double? get cost;@JsonKey(name: 'expense_date') DateTime? get expenseDate;@JsonKey(name: 'odometer_at_expense', fromJson: toInt) int get odometer; String? get notes;
/// Create a copy of ExpensesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesModelCopyWith<ExpensesModel> get copyWith => _$ExpensesModelCopyWithImpl<ExpensesModel>(this as ExpensesModel, _$identity);

  /// Serializes this ExpensesModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ExpensesModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('cost', cost))..add(DiagnosticsProperty('expenseDate', expenseDate))..add(DiagnosticsProperty('odometer', odometer))..add(DiagnosticsProperty('notes', notes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.odometer, odometer) || other.odometer == odometer)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,cost,expenseDate,odometer,notes);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ExpensesModel(id: $id, category: $category, cost: $cost, expenseDate: $expenseDate, odometer: $odometer, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $ExpensesModelCopyWith<$Res>  {
  factory $ExpensesModelCopyWith(ExpensesModel value, $Res Function(ExpensesModel) _then) = _$ExpensesModelCopyWithImpl;
@useResult
$Res call({
 String id, String category,@JsonKey(fromJson: toDouble) double? cost,@JsonKey(name: 'expense_date') DateTime? expenseDate,@JsonKey(name: 'odometer_at_expense', fromJson: toInt) int odometer, String? notes
});




}
/// @nodoc
class _$ExpensesModelCopyWithImpl<$Res>
    implements $ExpensesModelCopyWith<$Res> {
  _$ExpensesModelCopyWithImpl(this._self, this._then);

  final ExpensesModel _self;
  final $Res Function(ExpensesModel) _then;

/// Create a copy of ExpensesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? cost = freezed,Object? expenseDate = freezed,Object? odometer = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double?,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,odometer: null == odometer ? _self.odometer : odometer // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpensesModel].
extension ExpensesModelPatterns on ExpensesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpensesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpensesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpensesModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpensesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpensesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpensesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String category, @JsonKey(fromJson: toDouble)  double? cost, @JsonKey(name: 'expense_date')  DateTime? expenseDate, @JsonKey(name: 'odometer_at_expense', fromJson: toInt)  int odometer,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpensesModel() when $default != null:
return $default(_that.id,_that.category,_that.cost,_that.expenseDate,_that.odometer,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String category, @JsonKey(fromJson: toDouble)  double? cost, @JsonKey(name: 'expense_date')  DateTime? expenseDate, @JsonKey(name: 'odometer_at_expense', fromJson: toInt)  int odometer,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _ExpensesModel():
return $default(_that.id,_that.category,_that.cost,_that.expenseDate,_that.odometer,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String category, @JsonKey(fromJson: toDouble)  double? cost, @JsonKey(name: 'expense_date')  DateTime? expenseDate, @JsonKey(name: 'odometer_at_expense', fromJson: toInt)  int odometer,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _ExpensesModel() when $default != null:
return $default(_that.id,_that.category,_that.cost,_that.expenseDate,_that.odometer,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpensesModel with DiagnosticableTreeMixin implements ExpensesModel {
  const _ExpensesModel({required this.id, required this.category, @JsonKey(fromJson: toDouble) this.cost, @JsonKey(name: 'expense_date') this.expenseDate, @JsonKey(name: 'odometer_at_expense', fromJson: toInt) required this.odometer, this.notes});
  factory _ExpensesModel.fromJson(Map<String, dynamic> json) => _$ExpensesModelFromJson(json);

@override final  String id;
@override final  String category;
@override@JsonKey(fromJson: toDouble) final  double? cost;
@override@JsonKey(name: 'expense_date') final  DateTime? expenseDate;
@override@JsonKey(name: 'odometer_at_expense', fromJson: toInt) final  int odometer;
@override final  String? notes;

/// Create a copy of ExpensesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpensesModelCopyWith<_ExpensesModel> get copyWith => __$ExpensesModelCopyWithImpl<_ExpensesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpensesModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ExpensesModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('cost', cost))..add(DiagnosticsProperty('expenseDate', expenseDate))..add(DiagnosticsProperty('odometer', odometer))..add(DiagnosticsProperty('notes', notes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpensesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.odometer, odometer) || other.odometer == odometer)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,cost,expenseDate,odometer,notes);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ExpensesModel(id: $id, category: $category, cost: $cost, expenseDate: $expenseDate, odometer: $odometer, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ExpensesModelCopyWith<$Res> implements $ExpensesModelCopyWith<$Res> {
  factory _$ExpensesModelCopyWith(_ExpensesModel value, $Res Function(_ExpensesModel) _then) = __$ExpensesModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String category,@JsonKey(fromJson: toDouble) double? cost,@JsonKey(name: 'expense_date') DateTime? expenseDate,@JsonKey(name: 'odometer_at_expense', fromJson: toInt) int odometer, String? notes
});




}
/// @nodoc
class __$ExpensesModelCopyWithImpl<$Res>
    implements _$ExpensesModelCopyWith<$Res> {
  __$ExpensesModelCopyWithImpl(this._self, this._then);

  final _ExpensesModel _self;
  final $Res Function(_ExpensesModel) _then;

/// Create a copy of ExpensesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? cost = freezed,Object? expenseDate = freezed,Object? odometer = null,Object? notes = freezed,}) {
  return _then(_ExpensesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double?,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,odometer: null == odometer ? _self.odometer : odometer // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
