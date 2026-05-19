import 'package:flutter/material.dart';

IconData getExpenseIcon(
  String category,
) {
  switch (category) {
    case 'Fuel':
      return Icons.local_gas_station;

    case 'Vehicle insurance':
      return Icons.security;

    case 'Maintenance':
      return Icons.build;

    case 'Oil':
      return Icons.opacity;

    case 'Traffic violation':
      return Icons.warning_amber;

    case 'Other':
      return Icons.category;

    default:
      return Icons.receipt_long;
  }
}