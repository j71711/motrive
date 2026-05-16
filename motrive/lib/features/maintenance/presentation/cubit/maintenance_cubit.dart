import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/maintenance/domain/use_cases/maintenance_use_case.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_state.dart';

class MaintenanceCubit extends Cubit<MaintenanceState> {
  final MaintenanceUseCase _maintenanceUseCase;

  MaintenanceCubit(this._maintenanceUseCase)
    : super(MaintenanceInitialState()) {
    getMaintenanceMethod();
  }

  Future<void> getMaintenanceMethod() async {
    emit(MaintenanceLoadingState());
    final result = await _maintenanceUseCase.getMaintenance();
    result.when(
      (success) {
        emit(MaintenanceSuccessState(maintenanceEntity: success));
      },
      (whenError) {
        emit(MaintenanceErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
