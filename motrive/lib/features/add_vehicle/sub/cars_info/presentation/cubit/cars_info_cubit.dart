import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/entities/cars_info_entity.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/use_cases/cars_info_use_case.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/presentation/cubit/cars_info_state.dart';

class CarsInfoCubit extends Cubit<CarsInfoState> {
  final CarsInfoUseCase _carsInfoUseCase;

  CarsInfoCubit(this._carsInfoUseCase) : super(CarsInfoInitialState()) {
    getCarsInfoMethod();
  }

  List<CarsInfoEntity> carsInfo = [];

  Future<void> getCarsInfoMethod() async {
    emit(CarsInfoLoadingState());
    final result = await _carsInfoUseCase.getCarsInfo();
    result.when(
      (success) {
        carsInfo = success;
        emit(CarsInfoSuccessState(cars: success));
      },
      (whenError) {
        emit(CarsInfoErrorState(message: whenError.message));
      },
    );
  }

  void search(String query) {
    final q = query.toLowerCase();
    final filtered = carsInfo.where((car) {
      return (car.make).toLowerCase().contains(q) ||
          (car.model).toLowerCase().contains(q);
    }).toList();
    emit(CarsInfoSuccessState(cars: filtered));
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
