import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/profile/sub/emergency_contact/domain/use_cases/emergency_contact_use_case.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_state.dart';

class EmergencyContactCubit extends Cubit<EmergencyContactState> {
  final EmergencyContactUseCase useCase;

  EmergencyContactCubit(this.useCase)
      : super(EmergencyContactInitialState());

  Future<void> getEmergencyContactMethod() async {
    emit(EmergencyContactLoadingState());

    final result = await useCase.getEmergencyContact();

    result.when(
      (success) {
        emit(EmergencyContactSuccessState(success));
      },
      (error) {
        emit(EmergencyContactErrorState(error.message));
      },
    );
  }

  Future<void> addEmergencyContactMethod({
    required String name,
    required String email,
    required String relation,
    required bool notifyEmergency,
  }) async {
    emit(EmergencyContactLoadingState());

    final result = await useCase.addEmergencyContact(
      name: name,
      email: email,
      relation: relation,
      notifyEmergency: notifyEmergency,
    );

    result.when(
      (success) async {
        emit(EmergencyContactActionSuccessState());
        await getEmergencyContactMethod();
      },
      (error) {
        emit(EmergencyContactErrorState(error.message));
      },
    );
  }

  Future<void> updateEmergencyContactMethod({
    required String id,
    required String name,
    required String email,
    required String relation,
    required bool notifyEmergency,
  }) async {
    emit(EmergencyContactLoadingState());

    final result = await useCase.updateEmergencyContact(
      id: id,
      name: name,
      email: email,
      relation: relation,
      notifyEmergency: notifyEmergency,
    );

    result.when(
      (success) async {
        emit(EmergencyContactActionSuccessState());
        await getEmergencyContactMethod();
      },
      (error) {
        emit(EmergencyContactErrorState(error.message));
      },
    );
  }

  Future<void> deleteEmergencyContactMethod({
    required String id,
  }) async {
    emit(EmergencyContactLoadingState());

    final result = await useCase.deleteEmergencyContact(id: id);

    result.when(
      (success) async {
        emit(EmergencyContactActionSuccessState());
        await getEmergencyContactMethod();
      },
      (error) {
        emit(EmergencyContactErrorState(error.message));
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}