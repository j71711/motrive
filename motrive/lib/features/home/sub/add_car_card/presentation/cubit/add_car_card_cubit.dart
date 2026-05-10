import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/use_cases/add_car_card_use_case.dart';
import 'package:motrive/features/home/sub/add_car_card/presentation/cubit/add_car_card_state.dart';

class AddCarCardCubit extends Cubit<VehicleState> {
  final AddCarCardUseCase _addCarCardUseCase;

  AddCarCardCubit(this._addCarCardUseCase) : super(VehicleInitialState()){
    getAddCarCardMethod();
  }

  Future<void> getAddCarCardMethod() async { 
       emit(VehicleLoadingState());
final result = await _addCarCardUseCase.getVehicles();
    result.when(
      (success) {
        allVehicles = success;
        emit(VehicleLoadedState(success));
      },
      (whenError) {
      emit(VehicleErrorState(whenError.message));
      },
    );  
  }

  List<VehicleEntity> allVehicles = [];

Future deleteVehicle(String id) async {
  final result = await _addCarCardUseCase.deleteVehicle(id);

  result.when(
    (success) async {
      await getAddCarCardMethod(); 
    },
    (error) {
      emit(VehicleErrorState(error.message));
    },
  );
}

  void search(String query) {
    final filtered = allVehicles.where((vehicle) {
      return vehicle.make
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          vehicle.model
              .toLowerCase()
              .contains(query.toLowerCase()) ;
    }).toList();

    emit(VehicleLoadedState(filtered));
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
