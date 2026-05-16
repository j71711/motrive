import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
part 'car_info_model.freezed.dart';
part 'car_info_model.g.dart';

@freezed
abstract class CarInfoModel with _$CarInfoModel {
  const factory CarInfoModel({
    required String id,
    required String make,
    required String model,
    required int year,
    String? engine,
    @JsonKey(name: 'maintenance_odometer_interval')
    required int maintenanceOdometerInterval,
    @JsonKey(name: 'manual_source')
    String? manualSource,
    @JsonKey(name: 'created_at')
    DateTime? createdAt,
  }) = _CarInfoModel;

  factory CarInfoModel.fromJson(Map<String, dynamic> json)
      => _$CarInfoModelFromJson(json);
}
extension CarInfoModelMapper on CarInfoModel {
  CarInfoEntity toEntity() {
    return CarInfoEntity(
      make: make,
      model: model,
      year: year,
      engine: engine,
      maintenanceOdometerInterval: maintenanceOdometerInterval,
    );
  }
}