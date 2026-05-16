import 'package:flutter/material.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';

class MaintenanceCard extends StatelessWidget {
  final Function()? onTab;
  final ServiceInfoEntity? service;
  final Widget? trailing;
  final bool hasCheckBox;
  final void Function(bool? value)? onChanged;
  final bool? value;

  const MaintenanceCard({
    super.key,
    this.onTab,
    this.trailing,
    required this.hasCheckBox,
    this.onChanged,
    this.value,
    this.service,
  });

  @override
  Widget build(BuildContext context) {
    if (onChanged == null && hasCheckBox) {
      AssertionError('Cant have check box without providing onChange function');
    }
    return ListTile(
      onTap: onTab,
      title: Text(Formatters.formatOdometer(service?.serviceOdometer ?? 0)),
      subtitle: (service?.recommendation ?? '') == 'no data'
          ? null
          : Text(service?.recommendation ?? '', overflow: .ellipsis),
      trailing: hasCheckBox
          ? Checkbox(
              shape: CircleBorder(),
              value: service?.done ?? false,
              onChanged: hasCheckBox ? onChanged! : (value) {},
            )
          : trailing,
    );
  }
}
