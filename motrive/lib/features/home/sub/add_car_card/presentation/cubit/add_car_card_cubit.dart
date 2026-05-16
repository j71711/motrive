import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/use_cases/add_car_card_use_case.dart';
import 'package:motrive/features/home/sub/add_car_card/presentation/cubit/add_car_card_state.dart';

class AddCarCardCubit extends Cubit<AddCarCardState> {
  final AddCarCardUseCase _addCarCardUseCase;

  AddCarCardCubit(this._addCarCardUseCase) : super(AddCarCardInitialState()){

    getAddCarCardMethod();

    // getAddCarCardMethod();

    // getCarsInfo();
  }
  Future<void> addVehicleMethod(
  AddCarCardEntity vehicle,
) async {
  emit(VehiclesLoadingState());
  final result = await _addCarCardUseCase.addVehicle(vehicle);
  
  result.when(
    (success) async {
      await getAddCarCardMethod();
    },
    (error) {
      emit(AddCarCardErrorState(error.message));
    },
  );
}

  Future<void> getAddCarCardMethod() async {
    emit(VehiclesLoadingState());
final result = await _addCarCardUseCase.getVehicles();
    result.when(
      (success) {
        vehicles = success;
        merge();
        emit(AddCarCardLoadedState(success));
      },
      (whenError) {
      emit(AddCarCardErrorState(whenError.message));
      },
    );  
  }

List<BaseCarEntity> allCars = [];
List<AddCarCardEntity> vehicles = [];
List<CarInfoEntity> carsInfo = [];

void merge() {
  allCars = [
    ...vehicles,
    ...carsInfo,
  ];
}


Future deleteVehicle(String id) async {
  final result = await _addCarCardUseCase.deleteVehicle(id);

  result.when(
    (success) async {
      await getAddCarCardMethod(); 
    },
    (error) {
      emit(AddCarCardErrorState(error.message));
    },
  );
}

void search(String query) {
  final q = query.toLowerCase();
  final filtered = allCars.where((car) {
    return (car.make ?? '').toLowerCase().contains(q) ||
    (car.model ?? '').toLowerCase().contains(q);
  }).toList();

  emit(SearchResultState(filtered));
}

Future<void> getCarsInfo() async {
  emit(CarsInfoLoadingState());

  final result = await _addCarCardUseCase.getCarsInfo();

  result.when(
    (success) {
      carsInfo =success;
      merge();
      emit(CarInfoLoadedState(success));
    },
    (error) {
      emit(AddCarCardErrorState(error.message));
    },
  );
}

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
