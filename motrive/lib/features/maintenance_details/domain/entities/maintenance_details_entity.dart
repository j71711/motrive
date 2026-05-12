import 'package:equatable/equatable.dart';
import 'package:motrive/features/maintenance_details/domain/entities/service_part_info_entity.dart';

class MaintenanceDetailsEntity extends Equatable {
  final String id;
  final List<ServicePartInfoEntity> parts;

  const MaintenanceDetailsEntity({
    required this.id,
    required this.parts,
  });

  @override
  List<Object?> get props => [parts, id];
}
