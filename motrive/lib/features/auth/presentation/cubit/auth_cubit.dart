import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:motrive/features/auth/presentation/cubit/auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;

  AuthCubit(this._authUseCase) : super(AuthInitialState(isLogin: true));

  Future<void> googleSignIn() async {
    emit(AuthLoadingState());
    final result = await _authUseCase.googleSignIn();
    result.when(
      (success) {
        emit(AuthGoogleSuccessState());
      },
      (whenError) {
        emit(AuthErrorState(message: whenError.message));
      },
    );
  }

  Future<void> emailSignIn({
    required String email,
    required String name,
  }) async {
    emit(AuthLoadingState());
    final result = await _authUseCase.emailSignIn(email: email, name: name);
    result.when(
      (success) {
        emit(AuthEmailSuccessState(email: email, name: name));
      },
      (whenError) {
        emit(AuthErrorState(message: whenError.message));
      },
    );
  }

  Future<void> emailVerify({required String email, required String otp}) async {
    emit(AuthLoadingState());
    final result = await _authUseCase.emailVerify(email: email, otp: otp);
    result.when(
      (success) {
        emit(AuthGoogleSuccessState());
      },
      (whenError) {
        emit(AuthErrorState(message: whenError.message));
      },
    );
  }

  void toggleSignIn() {
    emit(AuthInitialState(isLogin: !(state.isLogin ?? true)));
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
