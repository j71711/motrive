import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/features/sub/vehicle_card/presentation/cubit/vehicle_card_cubit.dart';
import 'package:motrive/features/sub/vehicle_card/presentation/cubit/vehicle_card_state.dart';
import 'package:motrive/features/sub/vehicle_card/presentation/widgets/vehicle_card_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VehicleCardFeatureWidget extends StatelessWidget {
  const VehicleCardFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VehicleCardCubit(GetIt.I.get())..getVehicleCardMethod(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<VehicleCardCubit>();

          return BlocBuilder<VehicleCardCubit, VehicleCardState>(
            builder: (context, state) {
              Widget child;

              switch (state) {
                case VehicleCardInitialState _:
                  child = const Skeletonizer(
                    enabled: true,
                    child: VehicleCardWidget(isExpanded: false),
                  );
                  break;

                case VehicleCardSuccessState _:
                  child = VehicleCardWidget(
                    vehicle: state.vehicle,
                    isExpanded: state.isExpanded,
                  );
                  break;

                default:
                  child = const VehicleCardWidget(isExpanded: false);
              }

              return InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: () async {
                  if (state is VehicleCardSuccessState) {
                    cubit.expandInfo(
                      vehicle: state.vehicle,
                      isExpanded: !state.isExpanded,
                    );
                  } else {
                    final value = await context.push(Routes.addVehicle);

                    if (value == true) {
                      cubit.getVehicleCardMethod();
                    }
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: child,
                ),
              );
            },
          );
        },
      ),
    );
  }
}