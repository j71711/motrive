import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/core/widgets/fade_animated_container.dart';
import 'package:motrive/core/widgets/severity_widget.dart';
import 'package:motrive/features/home/presentation/widgets/action_card.dart';
import 'package:motrive/features/sub/maintenance_alert/presentation/cubit/maintenance_alert_cubit.dart';
import 'package:motrive/features/sub/maintenance_alert/presentation/cubit/maintenance_alert_state.dart';
import 'package:motrive/features/sub/save_service/presentation/pages/save_service_feature_widget.dart';

class MaintenanceAlertFeatureWidget extends StatelessWidget {
  const MaintenanceAlertFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MaintenanceAlertCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<MaintenanceAlertCubit>();
          return BlocBuilder<MaintenanceAlertCubit, MaintenanceAlertState>(
            builder: (context, state) {
              final maintenance = state is MaintenanceAlertSuccessState
                  ? state.maintenance
                  : null;
              final status =
                  (maintenance?.services[0].serviceOdometer ?? 0) <
                  (maintenance?.vehicle.currentOdometer ?? 0);
              return CustomFadeContainer(
                fade: maintenance == null,
                widget: ActionCard(
                title: 'maintenance'.tr(),
                  subtitle: Formatters.formatOdometer(
                    maintenance?.services.first.serviceOdometer ?? 0,
                  ),
                  nextToIcon: FittedBox(
                    child: SeverityWidget(
                    severity: status ? 'overdue'.tr() : 'upcoming'.tr(),
                      widthWithText: true,
                     onSeverity: (severity) => severity == 'overdue'.tr(),
                    ),
                  ),
                  showArrow: true,
                  icon: Icons.radio_button_off,
                  iconColor: status ? Colors.redAccent : Colors.orangeAccent,
                  onTap: () async => context
                      .push(
                        Routes.maintenanceDetails,
                        extra: maintenance!.services.first,
                      )
                      .then((value) {
                        if (value == true) {
                          cubit.getMaintenanceAlertMethod();
                        }
                      }),
                  onIconClick: () =>
                      showDialog(
                        context: context,
                        builder: (context) => SaveServiceFeatureWidget(
                          serviceInfo: maintenance!.services.first,
                          vehicle: maintenance.vehicle,
                        ),
                      ).then((value) {
                        if (value == true) {
                          cubit.getMaintenanceAlertMethod();
                        }
                      }),
                ),
                widgetTo: ActionCard(
                 title: 'maintenance'.tr(),
              subtitle: 'alerts_will_appear_here'.tr(),
                  icon: Icons.done,
                  iconColor: Theme.of(context).colorScheme.primary,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(28),
                        ),
                      ),
                      builder: (_) {
                        return const Padding(
                          padding: EdgeInsets.all(18),
                          child: MaintenanceAlertFeatureWidget(),
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
