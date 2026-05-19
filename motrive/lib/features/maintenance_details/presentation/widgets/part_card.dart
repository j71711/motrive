import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:motrive/core/widgets/severity_widget.dart';
import 'package:motrive/features/maintenance_details/domain/entities/service_part_info_entity.dart';

class PartCard extends StatelessWidget {
  final ServicePartInfoEntity? part;
  const PartCard({super.key, this.part});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.car_repair_outlined),
        title: Text(part?.partName ?? ''),
        trailing: Column(
          spacing: 5,
          mainAxisSize: .min,
          crossAxisAlignment: .center,
          children: [
            SeverityWidget(
              widthWithText: true,
              severity: part?.action ?? '     ',
              onSeverity: (severity) => severity == 'inspect'.tr(),
            ),
            if ((part?.quantity ?? 0) != 0)
              Text('${'qty'.tr()}: ${part?.quantity} ${part?.quantityUnit}'),
          ],
        ),
        subtitle: Column(
          spacing: 5,
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            if (part?.specification != 'no_data'.tr())
              Text(part?.specification ?? ''),
            if (part?.oemPartNumber != 'no_data'.tr())
              Text('${'oem_no'.tr()} ${part?.oemPartNumber}'),
          ],
        ),
      ),
    );
  }
}
