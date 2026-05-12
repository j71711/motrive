import 'package:equatable/equatable.dart';

class ServicePartInfoEntity extends Equatable {
  final String id;
  final String partName;
  final String oemPartNumber;
  final String action;
  final String specification;
  final int quantity;
  final String quantityUnit;

  const ServicePartInfoEntity({
    required this.id,
    required this.partName,
    required this.oemPartNumber,
    required this.action,
    required this.specification,
    required this.quantity,
    required this.quantityUnit,
  });

  @override
  List<Object?> get props => [
    id,
    partName,
    oemPartNumber,
    action,
    specification,
    quantity,
    quantityUnit,
  ];
}
