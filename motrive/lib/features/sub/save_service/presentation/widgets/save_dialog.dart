import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/core/utils/validators.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_save_info.dart';

class SaveDialog extends HookWidget {
  final Function(MaintenanceSaveInfo) onSave;
  final int lastOdometer;
  const SaveDialog({
    super.key,
    required this.onSave,
    required this.lastOdometer,
  });

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    final odometerController = useTextEditingController();
    final serviceDateController = useTextEditingController(
      text: Formatters.formatDateTime(date),
    );
    final costController = useTextEditingController();
    final notesController = useTextEditingController();
    final providerController = useTextEditingController();
    final formKey = GlobalKey<FormState>();

    return Center(
      child: Form(
        key: formKey,
        child: Column(
          spacing: 10,
          children: [
            TextFormField(
              controller: serviceDateController,
              decoration: InputDecoration(
               label: Text('service_date'.tr()),
                suffixIcon: IconButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: FittedBox(
                          child: DatePickerDialog(
                            firstDate: DateTime(1990),
                            lastDate: DateTime.now(),
                          ),
                        ),
                      ),
                    ).then((value) {
                      if (value is DateTime) {
                        date = value;
                      }
                    });
                    serviceDateController.text = Formatters.formatDateTime(
                      date,
                    );
                  },
                  icon: Icon(Icons.date_range),
                ),
              ),
              validator: Validators.validateRequired,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            TextFormField(
              controller: odometerController,
              decoration: InputDecoration(label: Text('odometer_at_service'.tr())),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) =>
                  Validators.validateOdometer(value, lastOdometer),
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            Align(
              alignment: .centerEnd,
              child: Text(
                '${'last_odometer'.tr()}: ${Formatters.formatOdometer(lastOdometer)}',
              ),
            ),
            TextFormField(
              controller: costController,
              decoration: InputDecoration(label: Text('cost'.tr()),),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: Validators.validateRequired,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            TextFormField(
              controller: providerController,
              decoration: InputDecoration(
              label: Text('provider_name_optional'.tr()),
              ),
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            TextFormField(
              controller: notesController,
              decoration: InputDecoration(label: Text('notes_optional'.tr()),),
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            Row(
              mainAxisAlignment: .end,
              children: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: Text('cancel'.tr()),
                ),
                FilledButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final maintenanceInfo = MaintenanceSaveInfo(
                        cost: double.tryParse(costController.text) ?? 0,
                        serviceDate: date,
                        odometerAtService:
                            int.tryParse(odometerController.text) ?? 0,
                        providerName: providerController.text,
                        note: notesController.text,
                      );
                      onSave(maintenanceInfo);
                    }
                  },

                  child: Text('save'.tr()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
