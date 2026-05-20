import 'package:equatable/equatable.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';

abstract class AddExpenseState extends Equatable {
  const AddExpenseState();
  @override
  List<Object?> get props => [];
}

class AddExpenseInitialState extends AddExpenseState {}

class AddExpenseSuccessState extends AddExpenseState {
  final UserVehicleEntity? vehicle;

  const AddExpenseSuccessState({this.vehicle});

  @override
  List<Object?> get props => [vehicle];
}

class AddExpensesLoadingState extends AddExpenseState {}

class AddExpenseErrorState extends AddExpenseState {
  final String message;
  const AddExpenseErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
