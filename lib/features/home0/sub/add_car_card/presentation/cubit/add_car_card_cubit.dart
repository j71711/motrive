import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/use_cases/add_car_card_use_case.dart';
import 'package:motrive/features/home0/sub/add_car_card/presentation/cubit/add_car_card_state.dart';

class AddCarCardCubit extends Cubit<AddCarCardState> {
  final AddCarCardUseCase _addCarCardUseCase;

  AddCarCardCubit(this._addCarCardUseCase) : super(AddCarCardInitialState());

  Future<void> getAddCarCardMethod() async {
    final result = await _addCarCardUseCase.getAddCarCard();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
