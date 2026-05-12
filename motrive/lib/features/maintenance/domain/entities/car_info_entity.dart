import 'package:equatable/equatable.dart';

class CarInfoEntity extends Equatable {
  final String id;
  final String make;
  final String model;
  final int year;
  final String engine;
  final String manualSource;
  final int maintenanceOdometerInterval;

  const CarInfoEntity({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.engine,
    required this.manualSource,
    required this.maintenanceOdometerInterval,
  });

  @override
  List<Object?> get props => [
    id,
    make,
    model,
    year,
    engine,
    manualSource,
    maintenanceOdometerInterval,
  ];
}
