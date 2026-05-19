import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/core/widgets/error_button.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_cubit.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_state.dart';
import 'package:motrive/features/maintenance/presentation/widgets/car_progress_card.dart';
import 'package:motrive/features/maintenance/presentation/widgets/maintenance_card.dart';
import 'package:motrive/core/widgets/severity_widget.dart';
import 'package:motrive/core/widgets/timeline_widget.dart';
import 'package:motrive/features/sub/save_service/presentation/pages/save_service_feature_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MaintenanceFeatureScreen extends StatelessWidget {
  const MaintenanceFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MaintenanceCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('My Maintenance'), centerTitle: true),
      body: BlocListener<MaintenanceCubit, MaintenanceState>(
        listener: (context, state) {
          if (state is MaintenanceErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .start,
          children: [
            BlocBuilder<MaintenanceCubit, MaintenanceState>(
              builder: (context, state) {
                switch (state) {
                  case MaintenanceLoadingState _:
                    return Expanded(
                      child: Skeletonizer(
                        child: Column(
                          children: [
                            CarProgressCard(),
                            FilledButton(onPressed: () {}, child: Text('   ')),
                            Expanded(
                              child: TimelineWidget(
                                onRefresh: () async {},
                                dashedOrSolid: (index) => true,
                                itemCount: 10,
                                oppositeContentsBuilder: (context, index) =>
                                    SeverityWidget(
                                      severity: '   ',
                                      onSeverity: (severity) =>
                                          severity == '   ',
                                    ),
                                contentsBuilder: (p0, p1) => MaintenanceCard(
                                  hasCheckBox: true,
                                  onChanged: (value) => value,
                                  value: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  case MaintenanceErrorState _:
                    return Expanded(
                      child: ErrorButton(
                        message: state.message,
                        refresh: () =>
                            cubit.getMaintenanceMethod(fromRemote: true),
                      ),
                    );
                  case MaintenanceDataProcessState _:
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: .center,
                        spacing: 10,
                        children: [LoadingWidget(), Text(state.status ?? '')],
                      ),
                    );
                  case MaintenanceSuccessState _:
                    final vehicle = state.maintenanceEntity.vehicle;
                    final services = state.services;
                    final nextMaintenance = services.lastWhereOrNull(
                      (element) =>
                          element.serviceOdometer >
                              (vehicle.currentOdometer ?? 0) &&
                          !element.done,
                    );
                    final double progress =
                        (vehicle.currentOdometer ?? 0) /
                        (nextMaintenance?.serviceOdometer ?? 1);

                    return services.isEmpty
                        ? Center(child: Text('No services'))
                        : Expanded(
                            child: Column(
                              children: [
                                CarProgressCard(
                                  vehicle: vehicle,
                                  progress: progress,
                                  nextMaintenance:
                                      nextMaintenance?.serviceOdometer,
                                ),
                                if (!(state.allDisplayed ?? false))
                                  state.loadingMore ?? false
                                      ? LoadingWidget()
                                      : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                        
                                            child: SizedBox(
                                              width: 90,
                                              height: 44,
                                        
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(32),
                                                  ),
                                                ),
                                        
                                                onPressed: () =>
                                                    cubit.loadingUpcoming(),
                                        
                                                child: const Text(
                                                  'future',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ),
                                Expanded(
                                  child: TimelineWidget(
                                    onRefresh: () => cubit.getMaintenanceMethod(
                                      fromRemote: true,
                                    ),
                                    dashedOrSolid: (index) =>
                                        services[index].done,
                                    itemCount: services.length,
                                    oppositeContentsBuilder: (context, index) =>
                                        SeverityWidget(
                                          severity: services[index].severity,
                                          onSeverity: (severity) =>
                                              severity == 'routine',
                                        ),
                                    contentsBuilder: (context, index) {
                                      final service = services[index];
                                      return MaintenanceCard(
                                        hasCheckBox: true,
                                        service: service,
                                        onTab: () async {
                                          context
                                              .push(
                                                Routes.maintenanceDetails,
                                                extra: service,
                                              )
                                              .then((value) {
                                                if (value == true) {
                                                  cubit.getMaintenanceMethod(
                                                    fromRemote: false,
                                                  );
                                                }
                                              });
                                        },
                                        onChanged: (value) async {
                                          await showDialog(
                                            context: context,
                                            builder: (context) =>
                                                SaveServiceFeatureWidget(
                                                  serviceInfo: service,
                                                  vehicle: vehicle,
                                                ),
                                          ).then((value) {
                                            if (value == true &&
                                                context.mounted) {
                                              cubit.getMaintenanceMethod(
                                                fromRemote: false,
                                              );
                                            }
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                  default:
                    return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
