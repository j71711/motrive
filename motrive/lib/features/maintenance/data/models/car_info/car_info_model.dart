import 'package:motrive/features/maintenance/domain/entities/car_info_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'car_info_model.freezed.dart';
part 'car_info_model.g.dart';

@freezed
abstract class CarInfoModel with _$CarInfoModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory CarInfoModel({
    required String id,
    required String make,
    required String model,
    required int year,
    required String engine,
    required String manualSource,
    required int maintenanceOdometerInterval,
  }) = _CarInfoModel;

  factory CarInfoModel.fromJson(Map<String, Object?> json) =>
      _$CarInfoModelFromJson(json);
}

extension CarInfoModelMapper on CarInfoModel {
  CarInfoEntity toEntity() {
    return CarInfoEntity(
      id: id,
      make: make,
      model: model,
      year: year,
      engine: engine,
      manualSource: manualSource,
      maintenanceOdometerInterval: maintenanceOdometerInterval,
    );
  }
}
