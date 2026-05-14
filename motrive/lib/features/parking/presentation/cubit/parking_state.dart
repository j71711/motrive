import 'package:equatable/equatable.dart';
import 'package:motrive/features/parking/domain/entities/parking_entity.dart';

abstract class ParkingState extends Equatable {
  const ParkingState();

  @override
  List<Object?> get props => [];
}

class ParkingInitialState extends ParkingState {}

class ParkingLoadingState extends ParkingState {}

class ParkingSuccessState extends ParkingState {
  final ParkingEntity parking;

  const ParkingSuccessState({
    required this.parking,
  });

  @override
  List<Object?> get props => [parking];
}

class ParkingActionSuccessState extends ParkingState {
  final String message;

  const ParkingActionSuccessState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class ParkingErrorState extends ParkingState {
  final String message;

  const ParkingErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}