import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/add_vehicle/domain/use_cases/add_vehicle_use_case.dart';
import 'package:motrive/features/add_vehicle/presentation/cubit/add_vehicle_state.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';

class AddVehicleCubit extends Cubit<AddVehicleState> {
  final AddVehicleUseCase _addVehicleUseCase;

  AddVehicleCubit(this._addVehicleUseCase) : super(AddVehicleInitialState());

  Future<void> getAddVehicleMethod(UserVehicleEntity vehicle) async {
    emit(AddVehicleInitialState(isLoading: true));
    final result = await _addVehicleUseCase.getAddVehicle(vehicle);
    result.when(
      (success) {
        emit(AddVehicleSuccessState());
      },
      (whenError) {
        emit(AddVehicleErrorState(message: whenError.message));
      },
    );
  }

  Future<void> updateVehicle(UserVehicleEntity vehicle) async {
    emit(AddVehicleInitialState(isLoading: true));
    final result = await _addVehicleUseCase.updateVehicle(vehicle);
    result.when(
      (success) {
        emit(AddVehicleSuccessState());
      },
      (whenError) {
        emit(AddVehicleErrorState(message: whenError.message));
      },
    );
  }

  Future<void> deleteVehicle(UserVehicleEntity vehicle) async {
    emit(AddVehicleInitialState(isLoading: true));
    final result = await _addVehicleUseCase.deleteVehicle(vehicle);
    result.when(
      (success) {
        emit(AddVehicleSuccessState());
      },
      (whenError) {
        emit(AddVehicleErrorState(message: whenError.message));
      },
    );
  }

  void toggleCamera(bool scanning) {
    emit(AddVehicleInitialState(isScanning: scanning));
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
