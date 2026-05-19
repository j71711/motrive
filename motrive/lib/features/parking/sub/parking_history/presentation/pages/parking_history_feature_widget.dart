import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/parking/sub/parking_history/presentation/cubit/parking_history_cubit.dart';
import 'package:motrive/features/parking/sub/parking_history/presentation/cubit/parking_history_state.dart';

class ParkingHistoryFeatureWidget extends StatelessWidget {
  const ParkingHistoryFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ParkingHistoryCubit(
                  GetIt.I.get(),
                )
                ..getParkingHistoryMethod(),

      child: Builder(
        builder: (context) {
          return BlocBuilder<
            ParkingHistoryCubit,
            ParkingHistoryState
          >(
            builder: (context, state) {
              if (state
                  is ParkingHistoryLoadingState) {
                return const Center(
                  child: LoadingWidget(),
                );
              }

              if (state
                  is ParkingHistoryErrorState) {
                return Center(
                  child: Text(
                    state.message,

                    style: TextStyle(
                      color:
                          Theme.of(context)
                              .colorScheme
                              .onSurface,
                    ),
                  ),
                );
              }

              if (state
                  is ParkingHistorySuccessState) {
                if (state
                    .parkings
                    .isEmpty) {
                  return Center(
                    child: Text(
                      'No parking history yet',

                      style: TextStyle(
                        color:
                            Theme.of(context)
                                .colorScheme
                                .onSurface,
                      ),
                    ),
                  );
                }

                return Padding(
                  padding:
                      const EdgeInsets.all(
                        20,
                      ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Parking History',

                        style: TextStyle(
                          color:
                              Theme.of(context)
                                  .colorScheme
                                  .onSurface,

                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const Gap(20),

                      Expanded(
                        child:
                            ListView.separated(
                              itemCount:
                                  state
                                      .parkings
                                      .length,

                              separatorBuilder:
                                  (_, _) =>
                                      const Gap(
                                        12,
                                      ),

                              itemBuilder: (
                                context,
                                index,
                              ) {
                                final parking =
                                    state
                                        .parkings[index];

                                return Container(
                                  padding:
                                      const EdgeInsets.all(
                                        16,
                                      ),

                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(
                                              context,
                                            )
                                            .colorScheme
                                            .surface,

                                    borderRadius:
                                        BorderRadius.circular(
                                          20,
                                        ),

                                    border: Border.all(
                                      color:
                                          Theme.of(
                                                context,
                                              )
                                              .colorScheme
                                              .primary
                                              .withValues(
                                                alpha:
                                                    .1,
                                              ),
                                    ),
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,

                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding:
                                                const EdgeInsets.all(
                                                  10,
                                                ),

                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(
                                                        context,
                                                      )
                                                      .colorScheme
                                                      .primary
                                                      .withValues(
                                                        alpha:
                                                            .1,
                                                      ),

                                              borderRadius:
                                                  BorderRadius.circular(
                                                    14,
                                                  ),
                                            ),

                                            child: Icon(
                                              Icons
                                                  .local_parking_rounded,

                                              color:
                                                  Theme.of(
                                                        context,
                                                      )
                                                      .colorScheme
                                                      .primary,
                                            ),
                                          ),

                                          const Gap(
                                            12,
                                          ),

                                          Expanded(
                                            child: Text(
                                              parking.address ??
                                                  'Unknown location',

                                              style: TextStyle(
                                                color:
                                                    Theme.of(
                                                          context,
                                                        )
                                                        .colorScheme
                                                        .onSurface,

                                                fontWeight:
                                                    FontWeight.bold,

                                                fontSize:
                                                    16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const Gap(
                                        14,
                                      ),

                                      Text(
                                        parking
                                            .parkedAt,

                                        style: TextStyle(
                                          color:
                                              Theme.of(
                                                    context,
                                                  )
                                                  .colorScheme
                                                  .onSurface
                                                  .withValues(
                                                    alpha:
                                                        .7,
                                                  ),
                                        ),
                                      ),
                                    ],
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