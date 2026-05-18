import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/core/widgets/error_button.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/core/widgets/severity_widget.dart';
import 'package:motrive/features/reminders/domain/entities/reminders_entity.dart';
import 'package:motrive/features/reminders/presentation/cubit/reminders_cubit.dart';
import 'package:motrive/features/reminders/presentation/cubit/reminders_state.dart';
import 'package:motrive/features/sub/add_reminder/presentation/pages/add_reminder_feature_widget.dart';

class RemindersFeatureScreen extends StatelessWidget {
  const RemindersFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RemindersCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        actions: [
          IconButton(
            onPressed: () async => context
                .showBottomSheet(widget: AddReminderFeatureWidget())
                .then((value) {
                  if (value == true) {
                    cubit.getRemindersMethod();
                  }
                }),
            icon: Icon(Icons.notification_add),
          ),
        ],
      ),
      body: BlocBuilder<RemindersCubit, RemindersState>(
        builder: (context, state) {
          return switch (state) {
            RemindersErrorState _ => ErrorButton(
              message: state.message,
              refresh: () => cubit.getRemindersMethod(),
            ),
            RemindersInitialState _ => LoadingWidget(),
            RemindersSuccessState _ =>
              state.reminders.isEmpty
                  ? Center(child: Text('No Reminders Yet'))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        final RemindersEntity reminder = state.reminders[index];
                        return ListTile(
                          onTap: () async => context
                              .showBottomSheet(
                                widget: AddReminderFeatureWidget(
                                  reminder: state.reminders[index],
                                ),
                              )
                              .then((value) {
                                if (value == true) {
                                  cubit.getRemindersMethod();
                                }
                              }),
                          title: Text(reminder.title),
                          subtitle: Text(
                            reminder.triggerOdometer != null
                                ? Formatters.formatOdometer(
                                    reminder.triggerOdometer!,
                                  )
                                : Formatters.formatDate(
                                    reminder.triggerDate ?? DateTime.now(),
                                  ),
                          ),
                          trailing: Text(reminder.triggerOdometer.toString()),
                          leading: SeverityWidget(
                            severity: reminder.category,
                            widthWithText: true,
                            onSeverity: (severity) => severity == 'Expense',
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: state.reminders.length,
                    ),
            _ => SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
