import 'package:easy_localization/easy_localization.dart';
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
    final textColor = Color.fromARGB(255, 255, 255, 255);
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
      child: vehicle == null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 12,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          'add_your_car_to_start_the_journey'.tr(),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: textColor.withValues(alpha: 1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: textColor.withValues(alpha: .5),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: textColor.withValues(alpha: .72),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: textColor.withValues(alpha: 1),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 6,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${vehicle?.make} ${vehicle?.model}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: textColor.withValues(alpha: 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),

                          Text(
                            '${vehicle?.year}',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: textColor.withValues(alpha: 1),
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
                        color: textColor.withValues(alpha: .5),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: textColor.withValues(alpha: .72),
                        ),
                      ),
                      child: Text(
                        '${vehicle?.currentOdometer} ${'km'.tr()}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: textColor.withValues(alpha: 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: textColor.withValues(alpha: .5),
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
                            '${'color'.tr()}: ${vehicle?.color ?? ''}',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: textColor.withValues(alpha: .72),
                                ),
                          ),

                          Text(
                            '${'license_plate'.tr()}: ${vehicle?.licensePlate ?? ''}',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: textColor.withValues(alpha: .72),
                                ),
                          ),

                          Text(
                            '${'vin'.tr()}: ${vehicle?.vin ?? ''}',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: textColor.withValues(alpha: .72),
                                ),
                          ),
                        ],
                      ),

                      IconButton(
                        onPressed: () async =>
                            context.push(Routes.addVehicle, extra: vehicle),
                        icon: Icon(
                          Icons.edit,
                          color: textColor.withValues(alpha: .72),
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
