import 'package:equatable/equatable.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_details_entity.dart';

abstract class MaintenanceDetailsState extends Equatable {
  const MaintenanceDetailsState();

  @override
  List<Object?> get props => [];
}

class MaintenanceDetailsInitialState extends MaintenanceDetailsState {}

class MaintenanceDetailsSuccessState extends MaintenanceDetailsState {
  final MaintenanceDetailsEntity maintenanceDetails;
  final bool? selectedAll;

  const MaintenanceDetailsSuccessState({
    required this.maintenanceDetails,
    this.selectedAll,
  });

  @override
  List<Object?> get props => [maintenanceDetails, selectedAll];
}

class MaintenanceDetailsSaveSuccessState extends MaintenanceDetailsState {}

class MaintenanceDetailsLoadingState extends MaintenanceDetailsState {}

class MaintenanceDetailsErrorState extends MaintenanceDetailsState {
  final String message;
  const MaintenanceDetailsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
