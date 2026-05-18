import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/core/widgets/fade_animated_container.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';

class VehicleCardWidget extends StatelessWidget {
  final bool isExpanded;
  final UserVehicleEntity? vehicle;

  const VehicleCardWidget({
    super.key,
    this.vehicle,
   required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
  

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: .06),
        border: Border.all(
          color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: .10),
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${vehicle?.make } ${vehicle?.model}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Color.fromARGB(255, 255, 255, 255).withValues(alpha:  1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      '${vehicle?.year }',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:Color.fromARGB(255, 255, 255, 255).withValues(alpha: 1),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 255, 255, 255).withValues(alpha:  .5),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color:  Color.fromARGB(255, 255, 255, 255).withValues(alpha:  .72),
                  ),
                ),
                child: Text(
                  '${vehicle?.currentOdometer } Km',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Color.fromARGB(255, 255, 255, 255).withValues(alpha:  1),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          CustomFadeContainer(
            fade: !isExpanded,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Color: ${vehicle?.color ?? ''}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color:  Color.fromARGB(255, 255, 255, 255).withValues(alpha: .72),
                      ),
                    ),

                    Text(
                      'License Plate: ${vehicle?.licensePlate ?? ''}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: .72),
                      ),
                    ),

                    Text(
                      'Vin: ${vehicle?.vin ?? ''}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color.fromARGB(255, 255, 255, 255).withValues(alpha: .72),
                      ),
                    ),
                  ],
                ),

                IconButton(
                  onPressed: () =>
                      context.push(Routes.addVehicle, extra: vehicle),
                  icon: Icon(
                    Icons.edit,
                    color:  Color.fromARGB(255, 255, 255, 255).withValues(alpha: .72),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}