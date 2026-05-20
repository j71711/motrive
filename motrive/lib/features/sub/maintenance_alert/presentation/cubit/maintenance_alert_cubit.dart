import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/sub/maintenance_alert/domain/use_cases/maintenance_alert_use_case.dart';
import 'package:motrive/features/sub/maintenance_alert/presentation/cubit/maintenance_alert_state.dart';

class MaintenanceAlertCubit extends Cubit<MaintenanceAlertState> {
  final MaintenanceAlertUseCase _maintenanceAlertUseCase;

  MaintenanceAlertCubit(this._maintenanceAlertUseCase)
    : super(MaintenanceAlertInitialState()) {
    getMaintenanceAlertMethod();
  }

  Future<void> getMaintenanceAlertMethod() async {
    emit(MaintenanceAlertInitialState());
    _maintenanceAlertUseCase.getMaintenanceAlert().listen((event) async {
      await event.when(
        (success) {
          emit(MaintenanceAlertSuccessState(maintenance: success));
        },
        (whenError) {
          emit(MaintenanceAlertErrorState(message: whenError.message));
        },
      );
    });
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
