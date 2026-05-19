import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';

class ServiceInfoCard extends StatelessWidget {
  final ServiceInfoEntity serviceInfo;
  const ServiceInfoCard({super.key, required this.serviceInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: .antiAlias,
      child: Padding(
        padding: const .all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                 '${'service_odometer'.tr()}: ${Formatters.formatOdometer(serviceInfo.serviceOdometer)}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  padding: .symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: .circular(16),
                    color: serviceInfo.severity == 'critical'.tr()
                        ? Colors.orangeAccent
                        : Colors.green,
                  ),
                  child: Text(
                    serviceInfo.severity,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Text(
             '${'date_interval'.tr()}: ${serviceInfo.dateIntervalMonths} ${'months'.tr()}',
              softWrap: true,
            ),
            Gap(10),
           if (serviceInfo.recommendation != 'no_data'.tr())
              Column(
                spacing: 5,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'recommendations'.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  //!------------------------
                  Text(serviceInfo.recommendation, softWrap: true),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
