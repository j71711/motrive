import 'package:equatable/equatable.dart';

class ParkingEntity extends Equatable {
  final String id;

  final String userId;

  final String? vehicleId;

  final double latitude;

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
    required this.latitude,
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
    latitude,
    longitude,
    address,
    notes,
    detectionMethod,
    isActive,
    parkedAt,
  ];
}
