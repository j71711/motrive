import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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

  const AddVehicleFeatureScreen({
    super.key,
    this.vehicle,
  });

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
            elevation: 0,
            color: const Color(0xffF5F5F7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            margin: const EdgeInsets.all(20),
            child: Container(
              width: screenSize.width * 0.88,
              height: screenSize.height * 0.62,
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

    final makeController = useTextEditingController(
      text: vehicle?.make,
    );

    final modelController = useTextEditingController(
      text: vehicle?.model,
    );

    final yearController = useTextEditingController(
      text: vehicle?.year.toString(),
    );

    final vinController = useTextEditingController(
      text: vehicle?.vin,
    );

    final licensePlateController =
        useTextEditingController(
          text: vehicle?.licensePlate,
        );

    final colorController = useTextEditingController(
      text: vehicle?.color,
    );

    final odometerController =
        useTextEditingController();

    final dragController =
        useDraggableScrollableController();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        dialog((vehicle) {
          makeController.text = vehicle.make;
          modelController.text = vehicle.model;
          yearController.text = vehicle.year.toString();

          carInfoId = vehicle.id;
        }, context);
      });

      return () {};
    }, []);

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F7),

      body: BlocConsumer<
        AddVehicleCubit,
        AddVehicleState
      >(
        listener: (context, state) async {
          if (state is AddVehicleInitialState) {
            dragController.animateTo(
              state.isScanning == true
                  ? 0.45
                  : 0.92,

              duration: const Duration(
                milliseconds: 400,
              ),

              curve: Curves.easeInOut,
            );
          }

          if (state is AddVehicleSuccessState &&
              context.mounted) {
            context.pop(true);
          }
        },

        builder: (context, state) {
          final isScanning =
              state is AddVehicleInitialState &&
              state.isScanning == true;

          return Stack(
            children: [
              Container(
                height: 260,
                width: double.infinity,

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffA020F0),
                      Color(0xffC56CF0),
                    ],
                  ),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),

                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            InkWell(
                              borderRadius:
                                  BorderRadius.circular(
                                    100,
                                  ),

                              onTap: () {
                                context.pop();
                              },

                              child: Container(
                                height: 48,
                                width: 48,

                                decoration: BoxDecoration(
                                  color: Colors.white
                                      .withValues(
                                        alpha: .16,
                                      ),

                                  shape: BoxShape.circle,
                                ),

                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        Text(
                          vehicle == null
                              ? 'Add Vehicle'
                              : 'Edit Vehicle',

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        const Gap(10),

                        Text(
                          'Manage your vehicle information',

                          style: TextStyle(
                            color: Colors.white
                                .withValues(alpha: .82),

                            fontSize: 16,
                          ),
                        ),

                        const Gap(18),
                      ],
                    ),
                  ),
                ),
              ),

              if (isScanning)
                Positioned(
                  top: 180,
                  left: 20,
                  right: 20,

                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(28),

                    child: SizedBox(
                      height:
                          MediaQuery.of(context)
                              .size
                              .height *
                          .30,

                      child: ScanVehicleFeatureWidget(
                        onScanned: (vehicle) {
                          makeController.text =
                              vehicle.make ?? '';

                          modelController.text =
                              vehicle.model ?? '';

                          yearController.text =
                              vehicle.year.toString();

                          vinController.text =
                              vehicle.vin ?? '';

                          licensePlateController
                                  .text =
                              vehicle
                                      .licensePlate ??
                                  '';

                          colorController.text =
                              vehicle.color ?? '';
                        },
                      ),
                    ),
                  ),
                ),

              DraggableScrollableSheet(
                initialChildSize:
                    isScanning ? 0.50 : 0.84,

                minChildSize: 0.50,

                maxChildSize: 0.92,

                controller: dragController,

                builder: (
                  context,
                  scrollController,
                ) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF5F5F7),

                      borderRadius:
                          BorderRadius.vertical(
                            top: Radius.circular(
                              34,
                            ),
                          ),
                    ),

                    child: Form(
                      key: formKey,

                      autovalidateMode:
                          AutovalidateMode
                              .onUserInteraction,

                      child: ListView(
                        controller: scrollController,

                        padding:
                            const EdgeInsets.all(
                              24,
                            ),

                        children: [
                          Center(
                            child: Container(
                              width: 50,
                              height: 5,

                              decoration: BoxDecoration(
                                color:
                                    Colors.grey.shade300,

                                borderRadius:
                                    BorderRadius.circular(
                                      100,
                                    ),
                              ),
                            ),
                          ),

                          const Gap(28),

                          Container(
                            padding:
                                const EdgeInsets.all(
                                  20,
                                ),

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius:
                                  BorderRadius.circular(
                                    30,
                                  ),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withValues(
                                        alpha: .04,
                                      ),

                                  blurRadius: 20,

                                  offset: const Offset(
                                    0,
                                    8,
                                  ),
                                ),
                              ],
                            ),

                            child: Row(
                              children: [
                                Container(
                                  height: 62,
                                  width: 62,

                                  decoration:
                                      BoxDecoration(
                                        color: const Color(
                                          0xffA020F0,
                                        ).withValues(
                                          alpha: .10,
                                        ),

                                        borderRadius:
                                            BorderRadius.circular(
                                              20,
                                            ),
                                      ),

                                  child: const Icon(
                                    Icons
                                        .directions_car_filled_rounded,

                                    color: Color(
                                      0xffA020F0,
                                    ),

                                    size: 30,
                                  ),
                                ),

                                const Gap(16),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,

                                    children: [
                                      Text(
                                        '${makeController.text.isEmpty ? 'Your Vehicle' : makeController.text} ${modelController.text}',

                                        style:
                                            const TextStyle(
                                              fontSize:
                                                  20,

                                              fontWeight:
                                                  FontWeight
                                                      .w700,
                                            ),
                                      ),

                                      const Gap(6),

                                      Text(
                                        yearController
                                                .text
                                                .isEmpty
                                            ? 'Vehicle Information'
                                            : yearController
                                                .text,

                                        style: TextStyle(
                                          color: Colors
                                              .grey
                                              .shade600,

                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Gap(30),

                          VehicleField(
                            controller:
                                vinController,

                            label: 'VIN',

                            icon: Icons
                                .confirmation_number_outlined,

                            maxLength: 17,

                            suffix: IconButton(
                              onPressed: () {
                                cubit.toggleCamera(
                                  isScanning
                                      ? false
                                      : true,
                                );
                              },

                              icon: const Icon(
                                Icons
                                    .camera_alt_outlined,
                              ),
                            ),

                            validator: (value) {
                              if (value!
                                      .isNotEmpty &&
                                  value
                                          .trim()
                                          .length !=
                                      17) {
                                return 'VIN must be 17 characters';
                              }

                              return null;
                            },
                          ),

                          const Gap(18),

                          VehicleField(
                            controller:
                                makeController,

                            label: 'Make',

                            icon: Icons
                                .car_rental_outlined,

                            validator:
                                Validators
                                    .validateRequired,
                          ),

                          const Gap(18),

                          VehicleField(
                            controller:
                                modelController,

                            label: 'Model',

                            icon: Icons
                                .directions_car_outlined,

                            validator:
                                Validators
                                    .validateRequired,
                          ),

                          const Gap(18),

                          VehicleField(
                            controller:
                                yearController,

                            label: 'Year',

                            icon: Icons
                                .calendar_month_outlined,

                            keyboardType:
                                TextInputType
                                    .number,

                            validator:
                                Validators
                                    .validateRequired,
                          ),

                          const Gap(18),

                          if (vehicle == null)
                            Column(
                              children: [
                                VehicleField(
                                  controller:
                                      odometerController,

                                  label:
                                      'Current Odometer',

                                  icon:
                                      Icons.speed,

                                  keyboardType:
                                      TextInputType
                                          .number,

                                  validator:
                                      Validators
                                          .validateRequired,
                                ),

                                const Gap(18),
                              ],
                            ),

                          VehicleField(
                            controller:
                                colorController,

                            label: 'Color',

                            icon: Icons
                                .color_lens_outlined,
                          ),

                          const Gap(18),

                          VehicleField(
                            controller:
                                licensePlateController,

                            label:
                                'License Plate',

                            icon:
                                Icons.pin_outlined,
                          ),

                          const Gap(34),

                          SizedBox(
                            height: 58,

                            child: FilledButton(
                              style:
                                  FilledButton.styleFrom(
                                    backgroundColor:
                                        const Color(
                                          0xffA020F0,
                                        ),

                                    shape:
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(
                                                22,
                                              ),
                                        ),
                                  ),

                              onPressed: () {
                                if (formKey
                                    .currentState!
                                    .validate()) {
                                  final newVehicle =
                                      UserVehicleEntity(
                                        carInfoId:
                                            carInfoId,

                                        make:
                                            makeController
                                                .text,

                                        model:
                                            modelController
                                                .text,

                                        year:
                                            int.tryParse(
                                              yearController
                                                  .text,
                                            ) ??
                                            0,

                                        color:
                                            colorController
                                                .text,

                                        licensePlate:
                                            licensePlateController
                                                .text,

                                        vin:
                                            vinController
                                                .text,
                                      );

                                  vehicle ==
                                          null
                                      ? cubit
                                            .getAddVehicleMethod(
                                              newVehicle,
                                            )
                                      : cubit
                                            .updateVehicle(
                                              newVehicle,
                                            );
                                }
                              },

                              child: Text(
                                vehicle == null
                                    ? 'Save Vehicle'
                                    : 'Update Vehicle',

                                style:
                                    const TextStyle(
                                      fontSize: 17,

                                      fontWeight:
                                          FontWeight
                                              .w700,
                                    ),
                              ),
                            ),
                          ),

                          const Gap(50),
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