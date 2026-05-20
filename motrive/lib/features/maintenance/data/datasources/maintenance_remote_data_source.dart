import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:motrive/core/network/dio_client.dart';
import 'package:motrive/core/services/maintenance_normalizer.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/features/maintenance/data/models/maintenance/maintenance_model.dart';

abstract class BaseMaintenanceRemoteDataSource {
  Future<MaintenanceModel> getMaintenance();
  Stream<String> processData(UserVehicleEntity vehicle);
}

@LazySingleton(as: BaseMaintenanceRemoteDataSource)
class MaintenanceRemoteDataSource implements BaseMaintenanceRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  final DioClient _dioClient;

  MaintenanceRemoteDataSource(
    this._supabase,
    this._userService,
    this._dioClient,
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
      return MaintenanceModel.fromJson({
        'vehicle': userCars.first,
        'services': [],
      });
    }

    List<Map<String, dynamic>> carServices = await _supabase
        .from('services_info')
        .select()
        .eq('car_id', userCars.first['car_info_id'] ?? '')
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

  @override
  Stream<String> processData(UserVehicleEntity vehicle) {
    final StreamController<String> status = StreamController()
      ..add('Processing Car Info');

    _dioClient
        .get(
          'https://hatem1420.app.n8n.cloud/webhook/car-manual-lookup',
          data: {
            'make': vehicle.make,
            'model': vehicle.model,
            'year': vehicle.year,
          },
        )
        .then((value) async {
          status.add('Normalizing The Data');
          await Future.delayed(Duration(seconds: 1));
          final normalized = MaintenanceNormalizer.normalizeCarData(
            value.data[0],
          );
          status.add('Preparing Data For You');
          final carInfoId = await uploadData(normalized);

          await _supabase
              .from('vehicles')
              .update({'car_info_id': carInfoId})
              .eq('id', vehicle.id!);

          status.add("We're Done");
        });

    return status.stream;
  }

  Future<String> uploadData(Map json) async {
    final carInfo = await _supabase
        .from('cars_info')
        .insert(json['car_info'] as Map)
        .select()
        .single();

    final services = json['services'];

    final serviceRows = <Future>[];
    final partsRows = <Future>[];

    (services as List).map((e) {
      final withoutParts = Map.from(e);
      final parts = withoutParts['parts'];
      withoutParts.remove('parts');
      withoutParts.addAll({'car_id': carInfo['id']});
      serviceRows.add(
        _supabase.from('services_info').insert(withoutParts).select().then((
          value,
        ) {
          value.map((serviceRow) {
            partsRows.addAll(
              (parts as List).map((e) {
                final withId = Map.from(e);
                withId.addAll({"service_id": serviceRow['id']});
                return _supabase.from('service_parts_info').insert(withId);
              }).toList(),
            );
          }).toList();
        }),
      );
    }).toList();

    await Future.wait(serviceRows, eagerError: true);
    await Future.wait(partsRows, eagerError: true);
    return carInfo['id'];
  }
}
