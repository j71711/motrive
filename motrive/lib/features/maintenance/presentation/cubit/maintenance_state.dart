import 'package:equatable/equatable.dart';
import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';

abstract class MaintenanceState extends Equatable {
  const MaintenanceState();

  @override
  List<Object?> get props => [];
}

class MaintenanceInitialState extends MaintenanceState {}

class MaintenanceSuccessState extends MaintenanceState {
  final MaintenanceEntity maintenanceEntity;

  const MaintenanceSuccessState({required this.maintenanceEntity});

  @override
  List<Object?> get props => [maintenanceEntity];
}

class MaintenanceLoadingState extends MaintenanceState {}

class MaintenanceErrorState extends MaintenanceState {
  final String message;
  const MaintenanceErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
