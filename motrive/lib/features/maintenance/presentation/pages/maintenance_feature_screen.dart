import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_cubit.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_state.dart';
import 'package:motrive/features/sub/save_service/presentation/pages/save_service_feature_widget.dart';

class MaintenanceFeatureScreen extends StatelessWidget {
  const MaintenanceFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MaintenanceCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Maintenance Feature Screen')),
      body: BlocConsumer<MaintenanceCubit, MaintenanceState>(
        listener: (context, state) {
          if (state is MaintenanceErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        builder: (context, state) {
          return switch (state) {
            MaintenanceLoadingState _ => LoadingWidget(),
            MaintenanceErrorState _ => Center(
              child: Text('No maintenance for now'),
            ),
            MaintenanceSuccessState _ =>
              state.maintenanceEntity.services.isEmpty
                  ? Center(child: Text('No services'))
                  : RefreshIndicator(
                      onRefresh: cubit.getMaintenanceMethod,
                      child: ListView.builder(
                        padding: .only(top: 8),
                        itemCount: state.maintenanceEntity.services.length,
                        itemBuilder: (context, index) {
                          final service =
                              state.maintenanceEntity.services[index];
                          return ListTile(
                            onTap: () async {
                              context
                                  .push(
                                    Routes.maintenanceDetails,
                                    extra: service,
                                  )
                                  .then((value) {
                                    if (value == true) {
                                      cubit.getMaintenanceMethod();
                                    }
                                  });
                            },
                            leading: Container(
                              padding: .symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: .circular(16),
                                color: service.severity == 'critical'
                                    ? Colors.orangeAccent
                                    : Colors.green,
                              ),
                              child: Text(
                                service.severity,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              Formatters.formatOdometer(
                                service.serviceOdometer,
                              ),
                            ),
                            subtitle: service.recommendation == 'no data'
                                ? null
                                : Text(
                                    service.recommendation,
                                    overflow: .ellipsis,
                                  ),
                            trailing: Checkbox(
                              value:
                                  state.maintenanceEntity.services[index].done,
                              onChanged: (value) => SaveServiceFeatureWidget(
                                vehicle: state.maintenanceEntity.vehicle,
                                serviceInfo:
                                    state.maintenanceEntity.services[index],
                                    onSuccess: () => cubit.getMaintenanceMethod(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            _ => SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
