import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/home0/domain/use_cases/home0_use_case.dart';
import 'package:motrive/features/home0/presentation/cubit/home0_state.dart';

class Home0Cubit extends Cubit<Home0State> {
  final Home0UseCase _home0UseCase;

  Home0Cubit(this._home0UseCase) : super(Home0InitialState());

  Future<void> getHome0Method() async {
    final result = await _home0UseCase.getHome0();
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
