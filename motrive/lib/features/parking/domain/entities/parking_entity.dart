import 'package:equatable/equatable.dart';

class ParkingEntity extends Equatable {
  final String id;

  final String userId;

  final String? vehicleId;

 final double latitudes;

final double longitude;

  final String? address;

  final String? notes;

  final String detectionMethod;

  final bool isActive;

  final String parkedAt;

  const ParkingEntity({
    required this.id,
    required this.userId,
    this.vehicleId,
    required this.latitudes,
    required this.longitude,
    this.address,
    this.notes,
    required this.detectionMethod,
    required this.isActive,
    required this.parkedAt,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    vehicleId,
    latitudes,
    longitude,
    address,
    notes,
    detectionMethod,
    isActive,
    parkedAt,
  ];
}
