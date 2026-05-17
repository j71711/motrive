import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/features/add_vehicle/sub/add_car_card/presentation/cubit/add_car_card_cubit.dart';
import 'package:motrive/features/add_vehicle/sub/add_car_card/presentation/cubit/add_car_card_state.dart';
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/presentation/pages/scan_vehicle_feature_widget.dart';

class AddCarCardFeatureWidget extends StatelessWidget {
  const AddCarCardFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCarCardCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AddCarCardCubit>();
          cubit.getCarsInfo();
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
                child: BlocBuilder<AddCarCardCubit, AddCarCardState>(
                  builder: (context, state) {
                    switch (state) {
                      case SearchResultState _:
                        return ListView.builder(
                          itemCount: state.results.length,
                          itemBuilder: (context, index) {
                            final car = state.results[index];

                            return ListTile(
                              onTap: () => context.pop(car),
                              title: Text(car.make ?? ''),
                              subtitle: Text(car.model ?? ''),
                              trailing: Text('${car.year ?? ''}'),
                            );
                          },
                        );
                      case VehiclesLoadingState _:
                        return const Center(child: CircularProgressIndicator());
                      case CarsInfoLoadingState _:
                        return const Center(child: CircularProgressIndicator());
                      case CarInfoLoadedState _:
                        return ListView.builder(
                          itemCount: state.cars.length,
                          itemBuilder: (context, index) {
                            final car = state.cars[index];

                            return ListTile(
                              onTap: () => context.pop(car),
                              leading: const Icon(Icons.drive_eta),
                              title: Text(car.make ?? ''),
                              subtitle: Text(car.model ?? ''),
                              trailing: Text('${car.year ?? ''}'),
                            );
                          },
                        );
                      case AddCarCardLoadedState _:
                        return ListView.builder(
                          itemCount: state.vehicles.length,
                          itemBuilder: (context, index) {
                            final vehicle = state.vehicles[index];
                            return Dismissible(
                              key: Key(vehicle.id.toString()),
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
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text('cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
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
                                cubit.deleteVehicle(vehicle.id!);
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
                                onTap: () => context.pop(vehicle),
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
                      case AddCarCardErrorState _:
                        return Center(child: Text(state.message));
                    }
                    return const SizedBox();
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ScanVehicleFeatureWidget(),
                      ),
                    );
                    cubit.getAddCarCardMethod();
                  },
                  label: const Text('add Vehicle'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
