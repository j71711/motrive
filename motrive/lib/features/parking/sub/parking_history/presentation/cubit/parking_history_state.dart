import 'package:equatable/equatable.dart';
import 'package:motrive/features/parking/domain/entities/parking_entity.dart';

abstract class ParkingHistoryState extends Equatable {
  const ParkingHistoryState();

  @override
  List<Object?> get props => [];
}

class ParkingHistoryInitialState extends ParkingHistoryState {}

class ParkingHistoryLoadingState extends ParkingHistoryState {}

class ParkingHistorySuccessState extends ParkingHistoryState {
  final List<ParkingEntity> parkings;

  const ParkingHistorySuccessState({required this.parkings});

  @override
  List<Object?> get props => [parkings];
}

class ParkingHistoryErrorState extends ParkingHistoryState {
  final String message;

  const ParkingHistoryErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
