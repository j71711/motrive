import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/profile/sub/emergency_contact/domain/entities/emergency_contact_entity.dart';
part 'emergency_contact_model.freezed.dart';
part 'emergency_contact_model.g.dart';

@freezed
abstract class EmergencyContactModel with _$EmergencyContactModel {
  const factory EmergencyContactModel({
    required String id,

    @JsonKey(name: 'user_id') required String userId,

    required String name,

    @JsonKey(name: 'phone_number') required String phoneNumber,

    required String relation,

    @JsonKey(name: 'notify_emergency')
    @Default(false)
    bool notifyEmergency,

    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _EmergencyContactModel;

  factory EmergencyContactModel.fromJson(Map<String, Object?> json) =>
      _$EmergencyContactModelFromJson(json);
}

extension EmergencyContactModelMapper on EmergencyContactModel {
  EmergencyContactEntity toEntity() {
    return EmergencyContactEntity(
      id: id,
      userId: userId,
      name: name,
      phoneNumber: phoneNumber,
      relation: relation,
      notifyEmergency: notifyEmergency,
      createdAt: createdAt,
    );
  }
}
