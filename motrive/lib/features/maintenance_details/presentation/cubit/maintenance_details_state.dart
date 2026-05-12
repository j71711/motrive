import 'package:equatable/equatable.dart';

abstract class MaintenanceDetailsState extends Equatable {
  const MaintenanceDetailsState();

  @override
  List<Object?> get props => [];
}

class MaintenanceDetailsInitialState extends MaintenanceDetailsState {}
class MaintenanceDetailsSuccessState extends MaintenanceDetailsState {}

class MaintenanceDetailsErrorState extends MaintenanceDetailsState {
  final String message;
  const MaintenanceDetailsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

