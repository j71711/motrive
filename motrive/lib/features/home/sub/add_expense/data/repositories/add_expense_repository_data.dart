import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/home/sub/add_car_card/data/datasources/add_car_card_remote_data_source.dart';
import 'package:motrive/features/home/sub/add_expense/data/models/add_expense_model.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/add_expense/data/datasources/add_expense_remote_data_source.dart';
import 'package:motrive/features/home/sub/add_expense/domain/repositories/add_expense_repository_domain.dart';

@LazySingleton(as: AddExpenseRepositoryDomain)
class AddExpenseRepositoryData implements AddExpenseRepositoryDomain{
  final BaseAddExpenseRemoteDataSource remoteDataSource;
   final VehicleLocalDataSource localDataSource;
  AddExpenseRepositoryData(this.remoteDataSource, this.localDataSource);
  @override
  Future<Result<void, Failure>> addExpense(AddExpenseEntity entity) async{
    try {
      final cachedVehicles = localDataSource.getCachedVehicles();
      final newVehicleId = cachedVehicles.first.id;
   final updatedEntity = AddExpenseEntity(
      vehicleId: newVehicleId,
      category: entity.category,
      cost: entity.cost,
      odometer: entity.odometer,
      notes: entity.notes,
    );
      final vehicle = cachedVehicles.firstWhere(
        (v) => v.id == newVehicleId,
  orElse: () => throw Exception('Vehicle not found'),
        );
      final int currentOdometer = vehicle.currentOdometer ?? 0;
      if (entity.odometer < currentOdometer) {
        return Error(FailureExceptions.getException( 'The odometer is lower than the current ($currentOdometer).'));
      }
        // 3. إرسال البيانات للسيرفر (Supabase)
        // final model = entity.toModel(); 

    final model = updatedEntity.toModel();
      await remoteDataSource.addExpense(model);

      // 4. تحديث الممشى في الكاش محلياً فوراً  
      final updatedList = cachedVehicles.map((v) {
        if (v.id == entity.vehicleId) {
          // نحدث الممشى في الكاش بالقيمة الجديدة
          return v.copyWith(currentOdometer: entity.odometer);
        }
        return v;
      }).toList();
      
      await localDataSource.cacheVehicles(updatedList);

      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
