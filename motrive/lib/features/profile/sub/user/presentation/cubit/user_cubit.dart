import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/profile/sub/user/domain/use_cases/user_use_case.dart';
import 'package:motrive/features/profile/sub/user/presentation/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserUseCase _userUseCase;

  UserCubit(this._userUseCase) : super(UserInitialState()) {
    getUserMethod();
  }

  Future<void> getUserMethod() async {
    emit(UserLoadingState());

    final result = await _userUseCase.getUser();

    result.when(
      (success) {
        emit(UserSuccessState(user: success));
      },
      (whenError) {
        emit(UserErrorState(message: whenError.message));
      },
    );
  }

  Future<void> updateUserMethod({
  required String fullName,
  required String phone,
  required String gender,
  DateTime? dateOfBirth,
}) async {
  emit(UserLoadingState());

  final result = await _userUseCase.updateUser(
    fullName: fullName,
    phone: phone,
    gender: gender,
    dateOfBirth: dateOfBirth,
  );

  result.when(
    (success) {
      emit(UserSuccessState(user: success));
    },
    (error) {
      emit(UserErrorState(message: error.message));
    },
  );
}

}
