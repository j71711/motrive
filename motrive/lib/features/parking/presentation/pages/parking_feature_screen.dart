import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/parking/presentation/cubit/parking_cubit.dart';
import 'package:motrive/features/parking/presentation/cubit/parking_state.dart';
import 'package:motrive/features/parking/sub/parking_history/presentation/pages/parking_history_feature_widget.dart';

class ParkingFeatureScreen extends StatelessWidget {
  const ParkingFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ParkingCubit>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: BlocConsumer<ParkingCubit, ParkingState>(
        listener: (context, state) {
          if (state is ParkingErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is ParkingActionSuccessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        builder: (context, state) {
          final hasParking = state is ParkingSuccessState;

          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 190,
                    width: double.infinity,

                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 24,
                      right: 24,
                    ),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],

                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              'Parking Location',

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (_) {
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                          .8,
                                      child:
                                          const ParkingHistoryFeatureWidget(),
                                    );
                                  },
                                );
                              },

                              icon: const Icon(
                                Icons.history_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),

                        const Gap(12),

                        Text(
                          hasParking
                              ? 'Last saved parking location'
                              : 'No parking location saved yet',

                          style: TextStyle(
                            color: Colors.white.withValues(alpha: .8),

                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),

                        child: hasParking
                            ? Stack(
                                children: [
                                  GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                        state.parking.latitudes,

                                        state.parking.longitude,
                                      ),

                                      zoom: 16,
                                    ),

                                    myLocationEnabled: true,
                                    myLocationButtonEnabled: true,

                                    markers: {
                                      Marker(
                                        markerId: const MarkerId(
                                          'parking_location',
                                        ),

                                        position: LatLng(
                                          state.parking.latitudes,

                                          state.parking.longitude,
                                        ),

                                        infoWindow: const InfoWindow(
                                          title: 'Your parked car',
                                        ),
                                      ),
                                    },
                                  ),

                                  Positioned(
                                    left: 16,
                                    right: 16,
                                    top: 16,

                                    child: Container(
                                      padding: const EdgeInsets.all(16),

                                      decoration: BoxDecoration(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.surface,

                                        borderRadius: BorderRadius.circular(20),
                                      ),

                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Text(
                                            state.parking.address ??
                                                'Unknown location',

                                            style: TextStyle(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurface,

                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          const Gap(6),

                                          Text(
                                            state.parking.parkedAt,

                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withValues(alpha: .7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withValues(alpha: .08),

                                child: Center(
                                  child: Text(
                                    'No parking location yet',

                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,

                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),

                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 58,

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,

                                foregroundColor: Colors.white,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),

                              onPressed: () {
                                cubit.manualSaveParkingMethod();
                              },

                              child: const Text(
                                'Save Parking',

                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const Gap(18),

                        Expanded(
                          child: SizedBox(
                            height: 58,

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.secondary,

                                foregroundColor: Colors.white,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),

                              onPressed: hasParking ? () {} : null,

                              child: const Text(
                                'Direction',

                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              if (state is ParkingLoadingState)
                Container(
                  color: Colors.black.withValues(alpha: .35),

                  child: const Center(child: LoadingWidget()),
                ),
            ],
          );
        },
      ),
    );
  }
}
