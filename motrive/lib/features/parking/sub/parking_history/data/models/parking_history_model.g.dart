// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingHistoryModel _$ParkingHistoryModelFromJson(Map<String, dynamic> json) =>
    _ParkingHistoryModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$ParkingHistoryModelToJson(
  _ParkingHistoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
