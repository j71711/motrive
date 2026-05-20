import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MaintenanceFeatureScreen extends StatelessWidget {
  const MaintenanceFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MaintenanceCubit>();
    final activeLoc = context.locale;


    return Scaffold(
      
      appBar: AppBar(title:  Text('maintenance'.tr()), centerTitle: true),
      body: BlocConsumer<MaintenanceCubit, MaintenanceState>(
        listener: (context, state) {
          if (state is MaintenanceErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        builder: (context, state) {
          switch (state) {
            case MaintenanceLoadingState _:
              return Skeletonizer(
                child: Column(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .start,
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
                              onSeverity: (severity) => severity == '   ',
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
              );
            case MaintenanceErrorState _:
              return ErrorButton(
                message: state.message,
                refresh: () => cubit.getMaintenanceMethod(fromRemote: true),
              );
            case MaintenanceDataProcessState _:
              return Column(
                mainAxisAlignment: .center,
                spacing: 10,
                children: [
                  LoadingWidget(),
                  Text(
                    state.status ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              );
            case MaintenanceSuccessState _:
              final vehicle = state.maintenanceEntity.vehicle;
              final services = state.services;
              final nextMaintenance = services.lastWhereOrNull(
                (element) =>
                    element.serviceOdometer > (vehicle.currentOdometer ?? 0) &&
                    !element.done,
              );
              final double progress =
                  (vehicle.currentOdometer ?? 0) /
                  (nextMaintenance?.serviceOdometer ?? 1);

              return services.isEmpty
                  ? Center(child: Text('no_services'.tr()))
                  : Column(
                      children: [
                        CarProgressCard(
                          vehicle: vehicle,
                          progress: progress,
                          nextMaintenance: nextMaintenance?.serviceOdometer,
                        ),
                        if (!(state.allDisplayed ?? false))
                          state.loadingMore ?? false
                              ? LoadingWidget(size: 16.w)
                              : Padding(
                                  padding: const .all(8.0),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,

                                    child: FilledButton(
                                      style: ElevatedButton.styleFrom(
                                        tapTargetSize: .shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                        ),
                                      ),

                                      onPressed: () => cubit.loadingUpcoming(),

                                      child: Text(
                                        'future_maintenance'.tr(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        Expanded(
                          child: TimelineWidget(
                            onRefresh: () =>
                                cubit.getMaintenanceMethod(fromRemote: true),
                            dashedOrSolid: (index) => services[index].done,
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
                                  context.push(
                                    Routes.maintenanceDetails,
                                    extra: service,
                                  );
                                },
                                onChanged: (value) async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) =>
                                        SaveServiceFeatureWidget(
                                          serviceInfo: service,
                                          vehicle: vehicle,
                                        ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
