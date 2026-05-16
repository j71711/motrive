import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/core/widgets/fade_animated_container.dart';
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFadeContainer(
                  fade: maintenance == null,
                  widget: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    borderOnForeground: true,
                    clipBehavior: .antiAlias,
                    child: ListTile(
                      contentPadding: .zero,
                      leading: Container(
                        padding: .symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: .circular(16),
                          color: status
                              ? Colors.redAccent
                              : Colors.orangeAccent,
                        ),
                        child: Text(
                          status ? 'Overdue' : 'Upcoming',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        Formatters.formatOdometer(
                          maintenance?.services.first.serviceOdometer ?? 0,
                        ),
                      ),
                      subtitle: Text('Please pay attention to your dashboard'),
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
                      trailing: IconButton.filled(
                        onPressed: () =>
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
                        icon: Icon(Icons.done),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
