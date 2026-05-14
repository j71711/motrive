import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motrive/features/parking/presentation/cubit/parking_cubit.dart';
import 'package:motrive/features/parking/presentation/cubit/parking_state.dart';

class ParkingFeatureScreen extends StatelessWidget {
  const ParkingFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ParkingCubit>();

    return Scaffold(
      body: BlocConsumer<ParkingCubit, ParkingState>(
        listener: (context, state) {
          if (state is ParkingErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final hasParking = state is ParkingSuccessState;

          return Column(
            children: [
              Container(
                height: 165,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(34),
                    bottomRight: Radius.circular(34),
                  ),
                ),
                child: SafeArea(
                  child: Center(
                    child: Text(
                      'Location',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: hasParking
                    ? GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            state.parking.latitude,
                            state.parking.longitude,
                          ),
                          zoom: 16,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId('parking_location'),
                            position: LatLng(
                              state.parking.latitude,
                              state.parking.longitude,
                            ),
                            infoWindow: const InfoWindow(
                              title: 'Your parked car',
                            ),
                          ),
                        },
                      )
                    : const Center(
                        child: Text('No parking location yet'),
                      ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(28, 18, 28, 24),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.manualSaveParkingMethod();
                          },
                          child: const Text('Save'),
                        ),
                      ),
                    ),

                    const Gap(24),

                    Expanded(
                      child: SizedBox(
                        height: 54,
                        child: ElevatedButton(
                          onPressed: hasParking ? () {} : null,
                          child: const Text('Direction'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}