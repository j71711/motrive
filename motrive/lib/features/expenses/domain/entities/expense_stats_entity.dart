import 'package:equatable/equatable.dart';

class ExpenseStatsEntity extends Equatable {
  final double monthlyTotal;
  final double yearlyTotal;
  final double fuelTotal;
  final double maintenanceTotal;
  final double insuranceTotal;
  final double oilTotal;
  final double violationTotal;
  final double otherTotal;
  const ExpenseStatsEntity({
    required this.monthlyTotal,
    required this.yearlyTotal,
    required this.fuelTotal,
    required this.maintenanceTotal,
    required this.insuranceTotal,
    required this.oilTotal,
    required this.violationTotal,
    required this.otherTotal
  });
  
  @override
  List<Object?> get props => [maintenanceTotal,yearlyTotal,fuelTotal,maintenanceTotal, insuranceTotal, oilTotal,violationTotal,otherTotal];
}