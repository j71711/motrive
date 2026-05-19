import 'package:easy_localization/easy_localization.dart';
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
      body: BlocConsumer<ParkingCubit, ParkingState>(
        listener: (context, state) {
          if (state is ParkingErrorState &&
              !state.message.contains('No parking location found')) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }

          if (state is ParkingActionSuccessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );

            cubit.getParkingMethod();
          }
        },

        builder: (context, state) {
          final hasParking = state is ParkingSuccessState;

          return Stack(
            children: [
              if (hasParking) ...[
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
                      markerId: MarkerId(
                        'parking_location'.tr(),
                      ),

                      position: LatLng(
                        state.parking.latitudes,
                        state.parking.longitude,
                      ),

                      infoWindow: InfoWindow(
                        title: 'your_parked_car'.tr(),
                      ),
                    ),
                  },
                ),

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          height: 54,
                          width: 54,

                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surface,

                            borderRadius: BorderRadius.circular(18),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .12),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),

                          child: Icon(
                            Icons.local_parking_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          ),
                        ),

                        const Gap(12),

                        Expanded(
                          child: Container(
                            height: 54,

                            alignment: Alignment.center,

                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surface,

                              borderRadius: BorderRadius.circular(18),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: .12),
                                  blurRadius: 18,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),

                            child: Text(
                              'parking_location'.tr(),

                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,

                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),

                        const Gap(12),

                        Container(
                          height: 54,
                          width: 54,

                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surface,

                            borderRadius: BorderRadius.circular(18),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .12),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),

                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,

                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(28),
                                  ),
                                ),

                                builder: (_) {
                                  return SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        .82,

                                    child:
                                        const ParkingHistoryFeatureWidget(),
                                  );
                                },
                              );
                            },

                            icon: Icon(
                              Icons.history_rounded,
                              color: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 24,

                  child: SizedBox(
                    height: 62,

                    child: ElevatedButton.icon(
                      onPressed: () {
                        cubit.manualSaveParkingMethod();
                      },

                      icon: const Icon(
                        Icons.my_location_rounded,
                      ),

                      label: Text(
                        'save_current_parking'.tr(),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        elevation: 8,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),

                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ] else ...[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          height: 120,
                          width: 120,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: .08),
                          ),

                          child: Icon(
                            Icons.local_parking_rounded,
                            size: 60,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),

                        const Gap(24),

                        Text(
                        'no_parking_location'.tr(),

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,

                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface,
                          ),
                        ),

                        const Gap(10),

                        Text(
                          'save_parking_description'.tr(),

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,

                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: .6),
                          ),
                        ),

                        const Gap(28),

                        SizedBox(
                          width: double.infinity,
                          height: 58,

                          child: ElevatedButton.icon(
                            onPressed: () {
                              cubit.manualSaveParkingMethod();
                            },

                            icon: const Icon(
                              Icons.my_location_rounded,
                            ),

                            label:  Text(
                             'save_parking_location'.tr(),
                            ),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              elevation: 8,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),

                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              if (state is ParkingLoadingState)
                Container(
                  color: Colors.black.withValues(alpha: .35),

                  child: const Center(
                    child: LoadingWidget(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}