import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/utils/validators.dart';
import 'package:motrive/features/add_vehicle/presentation/cubit/add_vehicle_cubit.dart';
import 'package:motrive/features/add_vehicle/presentation/cubit/add_vehicle_state.dart';
import 'package:motrive/features/add_vehicle/presentation/widgets/vehicle_field.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/entities/cars_info_entity.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/presentation/pages/cars_info_feature_widget.dart';
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/presentation/pages/scan_vehicle_feature_widget.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';

class AddVehicleFeatureScreen extends HookWidget {
  final UserVehicleEntity? vehicle;
  const AddVehicleFeatureScreen({super.key, this.vehicle});

  void dialog(
    Function(CarsInfoEntity vehicle) onSave,
    BuildContext context,
  ) async {
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
              child: const CarsInfoFeatureWidget(),
            ),
          ),
        );
      },
    ).then((vehicle) {
      if (vehicle is CarsInfoEntity) {
        onSave(vehicle);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddVehicleCubit>();
    final formKey = GlobalKey<FormState>();
    String? carInfoId;

    final makeController = useTextEditingController(text: vehicle?.make);
    final modelController = useTextEditingController(text: vehicle?.model);
    final yearController = useTextEditingController(
      text: vehicle?.year.toString(),
    );
    final vinController = useTextEditingController(text: vehicle?.vin);
    final licensePlateController = useTextEditingController(
      text: vehicle?.licensePlate,
    );
    final colorController = useTextEditingController(text: vehicle?.color);
    final odometerController = useTextEditingController();
    final dragController = useDraggableScrollableController();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (vehicle == null) {
          dialog((vehicle) {
            makeController.text = vehicle.make;
            modelController.text = vehicle.model;
            yearController.text = vehicle.year.toString();
            carInfoId = vehicle.id;
          }, context);
        }
      });
      return () {};
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Info'),
        actions: [
          if (vehicle != null)
            IconButton(
              onPressed: () async =>
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(
                        'You are about to delete you car permanently!',
                      ),
                      title: Text('Car Deletion'),
                      actions: [
                        TextButton(
                          onPressed: () => context.pop(),
                          child: Text('Cancel'),
                        ),
                        FilledButton(
                          onPressed: () => context.pop(true),
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  ).then((value) {
                    if (value == true) {
                      cubit.deleteVehicle(vehicle!);
                    }
                  }),
              icon: Icon(Icons.delete_outline_outlined),
            ),
        ],
      ),
      body: BlocConsumer<AddVehicleCubit, AddVehicleState>(
        listener: (context, state) async {
          if (state is AddVehicleInitialState) {
            dragController.animateTo(
              state.isScanning == true ? 0.45 : 1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
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
                initialChildSize:
                    state is AddVehicleInitialState && state.isScanning == true
                    ? 0.45
                    : 1,
                controller: dragController,
                minChildSize: 0.45,
                maxChildSize: 1,
                snap: true,
                snapSizes: [0.45, 0.5, 1],
                snapAnimationDuration: Duration(seconds: 1),
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
                        
                          const Gap(8),
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
                              icon: Icon(Icons.camera_alt_outlined),
                            ),
                            icon: Icons.confirmation_number_outlined,
                            validator: (value) {
                              if (value!.isNotEmpty &&
                                  value.trim().length != 17) {
                                return 'VIN must be exactly 17 characters';
                              }
                              return null;
                            },
                          ),

                          const Gap(16),

                          VehicleField(
                            controller: makeController,
                            label: 'Make',
                            readOnly: vehicle != null,
                            validator: Validators.validateRequired,
                            icon: Icons.car_rental_outlined,
                          ),
                          const Gap(16),

                          VehicleField(
                            controller: modelController,
                            label: 'Model',
                            readOnly: vehicle != null,
                            validator: Validators.validateRequired,
                            icon: Icons.car_rental_outlined,
                          ),
                          const Gap(16),

                          VehicleField(
                            controller: yearController,
                            label: 'Year',
                            readOnly: vehicle != null,
                            icon: Icons.calendar_month_outlined,
                            validator: Validators.validateRequired,
                            keyboardType: TextInputType.number,
                          ),
                          const Gap(16),

                          if (vehicle == null)
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
                                  newVehicle = UserVehicleEntity(
                                    carInfoId: vehicle?.carInfoId ?? carInfoId,
                                    make: makeController.text,
                                    model: modelController.text,
                                    year:
                                        int.tryParse(yearController.text) ?? 0,
                                    color: colorController.text,
                                    licensePlate: licensePlateController.text,
                                    vin: vinController.text,
                                    id: vehicle?.id,
                                    currentOdometer:
                                        int.tryParse(odometerController.text) ??
                                        0,
                                  );
                                  vehicle == null
                                      ? cubit.getAddVehicleMethod(newVehicle)
                                      : vehicle != newVehicle
                                      ? cubit.updateVehicle(newVehicle)
                                      : context.showSnackBar(
                                          'No data changes',
                                          isError: true,
                                        );
                                }
                              },
                              icon: const Icon(Icons.save_outlined),
                              label: Text(
                                vehicle == null
                                    ? 'Save Vehicle'
                                    : 'Update Vehicle',
                              ),
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
