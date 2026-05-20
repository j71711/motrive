import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance_details/presentation/cubit/maintenance_details_cubit.dart';
import 'package:motrive/features/maintenance_details/presentation/cubit/maintenance_details_state.dart';
import 'package:motrive/features/maintenance_details/presentation/widgets/part_card.dart';
import 'package:motrive/features/maintenance_details/presentation/widgets/service_info_card.dart';
import 'package:motrive/features/sub/save_service/presentation/pages/save_service_feature_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MaintenanceDetailsFeatureScreen extends StatelessWidget {
  final ServiceInfoEntity serviceInfo;
  const MaintenanceDetailsFeatureScreen({super.key, required this.serviceInfo});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MaintenanceDetailsCubit>();
    final activeLoc = context.locale;
    cubit.getMaintenanceDetailsMethod(serviceInfo.id);
  
    return Scaffold(
      appBar: AppBar(
        actionsPadding: .symmetric(horizontal: 8),
        actions: [
          BlocBuilder<MaintenanceDetailsCubit, MaintenanceDetailsState>(
            builder: (context, state) {
       

              if (!serviceInfo.done) {
                return IconButton.filled(
                  onPressed: () async {
                    if (state is! MaintenanceDetailsSuccessState) {
                      return;
                    }
                    await showDialog(
                      context: context,
                      builder: (context) => SaveServiceFeatureWidget(
                        serviceInfo: serviceInfo,
                        vehicle: state.maintenanceDetails.vehicle,
                      ),
                    ).then((value) {
                      if (value == true && context.mounted) {
                        context.pop(true);
                      }
                    });
                  },
                  icon: Icon(
                    Icons.done,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                );
              } else {
                return Container(
                  padding: .all(8),
                  decoration: BoxDecoration(
                    borderRadius: .circular(18),
                    color: Theme.of(context).colorScheme.primary,
                  ),

                  child: Text('done'.tr()),
                );
              }
            },
          ),
        ],
      ),
      body: BlocListener<MaintenanceDetailsCubit, MaintenanceDetailsState>(
        listener: (context, state) {
          if (state is MaintenanceDetailsErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ServiceInfoCard(serviceInfo: serviceInfo),

                const SizedBox(height: 16),

                BlocBuilder<MaintenanceDetailsCubit, MaintenanceDetailsState>(
                  builder: (context, state) {
                    switch (state) {
                      case MaintenanceDetailsErrorState _:
                        return Expanded(
                         child: Center(child: Text('no_services_available'.tr())),
                        );

                      case MaintenanceDetailsSuccessState _:
                        final parts = state.maintenanceDetails.parts;

                        if (parts.isEmpty) {
                          return Expanded(
                                   child: Center(child: Text('no_services_available'.tr())),
                          );
                        }

                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary
                                        .withValues(alpha: .08),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                         '${'last_odometer'.tr()}: ${Formatters.formatOdometer(state.maintenanceDetails.vehicle.currentOdometer ?? 0)}',
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 14),

                              Expanded(
                                child: ListView.separated(
                                  itemBuilder: (context, index) =>
                                      PartCard(part: parts[index]),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount: parts.length,
                                ),
                              ),
                            ],
                          ),
                        );
                    }

                    return Expanded(
                      child: Skeletonizer(
                        child: ListView.separated(
                          itemBuilder: (context, index) => PartCard(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: 5,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
