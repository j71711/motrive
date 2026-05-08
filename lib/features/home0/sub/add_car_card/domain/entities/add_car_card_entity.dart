class VehicleEntity {
  final String userId;
  final String id;
  final String make;
  final String model;
  final int year;
  final String? color;
  final String? licensePlate;
  final String? vin;
  final int? currentOdometer;

  VehicleEntity({
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
}
