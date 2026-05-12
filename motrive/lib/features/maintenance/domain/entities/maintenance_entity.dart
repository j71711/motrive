import 'package:equatable/equatable.dart';
import 'package:motrive/features/maintenance/domain/entities/car_info_entity.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';

class MaintenanceEntity extends Equatable {
  final CarInfoEntity carInfo;
  final List<ServiceInfoEntity> services;

  const MaintenanceEntity({required this.carInfo, required this.services});

  @override
  List<Object?> get props => [carInfo, services];
}
