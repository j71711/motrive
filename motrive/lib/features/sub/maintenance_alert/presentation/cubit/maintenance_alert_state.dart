import 'package:equatable/equatable.dart';
import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';

abstract class MaintenanceAlertState extends Equatable {
  const MaintenanceAlertState();

  @override
  List<Object?> get props => [];
}

class MaintenanceAlertInitialState extends MaintenanceAlertState {}

class MaintenanceAlertSuccessState extends MaintenanceAlertState {
  final MaintenanceEntity? maintenance;

  const MaintenanceAlertSuccessState({required this.maintenance});

  @override
  List<Object?> get props => [maintenance];
}

class MaintenanceAlertErrorState extends MaintenanceAlertState {
  final String message;
  const MaintenanceAlertErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
