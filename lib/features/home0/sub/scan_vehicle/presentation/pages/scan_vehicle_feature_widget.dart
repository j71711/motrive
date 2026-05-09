import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/presentation/cubit/scan_vehicle_cubit.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/presentation/cubit/scan_vehicle_state.dart';


class ScanVehicleFeatureWidget extends StatelessWidget {
  const ScanVehicleFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanVehicleCubit(GetIt.I.get()),
      child:BlocConsumer< ScanVehicleCubit, ScanVehicleState>(
          listener: (context, state) {
            if (state is ScanVehicleSuccessState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                SnackBar(
                  content: Text(
                    'Vehicle detected successfully',
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<ScanVehicleCubit>();
            switch (state) {
                case ScanVehicleLoadingState _: return Center(child: const CircularProgressIndicator());

                  case ScanVehicleSuccessState _: return Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(state.vehicle.make),
                      Text(state.vehicle.model),
                      Text(
                        state.vehicle.year.toString(),
                      ),
                      Text(state.vehicle.vin),
                    ],
                  );

                case ScanVehicleErrorState _: return Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(state.message),
                      ElevatedButton(
                        onPressed: () {
                          cubit.scanVehicle();
                        },
                        child: const Text(
                          'Retry',
                        ),
                      ),
                    ],
                  );

                case _: return 
                ElevatedButton(
                    onPressed: () {
                      cubit.scanVehicle();
                    },
                    child: const Text(
                      'Scan Registration Card',
                    ),
                  );
              }
          },
        ),
    );
  }
}
