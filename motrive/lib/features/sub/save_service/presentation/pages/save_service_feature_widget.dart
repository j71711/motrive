import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:motrive/features/sub/save_service/presentation/cubit/save_service_cubit.dart';
import 'package:motrive/features/sub/save_service/presentation/cubit/save_service_state.dart';
import 'package:motrive/features/sub/save_service/presentation/widgets/save_dialog.dart';

class SaveServiceFeatureWidget extends StatelessWidget {
  final UserVehicleEntity? vehicle;
  final ServiceInfoEntity serviceInfo;
  const SaveServiceFeatureWidget({
    super.key,
    this.vehicle,
    required this.serviceInfo,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveServiceCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<SaveServiceCubit>();
          return BlocListener<SaveServiceCubit, SaveServiceState>(
            listener: (context, state) async {
              context.hideLoading();
              switch (state) {
                case SaveServiceErrorState _:
                  context.showSnackBar(state.message, isError: true);
                case SaveServiceLoadingState _:
                  context.showLoading();
                case SaveServiceSuccessState _:
                  context.pop(true);
              }
            },
            child: SimpleDialog(
              contentPadding: .all(24),
              children: [
                SaveDialog(
                  lastOdometer: vehicle!.currentOdometer ?? 0,
                  onSave: (info) {
                    cubit.getSaveService(
                      carId: vehicle!.id,
                      serviceInfo: serviceInfo,
                      maintenanceSaveInfo: info,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
