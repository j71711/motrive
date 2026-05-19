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
          if (state is ParkingErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is ParkingActionSuccessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            cubit.getParkingMethod();
          }
        },
        builder: (context, state) {
          final hasParking = state is ParkingSuccessState;

          return Stack(
            children: [
              if (hasParking)
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
                      markerId:  MarkerId('parking_location'.tr(),),
                      position: LatLng(
                        state.parking.latitudes,
                        state.parking.longitude,
                      ),
                      infoWindow: InfoWindow(title: 'your_parked_car'.tr()),
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
                          color: Theme.of(context).colorScheme.surface,
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .12),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                             'parking_location'.tr(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(12),
                      Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
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
                                      MediaQuery.of(context).size.height * .82,
                                  child: const ParkingHistoryFeatureWidget(),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.history_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (hasParking)
                Positioned(
                  left: 20,
                  right: 20,
                  top: 160,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .16),
                          blurRadius: 22,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: .12),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.directions_car_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                               state.parking.address ?? 'unknown_location'.tr(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(5),
                              Text(
                                state.parking.parkedAt,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withValues(alpha: .6),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              Positioned(
                left: 20,
                right: 20,
                bottom: 80,
                child: SizedBox(
                  height: 62,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      cubit.manualSaveParkingMethod();
                    },
                    icon: const Icon(Icons.my_location_rounded),
                 label: Text('save_current_parking'.tr()),
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
