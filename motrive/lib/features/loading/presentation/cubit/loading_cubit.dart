import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/loading/domain/use_cases/loading_use_case.dart';
import 'package:motrive/features/loading/presentation/cubit/loading_state.dart' ;

class LoadingCubit extends Cubit<LoadingState> {
  final LoadingUseCase _loadingUseCase;

  LoadingCubit(this._loadingUseCase) : super(LoadingInitialState()) {
    getLoadingMethod();
  }

  Future<void> getLoadingMethod() async {
    final result = await _loadingUseCase.getLoading();
    result.when(
      (success) {
        emit(LoadingSuccessState(isLogin: success.isLogin));
      },
      (whenError) {
        emit(LoadingErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
