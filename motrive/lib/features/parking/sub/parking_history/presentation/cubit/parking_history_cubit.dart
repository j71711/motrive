import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/parking/sub/parking_history/domain/use_cases/parking_history_use_case.dart';
import 'package:motrive/features/parking/sub/parking_history/presentation/cubit/parking_history_state.dart';

class ParkingHistoryCubit extends Cubit<ParkingHistoryState> {
  final ParkingHistoryUseCase _parkingHistoryUseCase;

  ParkingHistoryCubit(this._parkingHistoryUseCase)
    : super(ParkingHistoryInitialState());
  Future<void> getParkingHistoryMethod() async {
    emit(ParkingHistoryLoadingState());

    final result = await _parkingHistoryUseCase.getParkingHistory();

    result.when(
      (success) {
        emit(ParkingHistorySuccessState(parkings: success));
      },
      (error) {
        emit(ParkingHistoryErrorState(message: error.message));
      },
    );
  }
}
