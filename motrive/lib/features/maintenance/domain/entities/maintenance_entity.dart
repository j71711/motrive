import 'package:equatable/equatable.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';

class MaintenanceEntity extends Equatable {
  final VehicleEntity vehicle;
  final List<ServiceInfoEntity> services;

  const MaintenanceEntity({required this.vehicle, required this.services});

  @override
  List<Object?> get props => [vehicle, services];
}
