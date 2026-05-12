import 'package:motrive/features/maintenance_details/data/models/service_part_info/service_part_info_model.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_details_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'maintenance_details_model.freezed.dart';
part 'maintenance_details_model.g.dart';

@freezed
abstract class MaintenanceDetailsModel with _$MaintenanceDetailsModel {
  const factory MaintenanceDetailsModel({
    required String id,
    required List<ServicePartInfoModel> parts,
  }) = _MaintenanceDetailsModel;

  factory MaintenanceDetailsModel.fromJson(Map<String, Object?> json) =>
      _$MaintenanceDetailsModelFromJson(json);
}

extension MaintenanceDetailsModelMapper on MaintenanceDetailsModel {
  MaintenanceDetailsEntity toEntity() {
    return MaintenanceDetailsEntity(
      id: id,
      parts: parts.map((e) => e.toEntity()).toList(),
    );
  }
}
