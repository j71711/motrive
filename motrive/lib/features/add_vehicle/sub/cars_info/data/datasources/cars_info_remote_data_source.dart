import 'package:injectable/injectable.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/data/models/car_info_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseCarsInfoRemoteDataSource {
  Future<List<CarsInfoModel>> getCarsInfo();
}

@LazySingleton(as: BaseCarsInfoRemoteDataSource)
class CarsInfoRemoteDataSource implements BaseCarsInfoRemoteDataSource {
  final SupabaseClient _supabase;

  CarsInfoRemoteDataSource(this._supabase);

  @override
  Future<List<CarsInfoModel>> getCarsInfo() async {
    final response = await _supabase
        .from('cars_info')
        .select()
        .order('created_at');
    return response
        .map<CarsInfoModel>((e) => CarsInfoModel.fromJson(e))
        .toList();
  }
}
