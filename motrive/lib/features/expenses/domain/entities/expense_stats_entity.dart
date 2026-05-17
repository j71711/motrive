import 'package:equatable/equatable.dart';

class ExpenseStatsEntity extends Equatable {
  final double monthlyTotal;
  final double yearlyTotal;
  final double fuelTotal;
  final double maintenanceTotal;

  const ExpenseStatsEntity({
    required this.monthlyTotal,
    required this.yearlyTotal,
    required this.fuelTotal,
    required this.maintenanceTotal,
  });
  
  @override
  List<Object?> get props => [maintenanceTotal,yearlyTotal,fuelTotal,maintenanceTotal];
}