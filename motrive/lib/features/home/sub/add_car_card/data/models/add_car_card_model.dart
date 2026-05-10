import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';

class VehicleModel extends VehicleEntity {
  const VehicleModel({
    required super.id,
    required super.userId,
    required super.make,
    required super.model,
    required super.year,
     super.color,
     super.licensePlate,
     super.vin,
     super.currentOdometer,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      userId: json['user_id'],
      id: json['id'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      color: json['color'] ?? '',
      licensePlate: json['license_plate'] ?? '',
      vin: json['vin'] ?? '',
      currentOdometer: json['current_odometer'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'id': id,
      'make': make,
      'model': model,
      'year': year,
      'color': color,
      'license_plate': licensePlate,
      'vin': vin,
      'current_odometer': currentOdometer,
    };
  }
}

