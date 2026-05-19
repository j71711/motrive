import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/features/maintenance/data/models/maintenance/maintenance_model.dart';

abstract class BaseMaintenanceRemoteDataSource {
  Future<MaintenanceModel> getMaintenance();
}

@LazySingleton(as: BaseMaintenanceRemoteDataSource)
class MaintenanceRemoteDataSource implements BaseMaintenanceRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  MaintenanceRemoteDataSource(
    this._supabase,
    this._userService,
  );

  @override
  Future<MaintenanceModel> getMaintenance() async {
    final userCars = await _supabase
        .from('vehicles')
        .select()
        .eq('user_id', _userService.currentUser!.id);

    if (userCars.isEmpty) {
      throw Exception('No car found');
    } else if (userCars.first['car_info_id'] == null) {
      throw Exception('No maintenance found');
    }

    List<Map<String, dynamic>> carServices = await _supabase
        .from('services_info')
        .select()
        .eq('car_id', userCars.first['car_info_id'])
        .order('service_odometer', ascending: true);

    final doneServices = await _supabase
        .from('maintenance_logs')
        .select()
        .eq('user_id', _userService.currentUser!.id);

    carServices = carServices.map((e) {
      Map<String, dynamic> service = e;
      doneServices.map((done) {
        if (done['service_id'] == service['id']) {
          service.addAll({'done': true});
        }
      }).toList();
      return service;
    }).toList();

    return MaintenanceModel.fromJson({
      'vehicle': userCars.first,
      'services': carServices,
    });
  }
}
