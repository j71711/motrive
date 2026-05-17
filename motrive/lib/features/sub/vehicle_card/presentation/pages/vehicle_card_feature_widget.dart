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
      create: (context) => VehicleCardCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<VehicleCardCubit>();
          return BlocBuilder<VehicleCardCubit, VehicleCardState>(
            builder: (context, state) {
              switch (state) {
                case VehicleCardInitialState _:
                  return Skeletonizer(child: VehicleCardWidget());
                case VehicleCardSuccessState _:
                  return VehicleCardWidget(vehicle: state.vehicle);
                default:
                  return InkWell(
                    onTap: () async =>
                        await context.push(Routes.addVehicle).then((value) {
                          if (value == true) {
                            cubit.getVehicleCardMethod();
                          }
                        }),
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(),
                      ),
                      child: const Text("Add your first vehicle car"),
                    ),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
