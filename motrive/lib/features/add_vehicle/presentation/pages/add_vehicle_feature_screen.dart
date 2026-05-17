import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/utils/validators.dart';
import 'package:motrive/features/add_vehicle/presentation/cubit/add_vehicle_cubit.dart';
import 'package:motrive/features/add_vehicle/presentation/cubit/add_vehicle_state.dart';
import 'package:motrive/features/add_vehicle/presentation/widgets/vehicle_field.dart';
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/presentation/pages/scan_vehicle_feature_widget.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:motrive/features/home/sub/add_car_card/presentation/pages/add_car_card_feature_widget.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';

class AddVehicleFeatureScreen extends HookWidget {
  const AddVehicleFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddVehicleCubit>();
    final formKey = GlobalKey<FormState>();
    final String? carInfoId;

    final makeController = useTextEditingController();
    final modelController = useTextEditingController();
    final yearController = useTextEditingController();
    final vinController = useTextEditingController();
    final licensePlateController = useTextEditingController();
    final colorController = useTextEditingController();
    final odometerController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('AddVehicle Feature Screen')),
      body: BlocConsumer<AddVehicleCubit, AddVehicleState>(
        listener: (context, state) async {
          if (state is AddVehicleInitialState) {
            await showDialog(
              context: context,
              builder: (context) {
                final screenSize = MediaQuery.of(context).size;
                return Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(20),
                    child: Container(
                      width: screenSize.width * 0.85,
                      height: screenSize.height * 0.60,
                      padding: const EdgeInsets.all(16),
                      child: const AddCarCardFeatureWidget(),
                    ),
                  ),
                );
              },
            ).then((vehicle) {
              if (vehicle is BaseCarEntity) {
                makeController.text = vehicle.make ?? '';
                      modelController.text = vehicle.model ?? '';
                      yearController.text = vehicle.year.toString();
              }
            });
          }

          if (state is AddVehicleSuccessState && context.mounted) {
            context.pop(true);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              if (state is AddVehicleInitialState && state.isScanning == true)
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: double.infinity,
                  child: ScanVehicleFeatureWidget(
                    onScanned: (vehicle) {
                      makeController.text = vehicle.make ?? '';
                      modelController.text = vehicle.model ?? '';
                      yearController.text = vehicle.year.toString();
                      vinController.text = vehicle.vin ?? '';
                      licensePlateController.text = vehicle.licensePlate ?? '';
                      colorController.text = vehicle.color ?? '';
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
                            controller: vinController,
                            label: 'VIN *',
                            maxLength: 17,
                            suffix: IconButton(
                              onPressed: () => cubit.toggleCamera(
                                state is AddVehicleInitialState
                                    ? !(state.isScanning ?? false)
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
                            controller: makeController,
                            label: 'Make',
                            validator: Validators.validateRequired,
                            icon: Icons.car_rental_outlined,
                          ),
                          const Gap(16),

                          VehicleField(
                            controller: modelController,
                            label: 'Model',
                            validator: Validators.validateRequired,
                            icon: Icons.car_rental_outlined,
                          ),
                          const Gap(16),

                          VehicleField(
                            controller: yearController,
                            label: 'Year',
                            icon: Icons.calendar_month_outlined,
                            validator: Validators.validateRequired,
                            keyboardType: TextInputType.number,
                          ),
                          const Gap(16),

                          VehicleField(
                            controller: odometerController,
                            label: 'Current Odometer',
                            icon: Icons.numbers,
                            validator: Validators.validateRequired,
                            keyboardType: TextInputType.number,
                          ),
                          const Gap(16),

                          VehicleField(
                            controller: colorController,
                            label: 'Color',
                            icon: Icons.color_lens_outlined,
                          ),
                          const Gap(16),

                          VehicleField(
                            controller: licensePlateController,
                            label: 'License Plate',
                            icon: Icons.padding_outlined,
                          ),
                          const Gap(32),

                          SizedBox(
                            width: double.infinity,
                            child: FilledButton.icon(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  final UserVehicleEntity
                                  vehicle = UserVehicleEntity(
                                    make: makeController.text,
                                    model: modelController.text,
                                    year:
                                        int.tryParse(yearController.text) ?? 0,
                                    color: colorController.text,
                                    licensePlate: licensePlateController.text,
                                    vin: vinController.text,
                                  );

                                  cubit.getAddVehicleMethod(vehicle);
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
    );
  }
}
