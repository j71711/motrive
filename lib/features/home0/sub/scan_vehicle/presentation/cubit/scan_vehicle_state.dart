import 'package:equatable/equatable.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';

abstract class ScanVehicleState extends Equatable {
  const ScanVehicleState();

  @override
  List<Object?> get props => [];
}

class ScanVehicleInitialState extends ScanVehicleState {}
class ScanVehicleLoadingState extends ScanVehicleState {}
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


abstract class VehicleState extends Equatable {
  const VehicleState();

  @override
  List<Object?> get props => [];
}

class VehicleInitial extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehicleLoaded extends VehicleState {
  final List<VehicleEntity> vehicles;
  const VehicleLoaded(this.vehicles);
    @override
  List<Object?> get props => [vehicles];
}

class VehicleError extends VehicleState {
  final String message;
  const VehicleError(this.message); 
   @override
  List<Object?> get props => [message];
}