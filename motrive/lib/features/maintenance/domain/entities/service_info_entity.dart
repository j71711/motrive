import 'package:equatable/equatable.dart';

class ServiceInfoEntity extends Equatable {
  final String id;
  final int serviceOdometer;
  final int dateIntervalMonths;
  final String severity;
  final String recommendation;
  final bool done;

  const ServiceInfoEntity({
    required this.id,
    required this.serviceOdometer,
    required this.dateIntervalMonths,
    required this.severity,
    required this.recommendation,
    this.done = false
  });

  @override
  List<Object?> get props => [
    id,
    serviceOdometer,
    dateIntervalMonths,
    severity,
    recommendation,
    done,
  ];
}
