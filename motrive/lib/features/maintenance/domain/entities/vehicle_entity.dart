import 'package:equatable/equatable.dart';

class UserVehicleEntity extends Equatable {
  final String? id;
  final String make;
  final String model;
  final int year;
  final String? color;
  final String? licensePlate;
  final String? vin;
  final int? currentOdometer;
  final int? odometerAtRegistered;
  final String? userId;
  final String? carInfoId;

  const UserVehicleEntity({
    this.userId,
    this.id,
    required this.make,
    required this.model,
    required this.year,
    this.color,
    this.licensePlate,
    this.vin,
    this.currentOdometer,
    this.odometerAtRegistered,
    this.carInfoId,
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
    odometerAtRegistered,
    carInfoId,
  ];
}
