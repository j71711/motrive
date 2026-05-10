import 'package:equatable/equatable.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/entities/add_car_card_entity.dart';

abstract class VehicleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VehicleInitialState extends VehicleState {}

class VehicleLoadingState extends VehicleState {}

class VehicleLoadedState extends VehicleState {
  final List<VehicleEntity> vehicles;
  VehicleLoadedState(this.vehicles);
  @override
  List<Object?> get props => [vehicles];
}

class VehicleErrorState extends VehicleState {
  final String message;
  VehicleErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

