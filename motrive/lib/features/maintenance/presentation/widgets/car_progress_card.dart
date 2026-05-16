import 'package:flutter/material.dart';
import 'package:motrive/core/extensions/string_extensions.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';

class CarProgressCard extends StatelessWidget {
  final UserVehicleEntity? vehicle;
  final double? progress;
  final int? nextMaintenance;
  const CarProgressCard({
    super.key,
    this.vehicle,
    this.progress,
    this.nextMaintenance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: .antiAlias,
      child: Padding(
        padding: const .all(16),
        child: Column(
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  '${vehicle?.make.capitalizeWords}, ${vehicle?.model.capitalizeEachWord} ${vehicle?.year}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  Formatters.formatOdometer(vehicle?.currentOdometer ?? 0),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Column(
              spacing: 5,
              children: [
                LinearProgressIndicator(
                  borderRadius: .circular(16),
                  minHeight: 8,
                  value: progress,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                Align(
                  alignment: .centerEnd,
                  child: Text(
                    '${Formatters.formatOdometer(vehicle?.currentOdometer ?? 0)} / ${Formatters.formatOdometer(nextMaintenance ?? 0)}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
