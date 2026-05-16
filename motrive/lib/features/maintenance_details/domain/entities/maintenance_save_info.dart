import 'package:equatable/equatable.dart';

class MaintenanceSaveInfo extends Equatable {
  final String? note;
  final String? providerName;
  final double cost;
  final DateTime serviceDate;
  final int odometerAtService;

  const MaintenanceSaveInfo({
    this.note,
    this.providerName,
    required this.cost,
    required this.serviceDate,
    required this.odometerAtService,
  });

  @override
  List<Object?> get props => [
    note,
    providerName,
    cost,
    serviceDate,
    odometerAtService,
  ];
}
