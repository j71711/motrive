import 'package:equatable/equatable.dart';

class AddExpenseEntity extends Equatable {
  final String? id;
  final String? vehicleId;
  final String category;
  final double cost;
  final int odometer;
  final String? notes;
  final DateTime? expenseDate;
  const AddExpenseEntity({
    this.id,
    this.vehicleId,
    required this.category,
    required this.cost,
    required this.odometer,
    this.notes,
    this.expenseDate,
  });

  @override
  List<Object?> get props => [vehicleId, category, cost, odometer, notes];
}
