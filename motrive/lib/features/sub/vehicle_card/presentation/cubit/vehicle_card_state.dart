import 'package:equatable/equatable.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';

abstract class VehicleCardState extends Equatable {
  const VehicleCardState();

  @override
  List<Object?> get props => [];
}

class VehicleCardInitialState extends VehicleCardState {}

class VehicleCardSuccessState extends VehicleCardState {
  final UserVehicleEntity vehicle;
  final bool isExpanded;

  const VehicleCardSuccessState({
    required this.vehicle,
    required this.isExpanded,
  });

  @override
  List<Object?> get props => [vehicle, isExpanded];
}

class VehicleCardErrorState extends VehicleCardState {
  final String message;
  const VehicleCardErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
