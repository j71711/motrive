import 'package:motrive/features/maintenance/data/models/service_info/service_info_model.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'maintenance_model.freezed.dart';
part 'maintenance_model.g.dart';

@freezed
abstract class MaintenanceModel with _$MaintenanceModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory MaintenanceModel({
    required VehicleModel vehicle,
    required List<ServiceInfoModel> services,
  }) = _MaintenanceModel;

  factory MaintenanceModel.fromJson(Map<String, Object?> json) =>
      _$MaintenanceModelFromJson(json);
}

extension MaintenanceModelMapper on MaintenanceModel {
  MaintenanceEntity toEntity() {
    return MaintenanceEntity(
      vehicle: vehicle.toEntity(),
      services: services.map((e) => e.toEntity()).toList(),
    );
  }
}
