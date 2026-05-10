import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/features/home0/sub/add_car_card/presentation/cubit/add_car_card_cubit.dart';
import 'package:motrive/features/home0/sub/add_car_card/presentation/cubit/add_car_card_state.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/presentation/pages/scan_vehicle_feature_widget.dart';

class AddCarCardFeatureWidget extends StatelessWidget {
  const AddCarCardFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCarCardCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AddCarCardCubit>();
          return Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  onChanged: (value) {
                    cubit.search(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search vehicle',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<AddCarCardCubit, VehicleState>(
                  builder: (context, state) {
                    switch (state) {
                      case VehicleLoadingState _:
                        return const Center(child: CircularProgressIndicator());
                      case VehicleLoadedState _:
                        return ListView.builder(
                          itemCount: state.vehicles.length,
                          itemBuilder: (context, index) {
                            final vehicle = state.vehicles[index];
                            return Dismissible(
                              key: Key(
                                vehicle.id.toString(),
                              ),
                              confirmDismiss: (direction) async {
                                return await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('confirmation'),
                                    content: Text(
                                      'do you want deletit ${vehicle.make} ${vehicle.model} ? ',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(false),
                                        child: const Text('cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(true),
                                        child: const Text(
                                          'delete',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              onDismissed: (direction) {
                                cubit.deleteVehicle(vehicle.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Deleted ${vehicle.make} successfully',
                                    ),
                                  ),
                                );
                              },

                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),

                              child: ListTile(
                                leading: const Icon(Icons.drive_eta),
                                trailing: Text(
                                  'Year: ${vehicle.year.toString()}',
                                ),
                                title: Text(
                                  ' ${vehicle.make}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  ' ${vehicle.model}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      case VehicleErrorState _:
                        return Center(child: Text(state.message));
                    }
                    return const SizedBox();
                  },
                ),
              ),
              IconButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ScanVehicleFeatureWidget(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
          );
        },
      ),
    );
  }
}
