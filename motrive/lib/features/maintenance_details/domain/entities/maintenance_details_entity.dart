import 'package:equatable/equatable.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:motrive/features/maintenance_details/domain/entities/service_part_info_entity.dart';

class MaintenanceDetailsEntity extends Equatable {
  final String id;
  final UserVehicleEntity vehicle;
  final List<ServicePartInfoEntity> parts;

  const MaintenanceDetailsEntity({
    required this.id,
    required this.parts,
    required this.vehicle,
  });

  @override
  List<Object?> get props => [parts, id, vehicle];
}
