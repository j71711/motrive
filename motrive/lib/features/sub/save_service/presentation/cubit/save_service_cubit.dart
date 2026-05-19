import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_save_info.dart';
import 'package:motrive/features/sub/save_service/domain/use_cases/save_service_use_case.dart';
import 'package:motrive/features/sub/save_service/presentation/cubit/save_service_state.dart';

class SaveServiceCubit extends Cubit<SaveServiceState> {
  final SaveServiceUseCase _saveServiceUseCase;

  SaveServiceCubit(this._saveServiceUseCase) : super(SaveServiceInitialState());

  Future<void> getSaveService({
    required ServiceInfoEntity serviceInfo,
    required MaintenanceSaveInfo maintenanceSaveInfo,
    required UserVehicleEntity vehicle,
  }) async {
    emit(SaveServiceLoadingState());
    final result = await _saveServiceUseCase.getSaveService(
      serviceInfo,
      maintenanceSaveInfo,
      vehicle,
    );
    result.when(
      (success) {
        emit(SaveServiceSuccessState());
      },
      (whenError) {
        emit(SaveServiceErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
