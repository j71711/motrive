import 'package:equatable/equatable.dart';

abstract class BaseCarEntity extends Equatable {
  final String? make;
  final String? model;
  final int? year;

  const BaseCarEntity({
    required this.make,
    required this.model,
    required this.year,
  });

  @override
  List<Object?> get props => [make,model,year];
}

class AddCarCardEntity extends BaseCarEntity {
  final String? userId;
  final String? id;
  final String? color;
  final String? licensePlate;
  final String? vin;
  final int? currentOdometer;
  final String? createdAt; 
  final String? carInfoId;

  const AddCarCardEntity({
    required this.userId,
    required this.id,
    required super.make,
    required super.model,
    required super.year,
     this.color,
     this.licensePlate,
     this.vin,
     this.currentOdometer,
     this.createdAt,
     this.carInfoId,
  });
  
  @override
  List<Object?> get props => [userId, id, make, model, year, color, licensePlate, vin, currentOdometer, createdAt, carInfoId ];
}

class CarInfoEntity extends BaseCarEntity {
  final int? maintenanceOdometerInterval;
  final String? engine;

  const CarInfoEntity({
    required super.make,
    required super.model,
    required super.year,
    this.maintenanceOdometerInterval,
    this.engine,
  });

  @override
  List<Object?> get props => [make, model,year,maintenanceOdometerInterval,engine,];
}