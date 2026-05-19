import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/entities/cars_info_entity.dart';
part 'car_info_model.freezed.dart';
part 'car_info_model.g.dart';

@freezed
abstract class CarsInfoModel with _$CarsInfoModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory CarsInfoModel({
    required String id,
    required String make,
    required String model,
    required int year,
    String? engine,
    String? manualSource,
    DateTime? createdAt,
  }) = _CarsInfoModel;

  factory CarsInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CarsInfoModelFromJson(json);
}

extension CarsInfoModelMapper on CarsInfoModel {
  CarsInfoEntity toEntity() {
    return CarsInfoEntity(
      id: id,
      make: make,
      model: model,
      year: year,
      engine: engine,
      createdAt: createdAt,
      manualSource: manualSource,
    );
  }
}
