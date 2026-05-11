import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/home/sub/sos/domain/use_cases/sos_use_case.dart';
import 'package:motrive/features/home/sub/sos/presentation/cubit/sos_state.dart';

class SosCubit extends Cubit<SosState> {
  final SosUseCase _sosUseCase;

  SosCubit(this._sosUseCase) : super(SosInitialState());

  Future<void> getSosMethod() async {
    final result = await _sosUseCase.getSos();
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
