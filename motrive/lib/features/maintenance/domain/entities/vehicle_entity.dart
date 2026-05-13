import 'package:equatable/equatable.dart';

class VehicleEntity extends Equatable {
  final String userId;
  final String id;
  final String make;
  final String model;
  final int year;
  final String? color;
  final String? licensePlate;
  final String? vin;
  final int? currentOdometer;

  const VehicleEntity({
    required this.userId,
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    this.color,
    this.licensePlate,
    this.vin,
    this.currentOdometer,
  });

  @override
  List<Object?> get props => [
    userId,
    id,
    make,
    model,
    year,
    color,
    licensePlate,
    vin,
    currentOdometer,
  ];
}
