import 'package:motrive/features/parking/sub/parking_history/domain/entities/parking_history_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'parking_history_model.freezed.dart';
part 'parking_history_model.g.dart';

@freezed
abstract class ParkingHistoryModel with _$ParkingHistoryModel {
  const factory ParkingHistoryModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _ParkingHistoryModel;

  factory ParkingHistoryModel.fromJson(Map<String, Object?> json) => _$ParkingHistoryModelFromJson(json);
}



extension ParkingHistoryModelMapper on ParkingHistoryModel {
  ParkingHistoryEntity toEntity() {
    return ParkingHistoryEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
