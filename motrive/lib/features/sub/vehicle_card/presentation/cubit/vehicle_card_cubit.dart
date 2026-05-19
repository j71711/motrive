import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:motrive/features/sub/vehicle_card/domain/use_cases/vehicle_card_use_case.dart';
import 'package:motrive/features/sub/vehicle_card/presentation/cubit/vehicle_card_state.dart';

class VehicleCardCubit extends Cubit<VehicleCardState> {
  final VehicleCardUseCase _vehicleCardUseCase;

  VehicleCardCubit(this._vehicleCardUseCase)
    : super(VehicleCardInitialState()) {
    getVehicleCardMethod();
  }

  Future<void> getVehicleCardMethod() async {
    emit(VehicleCardInitialState());
    final result = await _vehicleCardUseCase.getVehicleCard();
    result.when(
      (success) {
        emit(VehicleCardSuccessState(vehicle: success, isExpanded: false));
      },
      (whenError) {
        emit(VehicleCardErrorState(message: whenError.message));
      },
    );
  }

  Future<void> deleteVehicle(UserVehicleEntity vehicle) async {
    emit(VehicleCardInitialState());
    final result = await _vehicleCardUseCase.getVehicleCard();
    result.when(
      (success) {
        emit(VehicleCardSuccessState(vehicle: success, isExpanded: false));
      },
      (whenError) {
        emit(VehicleCardErrorState(message: whenError.message));
      },
    );
  }

  void expandInfo({
    required UserVehicleEntity vehicle,
    required bool isExpanded,
  }) {
    emit(VehicleCardSuccessState(vehicle: vehicle, isExpanded: isExpanded));
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
