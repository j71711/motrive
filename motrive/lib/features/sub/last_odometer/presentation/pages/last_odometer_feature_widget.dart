import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:motrive/features/sub/last_odometer/presentation/cubit/last_odometer_cubit.dart';
import 'package:motrive/features/sub/last_odometer/presentation/cubit/last_odometer_state.dart';

class LastOdometerFeatureWidget extends StatelessWidget {
  final String Function(UserVehicleEntity)? text;
  final Function(UserVehicleEntity)? vehicle;
  const LastOdometerFeatureWidget({super.key, this.text, this.vehicle});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LastOdometerCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<LastOdometerCubit>();
          return BlocConsumer<LastOdometerCubit, LastOdometerState>(
            listener: (context, state) {
              if (state is LastOdometerSuccessState) {
                if (vehicle != null) {
                  vehicle!(state.vehicle);
                }
              }
            },
            builder: (context, state) {
              if (state is LastOdometerSuccessState) {
                final statement = text == null
                    ? '${'last_odometer'.tr()}: ${Formatters.formatOdometer(state.vehicle.currentOdometer ?? 0)}'
                    : text!(state.vehicle);
                return Text(statement);
              }
              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
