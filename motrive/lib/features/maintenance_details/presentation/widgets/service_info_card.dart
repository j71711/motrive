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
                  'Service Odometer: ${Formatters.formatOdometer(serviceInfo.serviceOdometer)}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  padding: .symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: .circular(16),
                    color: serviceInfo.severity == 'critical'
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
              'Date Interval: ${serviceInfo.dateIntervalMonths} months',
              softWrap: true,
            ),
            Gap(10),
            if (serviceInfo.recommendation != 'no data')
              Column(
                spacing: 5,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Recommendations:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(serviceInfo.recommendation, softWrap: true),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
