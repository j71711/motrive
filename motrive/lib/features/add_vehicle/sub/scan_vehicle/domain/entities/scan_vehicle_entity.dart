import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ScanVehicleEntity extends Equatable {
  final String? make;
  final String? model;
  final int? year;
  final String? color;
  final String? licensePlate;
  final String? vin;
  final int? currentOdometer;
  final String? createdAt; 
  final String? carInfoId;

  const ScanVehicleEntity({
    @JsonKey(name: 'user_id')
    required this.make,
    required this.model,
    required this.year,
     this.color,
     this.licensePlate,
     this.vin,
     this.currentOdometer,
     this.createdAt,
     this.carInfoId, 
  });
  
  @override
  List<Object?> get props => [ make, model, year, color, licensePlate, vin, currentOdometer, createdAt, carInfoId ];
}