import 'package:equatable/equatable.dart';
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';

abstract class ScanVehicleState extends Equatable {
  const ScanVehicleState();
  @override
  List<Object?> get props => [];
}

class ScanVehicleInitialState extends ScanVehicleState {
  final bool? scanning;

  const ScanVehicleInitialState({this.scanning});

  @override
  List<Object?> get props => [scanning];
}

class ScanVehicleLoadingState extends ScanVehicleState {}

class ScanVehicleSavedState extends ScanVehicleState {}

class ScanVehicleSuccessState extends ScanVehicleState {
  final ScanVehicleEntity vehicle;
  const ScanVehicleSuccessState(this.vehicle);
  @override
  List<Object?> get props => [vehicle];
}

class ScanVehicleErrorState extends ScanVehicleState {
  final String message;
  const ScanVehicleErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
