import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
part 'service_info_model.freezed.dart';
part 'service_info_model.g.dart';

@freezed
abstract class ServiceInfoModel with _$ServiceInfoModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory ServiceInfoModel({
    required String id,
    required int serviceOdometer,
    required int dateIntervalMonths,
    required String severity,
    required String recommendation,
    bool? done,
  }) = _ServiceInfoModel;

  factory ServiceInfoModel.fromJson(Map<String, Object?> json) =>
      _$ServiceInfoModelFromJson(json);
}

extension ServiceInfoModelMapper on ServiceInfoModel {
  ServiceInfoEntity toEntity() {
    return ServiceInfoEntity(
      id: id,
      serviceOdometer: serviceOdometer,
      dateIntervalMonths: dateIntervalMonths,
      severity: severity,
      recommendation: recommendation,
      done: done ?? false
    );
  }
}
