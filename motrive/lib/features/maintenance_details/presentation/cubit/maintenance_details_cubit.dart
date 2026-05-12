import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/maintenance_details/domain/use_cases/maintenance_details_use_case.dart';
import 'package:motrive/features/maintenance_details/presentation/cubit/maintenance_details_state.dart';

class MaintenanceDetailsCubit extends Cubit<MaintenanceDetailsState> {
  final MaintenanceDetailsUseCase _maintenanceDetailsUseCase;

  MaintenanceDetailsCubit(this._maintenanceDetailsUseCase) : super(MaintenanceDetailsInitialState());

  Future<void> getMaintenanceDetailsMethod() async {
    final result = await _maintenanceDetailsUseCase.getMaintenanceDetails();
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
