import 'package:motrive/features/home0/sub/add_car_card/domain/entities/add_car_card_entity.dart';

abstract class VehicleState {}

class VehicleInitial extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehicleLoaded extends VehicleState {
  final List<VehicleEntity> vehicles;
  VehicleLoaded(this.vehicles);
}

class VehicleError extends VehicleState {
  final String message;
  VehicleError(this.message);
}

