import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/core/widgets/error_button.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_cubit.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_state.dart';
import 'package:motrive/features/sub/save_service/presentation/pages/save_service_feature_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines_plus/timelines_plus.dart';

class MaintenanceFeatureScreen extends StatelessWidget {
  const MaintenanceFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MaintenanceCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Maintenance'), centerTitle: true),
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
            Card(),

            BlocBuilder<MaintenanceCubit, MaintenanceState>(
              builder: (context, state) {
                if (state is MaintenanceSuccessState) {
                  return state.allDisplayed ?? false
                      ? SizedBox.shrink()
                      : state.loadingMore ?? false
                      ? LoadingWidget()
                      : TextButton(
                          onPressed: () => cubit.loadingUpcoming(),
                          child: Text('See Upcoming Maintenance'),
                        );
                }
                return SizedBox.shrink();
              },
            ),
            BlocBuilder<MaintenanceCubit, MaintenanceState>(
              builder: (context, state) {
                return switch (state) {
                  MaintenanceLoadingState _ => LoadingWidget(),
                  MaintenanceErrorState _ => Expanded(
                    child: ErrorButton(
                      message: state.message,
                      refresh: () =>
                          cubit.getMaintenanceMethod(fromRemote: true),
                    ),
                  ),
                  MaintenanceSuccessState _ =>
                    state.services.isEmpty
                        ? Center(child: Text('No services'))
                        : Expanded(
                            child: RefreshIndicator(
                              onRefresh: () =>
                                  cubit.getMaintenanceMethod(fromRemote: true),
                              child: Timeline.tileBuilder(
                                padding: .all(8),

                                builder: TimelineTileBuilder.connected(
                                  firstConnectorBuilder: (context) =>
                                      DashedLineConnector(
                                        thickness: 3,
                                        gap: 5,
                                        space: 5,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                  oppositeContentsBuilder: (context, index) =>
                                      Center(
                                        child: Container(
                                          margin: .symmetric(horizontal: 4),
                                          padding: .symmetric(
                                            horizontal: 8,
                                            vertical: 3,
                                          ),
                                          height: 7.w,
                                          decoration: BoxDecoration(
                                            borderRadius: .circular(16),
                                            color:
                                                state
                                                        .services[index]
                                                        .severity ==
                                                    'critical'
                                                ? Colors.orangeAccent
                                                : Colors.green,
                                          ),
                                          child: Center(
                                            child: Text(
                                              state.services[index].severity,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  connectorBuilder: (context, index, type) =>
                                      state.services[index].done
                                      ? SolidLineConnector(
                                          thickness: 3,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        )
                                      : DashedLineConnector(
                                          thickness: 3,
                                          gap: 5,
                                          space: 5,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                  indicatorBuilder: (context, index) =>
                                      Container(
                                        margin: .all(5),
                                        decoration: BoxDecoration(
                                          shape: .circle,
                                        ),
                                        child: Icon(Icons.car_repair_outlined),
                                      ),
                                  itemCount: state.services.length,
                                  contentsAlign: ContentsAlign.basic,

                                  nodePositionBuilder: (context, index) => 0.2,
                                  contentsBuilder: (context, index) {
                                    final service = state.services[index];
                                    return ListTile(
                                      onTap: () async {
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
                                      title: Text(
                                        Formatters.formatOdometer(
                                          service.serviceOdometer,
                                        ),
                                      ),
                                      subtitle:
                                          service.recommendation == 'no data'
                                          ? null
                                          : Text(
                                              service.recommendation,
                                              overflow: .ellipsis,
                                            ),
                                      trailing: Checkbox(
                                        shape: CircleBorder(),
                                        value: state.services[index].done,
                                        onChanged: (value) async {
                                          await showDialog(
                                            context: context,
                                            builder: (context) =>
                                                SaveServiceFeatureWidget(
                                                  serviceInfo: service,
                                                  vehicle: state
                                                      .maintenanceEntity
                                                      .vehicle,
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
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                  _ => SizedBox.shrink(),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
