import 'package:motrive/features/sub/save_service/domain/entities/save_service_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'save_service_model.freezed.dart';
part 'save_service_model.g.dart';

@freezed
abstract class SaveServiceModel with _$SaveServiceModel {
  const factory SaveServiceModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _SaveServiceModel;

  factory SaveServiceModel.fromJson(Map<String, Object?> json) => _$SaveServiceModelFromJson(json);
}



extension SaveServiceModelMapper on SaveServiceModel {
  SaveServiceEntity toEntity() {
    return SaveServiceEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
