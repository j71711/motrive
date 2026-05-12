import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_cubit.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_state.dart';

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
                        itemCount: state.maintenanceEntity.services.length,
                        itemBuilder: (context, index) {
                          final service =
                              state.maintenanceEntity.services[index];
                          return ListTile(
                            onTap: () {},
                            leading: Icon(Icons.car_repair),
                            title: Text('${service.serviceOdometer} Km'),
                            subtitle: Text(
                              service.recommendation,
                              overflow: .ellipsis,
                            ),
                            trailing: FittedBox(
                              child: Stack(
                                clipBehavior: .none,
                                children: [
                                  Positioned(
                                    top: -20,
                                    right: 0,
                                    child: Container(
                                      padding: .symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
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
                                  ),
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) => value,
                                  ),
                                ],
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
