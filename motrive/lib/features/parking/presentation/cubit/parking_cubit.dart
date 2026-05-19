import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/parking/domain/use_cases/parking_use_case.dart';
import 'package:motrive/features/parking/presentation/cubit/parking_state.dart';

class ParkingCubit extends Cubit<ParkingState> {
  final ParkingUseCase _parkingUseCase;

  ParkingCubit(this._parkingUseCase) : super(ParkingInitialState()) {
    getParkingMethod();
    startAutoParkingMethod();
  }

  Future<void> getParkingMethod() async {
    emit(ParkingLoadingState());

    final result = await _parkingUseCase.getParking();

    result.when(
      (success) {
        emit(ParkingSuccessState(parking: success));
      },
      (whenError) {
        emit(ParkingErrorState(message: whenError.message));
      },
    );
  }

  Future<void> saveParkingLocationMethod() async {
    emit(ParkingLoadingState());

    final result = await _parkingUseCase.saveParkingLocation();

    result.when(
      (success) async {
        emit(
          const ParkingActionSuccessState(message: 'Parking location saved'),
        );

        await getParkingMethod();
      },
      (whenError) {
        emit(ParkingErrorState(message: whenError.message));
      },
    );
  }

  Future<void> startAutoParkingMethod() async {
    final result = await _parkingUseCase.startAutoParking();

    result.when(
      (success) {
        emit(const ParkingActionSuccessState(message: 'Auto parking started'));
      },
      (whenError) {
        emit(ParkingErrorState(message: whenError.message));
      },
    );
  }

  Future<void> manualSaveParkingMethod() async {
    emit(ParkingLoadingState());

    final result = await _parkingUseCase.manualSaveParking();

    result.when(
      (success) async {
        emit(
          const ParkingActionSuccessState(message: 'Parking saved manually'),
        );

        await getParkingMethod();
      },
      (whenError) {
        emit(ParkingErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
