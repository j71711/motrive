import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:motrive/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase _profileUseCase;

  ProfileCubit(this._profileUseCase) : super(ProfileInitialState()){
    getProfileMethod() ;
  }

  Future<void> getProfileMethod() async {
    final result = await _profileUseCase.getProfile();
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
