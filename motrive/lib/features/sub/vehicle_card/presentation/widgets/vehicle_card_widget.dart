import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/core/widgets/fade_animated_container.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';

class VehicleCardWidget extends StatelessWidget {
  final bool isExpanded;
  final UserVehicleEntity? vehicle;
  const VehicleCardWidget({super.key, this.vehicle, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${vehicle?.make} ${vehicle?.model}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    vehicle?.year.toString() ?? ' ',
                    style: const TextStyle(),
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: BoxBorder.all(),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text('${vehicle?.currentOdometer ?? 0} Km'),
              ),
            ],
          ),
          CustomFadeContainer(
            fade: !isExpanded,
            widget: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text('Color: ${vehicle?.color ?? ''}'),
                    Text('License Plate: ${vehicle?.licensePlate ?? ''}'),
                    Text('Vin: ${vehicle?.vin ?? ''}'),
                  ],
                ),
                IconButton(
                  onPressed: () =>
                      context.push(Routes.addVehicle, extra: vehicle),
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
