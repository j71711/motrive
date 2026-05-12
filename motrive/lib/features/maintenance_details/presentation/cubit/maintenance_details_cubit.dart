import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_details_entity.dart';
import 'package:motrive/features/maintenance_details/domain/entities/service_part_info_entity.dart';
import 'package:motrive/features/maintenance_details/domain/use_cases/maintenance_details_use_case.dart';
import 'package:motrive/features/maintenance_details/presentation/cubit/maintenance_details_state.dart';

class MaintenanceDetailsCubit extends Cubit<MaintenanceDetailsState> {
  final MaintenanceDetailsUseCase _maintenanceDetailsUseCase;

  MaintenanceDetailsCubit(this._maintenanceDetailsUseCase)
    : super(MaintenanceDetailsInitialState());

  final List<ServicePartInfoEntity> selectedParts = [];

  Future<void> getMaintenanceDetailsMethod(String serviceId) async {
    final result = await _maintenanceDetailsUseCase.getMaintenanceDetails(
      serviceId,
    );
    result.when(
      (success) {
        emit(MaintenanceDetailsSuccessState(maintenanceDetails: success));
      },
      (whenError) {
        emit(MaintenanceDetailsErrorState(message: whenError.message));
      },
    );
  }

  void togglePart(
    MaintenanceDetailsEntity maintenanceDetails,
    int index,
    bool value,
  ) {
    final id = maintenanceDetails.id;
    List<ServicePartInfoEntity> toSelectedParts = maintenanceDetails.parts;
    toSelectedParts[index] = toSelectedParts[index].copyWith(done: value);
    print(selectedParts[index].done);
    emit(
      MaintenanceDetailsSuccessState(
        maintenanceDetails: MaintenanceDetailsEntity(
          id: id,
          parts: toSelectedParts,
        ),
      ),
    );
  }

  void selectAll(MaintenanceDetailsEntity maintenanceDetails, bool value) {
    List<ServicePartInfoEntity> toSelectedParts = maintenanceDetails.parts;
    final id = maintenanceDetails.id;
    toSelectedParts = toSelectedParts
        .map((e) => e.copyWith(done: value))
        .toList();
    emit(
      MaintenanceDetailsSuccessState(
        maintenanceDetails: MaintenanceDetailsEntity(
          id: id,
          parts: toSelectedParts,
        ),
        selectedAll: value,
      ),
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
