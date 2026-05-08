import 'package:equatable/equatable.dart';

// class ScanVehicleEntity extends Equatable {
//   final int id;
//   final String firstName;
//   final String lastName;

//   const ScanVehicleEntity({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//   });

//   @override
//   List<Object?> get props => [firstName, lastName, id];
// }

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