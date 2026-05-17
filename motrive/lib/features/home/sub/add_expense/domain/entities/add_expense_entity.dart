import 'package:equatable/equatable.dart';

class AddExpenseEntity extends Equatable {
  final String? vehicleId;
  final String category;
  final double cost;
  final int odometer;
  final String? notes;

  const AddExpenseEntity({
     this.vehicleId,
    required this.category,
    required this.cost,
    required this.odometer,
    this.notes,
  });

  @override
  List<Object?> get props => [vehicleId, category, cost, odometer,notes];
}