// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_part_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServicePartInfoModel _$ServicePartInfoModelFromJson(
  Map<String, dynamic> json,
) => _ServicePartInfoModel(
  id: json['id'] as String,
  partName: json['part_name'] as String,
  oemPartNumber: json['oem_part_number'] as String,
  action: json['action'] as String,
  specification: json['specification'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  quantityUnit: json['quantity_unit'] as String,
);

Map<String, dynamic> _$ServicePartInfoModelToJson(
  _ServicePartInfoModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'part_name': instance.partName,
  'oem_part_number': instance.oemPartNumber,
  'action': instance.action,
  'specification': instance.specification,
  'quantity': instance.quantity,
  'quantity_unit': instance.quantityUnit,
};
