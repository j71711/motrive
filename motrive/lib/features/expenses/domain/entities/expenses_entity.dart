import 'package:equatable/equatable.dart';

class ExpensesEntity extends Equatable {
  final String id;
  final String category;
  final double? cost;
  final DateTime? expenseDate;
  final int odometer;
  final String? notes;

  const ExpensesEntity({
    required this.id,
    required this.category,
     this.cost,
     this.expenseDate,
    required this.odometer,
    this.notes,
  });

  @override
  List<Object?> get props => [expenseDate, odometer ,notes, cost, category, id];
}
