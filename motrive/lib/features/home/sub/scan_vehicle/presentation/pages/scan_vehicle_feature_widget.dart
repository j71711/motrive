import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/features/home/sub/scan_vehicle/presentation/cubit/scan_vehicle_cubit.dart';
import 'package:motrive/features/home/sub/scan_vehicle/presentation/cubit/scan_vehicle_state.dart';
import 'package:motrive/features/home/sub/scan_vehicle/presentation/pages/camera_section_widget.dart';

class ScanVehicleFeatureWidget extends StatelessWidget {
  const ScanVehicleFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanVehicleCubit(GetIt.I.get()),
      child: Scaffold(
        body: BlocConsumer<ScanVehicleCubit, ScanVehicleState>(
          listener: (context, state) {
            if (state is ScanVehicleSavedState) {
              context.showSnackBar('Vehicle saved successfully');
            }

            if (state is ScanVehicleErrorState) {
              context.showSnackBar(state.message);
            }
          },
          builder: (context, state) {
            final cubit = context.read<ScanVehicleCubit>();
            return Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: double.infinity,
                  child: CameraSectionWidget(
                    onCapture: (imagePath) {
                      cubit.processImage(imagePath);
                    },
                  ),
                ),

                DraggableScrollableSheet(
                  initialChildSize: 0.55,
                  minChildSize: 0.45,
                  maxChildSize: 0.70,
                  builder: (context, scrollController) {
                    return Scaffold(
                      body: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.all(24),
                        children: [
                          Center(
                            child: Container(
                              width: 50,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          const Gap(12),
                          Text(
                            'Vehicle Information',
                            style: TextStyle(fontSize: 20, fontWeight: .bold),
                          ),
                          const Gap(8),
                          Text(
                            'Review and edit vehicle details before saving.',
                          ),
                          const Gap(32),
                          _VehicleField(
                            controller: cubit.vinController,
                            label: 'VIN',
                            icon: Icons.confirmation_number_outlined,
                          ),
                          const Gap(16),
                          _VehicleField(
                            controller: cubit.modelController,
                            label: 'Model',
                            icon: Icons.car_rental_outlined,
                          ),
                          const Gap(16),
                          _VehicleField(
                            controller: cubit.yearController,
                            label: 'Year',
                            icon: Icons.calendar_month_outlined,
                            keyboardType: TextInputType.number,
                          ),
                          const Gap(32),
                          if (state is ScanVehicleLoadingState)
                            const Center(child: CircularProgressIndicator()),

                         
                         
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton.icon(
                                onPressed: () {
                                 cubit.saveVehicle();
                                 context.pop(context);
                                },
                                icon: const Icon(Icons.save_outlined),
                                label: const Text('Save Vehicle'),
                              ),
                            ),

                          const Gap(40),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _VehicleField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;

  const _VehicleField({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
    );
  }
}
