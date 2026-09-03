import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/core/services/emergency_service.dart';
import 'package:motrive/features/home/sub/sos/presentation/cubit/sos_state.dart';

class SosCubit extends Cubit<SosState> {
  final EmergencyService emergencyService;

  SosCubit(this.emergencyService) : super(SosInitialState());

  Future<void> sendSosEmailMethod() async {
    emit(SosLoadingState());

    try {
      await emergencyService.sendSosAlert();

      emit(SosSendEmailSuccessState());
    } catch (error) {
      emit(SosErrorState(message: error.toString()));
    }
  }

  Future<void> callPoliceMethod() async {
    await emergencyService.callPolice();
  }

  Future<void> callAmbulanceMethod() async {
    await emergencyService.callAmbulance();
  }
}