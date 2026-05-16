import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/maintenance_details/domain/entities/service_part_info_entity.dart';
part 'service_part_info_model.freezed.dart';
part 'service_part_info_model.g.dart';

@freezed
abstract class ServicePartInfoModel with _$ServicePartInfoModel {
   // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory ServicePartInfoModel({
    required String id,
    required String partName,
    required String oemPartNumber,
    required String action,
    required String specification,
    required double quantity,
    required String quantityUnit,
  }) = _ServicePartInfoModel;

  factory ServicePartInfoModel.fromJson(Map<String, Object?> json) =>
      _$ServicePartInfoModelFromJson(json);
}

extension ServicePartInfoModelMapper on ServicePartInfoModel {
  ServicePartInfoEntity toEntity() {
    return ServicePartInfoEntity(
      id: id,
      partName: partName,
      oemPartNumber: oemPartNumber,
      action: action,
      specification: specification,
      quantity: quantity,
      quantityUnit: quantityUnit,
    );
  }
}
