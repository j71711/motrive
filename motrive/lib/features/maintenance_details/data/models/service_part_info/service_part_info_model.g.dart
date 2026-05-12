// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_part_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServicePartInfoModel _$ServicePartInfoModelFromJson(
  Map<String, dynamic> json,
) => _ServicePartInfoModel(
  id: json['id'] as String,
  partName: json['partName'] as String,
  oemPartNumber: json['oemPartNumber'] as String,
  action: json['action'] as String,
  specification: json['specification'] as String,
  quantity: (json['quantity'] as num).toInt(),
  quantityUnit: json['quantityUnit'] as String,
);

Map<String, dynamic> _$ServicePartInfoModelToJson(
  _ServicePartInfoModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'partName': instance.partName,
  'oemPartNumber': instance.oemPartNumber,
  'action': instance.action,
  'specification': instance.specification,
  'quantity': instance.quantity,
  'quantityUnit': instance.quantityUnit,
};
