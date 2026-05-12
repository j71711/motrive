import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/profile/sub/sign_out/domain/use_cases/sign_out_use_case.dart';
import 'package:motrive/features/profile/sub/sign_out/presentation/cubit/sign_out_state.dart';


class SignOutCubit extends Cubit<SignOutState> {
  final SignOutUseCase _signOutUseCase;

  SignOutCubit(this._signOutUseCase) : super(SignOutInitialState());

  Future<void> getSignOutMethod() async {
    emit(SignOutLoadingState());
    final result = await _signOutUseCase.getSignOut();
    result.when(
      (success) {
        emit(SignOutSuccessState());
      },
      (whenError) {
        emit(SignOutErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
