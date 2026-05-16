import 'package:motrive/features/home/sub/sos/domain/entities/sos_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sos_model.freezed.dart';
part 'sos_model.g.dart';

@freezed
abstract class SosModel with _$SosModel {
  const factory SosModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _SosModel;

  factory SosModel.fromJson(Map<String, Object?> json) => _$SosModelFromJson(json);
}



extension SosModelMapper on SosModel {
  SosEntity toEntity() {
    return SosEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
