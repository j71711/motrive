import 'package:equatable/equatable.dart';

abstract class AddVehicleState extends Equatable {
  const AddVehicleState();

  @override
  List<Object?> get props => [];
}

class AddVehicleInitialState extends AddVehicleState {
  final bool? isScanning;

  const AddVehicleInitialState({this.isScanning});

  @override
  List<Object?> get props => [isScanning];
}

class AddVehicleSuccessState extends AddVehicleState {}

class AddVehicleErrorState extends AddVehicleState {
  final String message;
  const AddVehicleErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}