import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/constants/app_enums.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/core/utils/validators.dart';
import 'package:motrive/features/reminders/domain/entities/reminders_entity.dart';
import 'package:motrive/features/sub/add_reminder/domain/entities/add_reminder_entity.dart';
import 'package:motrive/features/sub/add_reminder/presentation/cubit/add_reminder_cubit.dart';
import 'package:motrive/features/sub/add_reminder/presentation/cubit/add_reminder_state.dart';
import 'package:sizer/sizer.dart';

class AddReminderFeatureWidget extends HookWidget {
  final RemindersEntity? reminder;
  const AddReminderFeatureWidget({super.key, this.reminder});
  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    final titleController = useTextEditingController(text: reminder?.title);
    final dateValueController = useTextEditingController(
      text: reminder?.recurrenceValue.toString(),
    );
    final odometerController = useTextEditingController(
      text: reminder?.triggerOdometer.toString(),
    );
    final dateController = useTextEditingController(
      text: Formatters.formatDate(DateTime.now()),
    );
    final notesController = useTextEditingController(text: reminder?.notes);

    return BlocProvider(
      create: (context) => AddReminderCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AddReminderCubit>();
          return BlocListener<AddReminderCubit, AddReminderState>(
            listener: (context, state) {
              context.hideLoading();
              if (state is AddReminderLoadingState) {
                context.showLoading();
              }
              if (state is AddReminderSuccessState) {
                context.pop(true);
              }
              if (state is AddReminderErrorState) {
                context.showSnackBar(state.message, isError: true);
              }
            },
            child: Form(
              key: form,
              child: BlocBuilder<AddReminderCubit, AddReminderState>(
                builder: (context, state) {
                  final initState = state is AddReminderInitialState;
                  return RadioGroup<bool>(
                    onChanged: (value) =>
                        initState ? cubit.toggle(state, kmOrDate: value) : null,
                    groupValue: initState ? state.kmOrDate : false,
                    child: Column(
                      spacing: 10,
                      children: [
                        ListTile(
                          title: Text('reminder_category'.tr()),
                          trailing: CupertinoSegmentedControl(
                            padding: .zero,
                            groupValue: initState ? state.category : false,
                            children: {
                              true: Text('expense'.tr()),
                              false: Padding(
                                padding: .symmetric(horizontal: 5),
                                child: Text('maintenance'.tr()),
                              ),
                            },
                            onValueChanged: (value) => initState
                                ? cubit.toggle(state, category: value)
                                : null,
                          ),
                        ),

                        TextFormField(
                          controller: titleController,
                          validator: Validators.validateRequired,
                          decoration: InputDecoration(
                            label: Text(
                              'type_of'.tr(
                                args: [
                                  initState && state.category
                                      ? 'expense'.tr()
                                      : 'maintenance'.tr(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('reminder_type'.tr()),
                          trailing: CupertinoSegmentedControl(
                            padding: .zero,
                            groupValue: initState ? state.repeat : false,
                            children: {
                              false: Text('remind_once'.tr()),
                              true: Padding(
                                padding: .symmetric(horizontal: 5),
                                child: Text('remind_every'.tr()),
                              ),
                            },
                            onValueChanged: (value) =>
                                state is AddReminderInitialState
                                ? cubit.toggle(state, repeat: value)
                                : null,
                          ),
                        ),
                        TextFormField(
                          controller: odometerController,
                          validator: initState && state.kmOrDate
                              ? Validators.validateRequired
                              : null,
                          decoration: InputDecoration(
                            label: Text('by_km'.tr()),
                            suffixIcon: Radio(value: true),
                          ),
                        ),
                        Row(
                          spacing: 5,
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: dateController,
                                readOnly: true,
                                onTap: () async {
                                  if (initState ? !state.kmOrDate : false) {
                                    await showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        child: FittedBox(
                                          child: DatePickerDialog(
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2045),
                                          ),
                                        ),
                                      ),
                                    ).then((value) {
                                      if (value is DateTime) {
                                        dateController.text =
                                            Formatters.formatDate(value);
                                      }
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  label: Text('by_date'.tr()),
                                  suffixIcon: Radio(
                                    materialTapTargetSize: .shrinkWrap,
                                    value: false,
                                  ),
                                ),
                              ),
                            ),
                            if (initState ? state.repeat : false)
                              Expanded(
                                child: TextFormField(
                                  keyboardType: .number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  controller: dateValueController,
                                  validator:
                                      initState &&
                                          state.repeat &&
                                          !state.kmOrDate
                                      ? Validators.validateRequired
                                      : null,
                                  decoration: InputDecoration(
                                    label: Text('value'.tr()),
                                  ),
                                ),
                              ),
                            if (initState ? state.repeat : false)
                              Expanded(
                                child: DropdownButtonFormField<ReminderUnit>(
                                  onChanged: (value) => initState
                                      ? cubit.toggle(state, unit: value)
                                      : null,
                                  initialValue: initState ? state.unit : .day,
                                  decoration: InputDecoration(
                                    contentPadding: .symmetric(
                                      vertical: 4.w,
                                      horizontal: 5,
                                    ),
                                    label: Text('unit'.tr()),
                                  ),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  isExpanded: true,
                                  items: [
                                    DropdownMenuItem(
                                      value: .day,
                                      child: Text(ReminderUnit.day.name),
                                    ),
                                    DropdownMenuItem(
                                      value: .month,
                                      child: Text(ReminderUnit.month.name),
                                    ),
                                    DropdownMenuItem(
                                      value: .year,
                                      child: Text(ReminderUnit.year.name),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        TextFormField(
                          controller: notesController,
                          decoration: InputDecoration(
                            label: Text('notes'.tr()),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: .center,
                          spacing: 10,
                          children: [
                            if (reminder != null)
                              FilledButton(
                                onPressed: () async =>
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: Text(
                                          'delete_reminder_message'.tr(),
                                        ),
                                        title: Text('reminder_deletion'.tr()),
                                        actions: [
                                          TextButton(
                                            onPressed: () => context.pop(),
                                            child: Text('cancel'.tr()),
                                          ),
                                          FilledButton(
                                            onPressed: () => context.pop(true),
                                            child: Text('delete'.tr()),
                                          ),
                                        ],
                                      ),
                                    ).then((value) {
                                      if (value == true) {
                                        cubit.deleteReminder(reminder!.id);
                                      }
                                    }),
                                style: ButtonStyle(
                                  backgroundColor: .all(Colors.redAccent),
                                ),
                                child: Text('Delete'),
                              ),
                            FilledButton(
                              onPressed: () {
                                if (form.currentState!.validate()) {
                                  if (!initState) {
                                    return;
                                  }
                                  final newReminder = AddReminderEntity(
                                    id: reminder?.id,
                                    title: titleController.text,
                                    category: state.category
                                        ? 'expense'.tr()
                                        : 'maintenance'.tr(),

                                    triggerType: state.kmOrDate
                                        ? 'odometer'.tr()
                                        : 'date'.tr(),
                                    isRecurring: state.repeat,
                                    recurrenceUnit: state.unit.name,
                                    recurrenceValue: int.tryParse(
                                      dateValueController.text,
                                    ),
                                    odometerAdvanceKm: state.repeat
                                        ? int.tryParse(odometerController.text)
                                        : null,

                                    notes: notesController.text,
                                    triggerDate: DateTime.tryParse(
                                      dateController.text,
                                    ),
                                    triggerOdometer: int.tryParse(
                                      odometerController.text,
                                    ),
                                  );
                                  if (reminder != null &&
                                      reminder == newReminder) {
                                    return;
                                  }
                                  cubit.getAddReminderMethod(newReminder);
                                }
                              },
                              child: Text(
                                reminder != null ? 'update'.tr() : 'save'.tr(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
