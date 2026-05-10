import 'package:equatable/equatable.dart';
class ScanVehicleEntity extends Equatable {
  final String vin;
  final String make;
  final String model;
  final int year;

  const ScanVehicleEntity({
    required this.vin,
    required this.make,
    required this.model,
    required this.year,
  });
  
  @override
  List<Object?> get props => [vin, make, model, year];
}