import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/sub/last_odometer/domain/use_cases/last_odometer_use_case.dart';
import 'package:motrive/features/sub/last_odometer/presentation/cubit/last_odometer_state.dart';

class LastOdometerCubit extends Cubit<LastOdometerState> {
  final LastOdometerUseCase _lastOdometerUseCase;

  LastOdometerCubit(this._lastOdometerUseCase)
    : super(LastOdometerInitialState()) {
    getLastOdometerMethod();
  }

  Future<void> getLastOdometerMethod() async {
    _lastOdometerUseCase.getLastOdometer().listen((event) async {
      await event.when(
        (success) {
          emit(LastOdometerSuccessState(vehicle: success));
        },
        (whenError) {
          emit(LastOdometerErrorState(message: whenError.message));
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
