import 'package:equatable/equatable.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';

abstract class LastOdometerState extends Equatable {
  const LastOdometerState();

  @override
  List<Object?> get props => [];
}

class LastOdometerInitialState extends LastOdometerState {}

class LastOdometerSuccessState extends LastOdometerState {
  final UserVehicleEntity vehicle;

  const LastOdometerSuccessState({required this.vehicle});

  @override
  List<Object?> get props => [vehicle];

}

class LastOdometerErrorState extends LastOdometerState {
  final String message;
  const LastOdometerErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
