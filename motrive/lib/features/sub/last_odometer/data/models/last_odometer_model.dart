import 'package:motrive/features/sub/last_odometer/domain/entities/last_odometer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'last_odometer_model.freezed.dart';
part 'last_odometer_model.g.dart';

@freezed
abstract class LastOdometerModel with _$LastOdometerModel {
  const factory LastOdometerModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _LastOdometerModel;

  factory LastOdometerModel.fromJson(Map<String, Object?> json) => _$LastOdometerModelFromJson(json);
}



extension LastOdometerModelMapper on LastOdometerModel {
  LastOdometerEntity toEntity() {
    return LastOdometerEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
