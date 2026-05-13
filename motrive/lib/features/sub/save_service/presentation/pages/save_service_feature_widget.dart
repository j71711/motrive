import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/sub/save_service/presentation/cubit/save_service_cubit.dart';
import 'package:motrive/features/sub/save_service/presentation/cubit/save_service_state.dart';
import 'package:motrive/features/sub/save_service/presentation/pages/save_dialog.dart';

class SaveServiceFeatureWidget extends StatelessWidget {
  final VehicleEntity vehicle;
  final ServiceInfoEntity serviceInfo;
  final Widget? widget;
  final Function()? onSuccess;
  const SaveServiceFeatureWidget({
    super.key,
    this.widget,
    required this.vehicle,
    required this.serviceInfo,
    this.onSuccess,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveServiceCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<SaveServiceCubit>();
          return BlocListener<SaveServiceCubit, SaveServiceState>(
            listener: (context, state) {
              context.hideLoading();
              switch (state) {
                case SaveServiceErrorState _:
                  context.showSnackBar(state.message, isError: true);
                case SaveServiceLoadingState _:
                  context.showLoading();
                case SaveServiceSuccessState _:
                  context.pop();
                  if (onSuccess != null) {
                    onSuccess!();
                  }
              }
            },
            child: GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    contentPadding: .all(24),
                    children: [
                      SaveDialog(
                        lastOdometer: vehicle.currentOdometer ?? 0,
                        onSave: (info) {
                          cubit.getSaveService(
                            carId: vehicle.id,
                            serviceInfo: serviceInfo,
                            maintenanceSaveInfo: info,
                          );
                          context.showLoading();
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Center(child: widget),
            ),
          );
        },
      ),
    );
  }
}
