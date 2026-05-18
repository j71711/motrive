import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/services/map_launcher_service.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/parking/sub/parking_history/presentation/cubit/parking_history_cubit.dart';
import 'package:motrive/features/parking/sub/parking_history/presentation/cubit/parking_history_state.dart';

class ParkingHistoryFeatureWidget extends StatelessWidget {
  const ParkingHistoryFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ParkingHistoryCubit(GetIt.I.get())..getParkingHistoryMethod(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<ParkingHistoryCubit, ParkingHistoryState>(
            builder: (context, state) {
              if (state is ParkingHistoryLoadingState) {
                return const Center(child: LoadingWidget());
              }

              if (state is ParkingHistoryErrorState) {
                return Center(child: Text(state.message));
              }

              if (state is ParkingHistorySuccessState) {
                if (state.parkings.isEmpty) {
                  return const Center(child: Text('No parking history yet'));
                }

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Parking History',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Gap(20),

                      Expanded(
                        child: ListView.separated(
                          itemCount: state.parkings.length,
                          separatorBuilder: (_, _) => const Gap(12),
                          itemBuilder: (context, index) {
                            final parking = state.parkings[index];
                            final mapLauncher = GetIt.I<MapLauncherService>();

                            final isManual =
                                parking.detectionMethod.toLowerCase() ==
                                    'manual';

                            return InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                mapLauncher.openGoogleMap(
                                  latitude: parking.latitudes,
                                  longitude: parking.longitude,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withValues(alpha: .12),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 46,
                                          width: 46,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withValues(alpha: .12),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          child: Icon(
                                            isManual
                                                ? Icons.touch_app_rounded
                                                : Icons.auto_awesome_rounded,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),

                                        const Gap(12),

                                        Expanded(
                                          child: Text(
                                            parking.address ??
                                                'Unknown location',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        Icon(
                                          Icons.open_in_new_rounded,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ],
                                    ),

                                    const Gap(14),

                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isManual
                                                ? Colors.orange.withValues(
                                                    alpha: .15,
                                                  )
                                                : Colors.green.withValues(
                                                    alpha: .15,
                                                  ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Text(
                                            isManual
                                                ? 'Manual parking'
                                                : 'Auto parking',
                                            style: TextStyle(
                                              color: isManual
                                                  ? Colors.orange
                                                  : Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        const Spacer(),

                                        Flexible(
                                          child: Text(
                                            parking.parkedAt,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withValues(alpha: .65),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}