import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/features/home/sub/add_car_card/presentation/cubit/add_car_card_cubit.dart';
import 'package:motrive/features/home/sub/add_car_card/presentation/cubit/add_car_card_state.dart';
import 'package:motrive/features/home/sub/scan_vehicle/presentation/cubit/scan_vehicle_cubit.dart';
import 'package:motrive/features/home/sub/scan_vehicle/presentation/cubit/scan_vehicle_state.dart';
import 'package:motrive/features/home/sub/scan_vehicle/presentation/pages/camera_section_widget.dart';

class ScanVehicleFeatureWidget extends HookWidget {
  ScanVehicleFeatureWidget({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanVehicleCubit(GetIt.I.get()),
      child: Scaffold(
        body: BlocConsumer<ScanVehicleCubit, ScanVehicleState>(
          listener: (context, state) {
            if (state is ScanVehicleSavedState) {
              context.showSnackBar('Vehicle saved successfully');
              context.read<AddCarCardCubit>().getAddCarCardMethod();
            }

            if (state is ScanVehicleErrorState) {
              context.showSnackBar(state.message);
            }
          },
          builder: (context, state) {
            final cubit = context.read<ScanVehicleCubit>();
            return Stack(
              children: [
                if (state is ScanVehicleInitialState && state.scanning == true)
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
                      body: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: formKey,
                        child: ListView(
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
                            VehicleField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: cubit.vinController,
                              label: 'VIN *',
                              maxLength: 17,
                              suffix: IconButton(
                                onPressed: () => cubit.toggleCamera(
                                  state is ScanVehicleInitialState
                                      ? !(state.scanning ?? false)
                                      : true,
                                ),
                                padding: .zero,
                                icon: Icon(Icons.camera_alt_outlined),
                              ),
                              icon: Icons.confirmation_number_outlined,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'VIN number is required';
                                }
                                if (value.trim().length != 17) {
                                  return 'VIN must be exactly 17 characters';
                                }
                                return null;
                              },
                            ),

                            const Gap(16),

                            VehicleField(
                              controller: cubit.makeController,
                              label: 'Make',
                              icon: Icons.car_rental_outlined,
                            ),
                            const Gap(16),

                            VehicleField(
                              controller: cubit.modelController,
                              label: 'Model',
                              icon: Icons.car_rental_outlined,
                            ),
                            const Gap(16),

                            VehicleField(
                              controller: cubit.yearController,
                              label: 'Year',
                              icon: Icons.calendar_month_outlined,
                              keyboardType: TextInputType.number,
                            ),
                            const Gap(16),

                            VehicleField(
                              controller: cubit.colorController,
                              label: 'Color',
                              icon: Icons.color_lens_outlined,
                            ),
                            const Gap(16),

                            VehicleField(
                              controller: cubit.licensePlateController,
                              label: 'License Plate',
                              icon: Icons.padding_outlined,
                            ),
                            const Gap(32),

                            if (state is ScanVehicleLoadingState)
                              const Center(child: CircularProgressIndicator()),

                            SizedBox(
                              width: double.infinity,
                              child: FilledButton.icon(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.saveVehicle();
                                  }
                                },
                                icon: const Icon(Icons.save_outlined),
                                label: const Text('Save Vehicle'),
                              ),
                            ),
                            const Gap(40),
                          ],
                        ),
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

// ignore: must_be_immutable
class VehicleField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  AutovalidateMode? autovalidateMode;
  final int? maxLength;

  VehicleField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.autovalidateMode,
    this.maxLength,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLength: maxLength,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        suffix: suffix,
      ),
    );
  }
}
