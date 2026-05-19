import 'package:motrive/features/sub/vehicle_card/domain/entities/vehicle_card_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'vehicle_card_model.freezed.dart';
part 'vehicle_card_model.g.dart';

@freezed
abstract class VehicleCardModel with _$VehicleCardModel {
  const factory VehicleCardModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _VehicleCardModel;

  factory VehicleCardModel.fromJson(Map<String, Object?> json) => _$VehicleCardModelFromJson(json);
}



extension VehicleCardModelMapper on VehicleCardModel {
  VehicleCardEntity toEntity() {
    return VehicleCardEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
