import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/presentation/cubit/scan_vehicle_cubit.dart';
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/presentation/cubit/scan_vehicle_state.dart';
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/presentation/pages/camera_section_widget.dart';

class ScanVehicleFeatureWidget extends HookWidget {
  final Function(ScanVehicleEntity)? onScanned;
  ScanVehicleFeatureWidget({super.key, this.onScanned});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanVehicleCubit(GetIt.I.get()),
      child: Scaffold(
        body: BlocConsumer<ScanVehicleCubit, ScanVehicleState>(
          listener: (context, state) {
            context.hideLoading();
            if (state is ScanVehicleSuccessState) {
              context.showSnackBar('Vehicle scanned successfully');
              if (onScanned != null) {
                onScanned!(state.vehicle);
              }
            }
            if (state is ScanVehicleLoadingState) {
              context.showLoading();
            }
            if (state is ScanVehicleErrorState) {
              context.showSnackBar(state.message);
            }
          },
          builder: (context, state) {
            final cubit = context.read<ScanVehicleCubit>();
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              width: double.infinity,
              child: CameraSectionWidget(
                onCapture: (imagePath) {
                  cubit.processImage(imagePath);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
