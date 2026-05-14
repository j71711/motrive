import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance/domain/use_cases/maintenance_use_case.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_state.dart';

class MaintenanceCubit extends Cubit<MaintenanceState> {
  final MaintenanceUseCase _maintenanceUseCase;

  MaintenanceCubit(this._maintenanceUseCase)
    : super(MaintenanceInitialState()) {
    getMaintenanceMethod(fromRemote: false);
  }

  List<ServiceInfoEntity> services = [];
  int page = 0;
  MaintenanceEntity? maintenanceEntity;
  List<ServiceInfoEntity> allServices = [];

  Future<void> getMaintenanceMethod({
    required bool fromRemote,
  }) async {
    emit(MaintenanceLoadingState());
    final result = await _maintenanceUseCase.getMaintenance(fromRemote: fromRemote);
    result.when(
      (success) {
        page = 0;
        allServices = success.services;
        final index = allServices.lastIndexWhere((element) => element.done);
        services = allServices
            .getRange(page, index + 2)
            .toList()
            .reversed
            .toList();
        maintenanceEntity = success;
        emit(
          MaintenanceSuccessState(
            maintenanceEntity: maintenanceEntity!,
            services: services,
          ),
        );
        page += index + 2;
      },
      (whenError) {
        emit(MaintenanceErrorState(message: whenError.message));
      },
    );
  }

  void loadingUpcoming() async {
    emit(
      MaintenanceSuccessState(
        maintenanceEntity: maintenanceEntity!,
        services: services,
        loadingMore: true,
      ),
    );
    await Future.delayed(Duration(seconds: 1));
    final allDisplay = maintenanceEntity!.services.length - page <= 0;
    if (!allDisplay) {
      services.insertAll(
        0,
        allServices
            .getRange(
              page,
              (page + 3) >= maintenanceEntity!.services.length
                  ? maintenanceEntity!.services.length
                  : (page + 3),
            )
            .toList()
            .reversed
            .toList(),
      );
    }
    emit(
      MaintenanceSuccessState(
        maintenanceEntity: maintenanceEntity!,
        services: services,
        allDisplayed: allDisplay,
      ),
    );
    page += 3;
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
