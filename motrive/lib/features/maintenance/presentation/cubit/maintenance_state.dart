import 'package:equatable/equatable.dart';
import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';

abstract class MaintenanceState extends Equatable {
  const MaintenanceState();

  @override
  List<Object?> get props => [];
}

class MaintenanceInitialState extends MaintenanceState {}

class MaintenanceSuccessState extends MaintenanceState {
  final MaintenanceEntity maintenanceEntity;
  final List<ServiceInfoEntity> services;
  final bool? allDisplayed;
  final bool? loadingMore;

  const MaintenanceSuccessState({
    required this.maintenanceEntity,
    required this.services,
    this.allDisplayed, this.loadingMore,
  });

  @override
  List<Object?> get props => [maintenanceEntity, services, allDisplayed, loadingMore];
}

class MaintenanceLoadingState extends MaintenanceState {}

class MaintenanceErrorState extends MaintenanceState {
  final String message;
  const MaintenanceErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
