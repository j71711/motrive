import 'package:equatable/equatable.dart';

class CarsInfoEntity extends Equatable {
  final String id;
  final String make;
  final String model;
  final int year;
  final String? engine;
  final String? manualSource;
  final DateTime? createdAt;

  const CarsInfoEntity({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    this.engine,
    this.manualSource,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    make,
    model,
    year,
    engine,
    manualSource,
    createdAt,
  ];
}
