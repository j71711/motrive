import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_car_card_model.freezed.dart';
part 'add_car_card_model.g.dart';

@freezed
//VehicleModel 
abstract class AddCarCardModel with _$AddCarCardModel {
  const factory AddCarCardModel({
    @JsonKey(name: 'user_id')
  required String userId,
  required String id,
  required String make,
  required String model,
  required int year,
   String? color,
   @JsonKey(name: 'license_plate')
   String? licensePlate,
   String? vin,
   @JsonKey(name: 'current_odometer')
   int? currentOdometer,
   @JsonKey(name: 'created_at')
   DateTime? createdAt, 
   @JsonKey(name: 'car_info_id')
   String? carInfoId ,
  }) = _AddCarCardModel;

  factory AddCarCardModel.fromJson(Map<String, Object?> json) => _$AddCarCardModelFromJson(json);
}

extension AddCarCardModelMapper on AddCarCardModel {
  AddCarCardEntity toEntity() {
    return AddCarCardEntity(vin: vin, make: make, model: model, year: year, id: id, color: color, licensePlate: licensePlate, currentOdometer: currentOdometer, createdAt: createdAt?.toIso8601String(), carInfoId: carInfoId,userId: userId);
  }
  }

