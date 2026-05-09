import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/core/common/auth_entity.dart';
part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    required String id,

    required String email,

    String? phone,

    @JsonKey(name: 'full_name') String? fullName,

    String? gender,

    @JsonKey(name: 'avatar_url') String? avatarUrl,

    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,

    @JsonKey(name: 'auth_id') String? authId,

    @JsonKey(name: 'notification_id') String? notificationId,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}

extension AuthModelMapper on AuthModel {
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      email: email,
      phone: phone ?? '',
      fullName: fullName ?? '',
      gender: gender ?? '',
      avatarUrl: avatarUrl ?? '',
      dateOfBirth: dateOfBirth,
      authId: authId ?? '',
      notificationId: notificationId ?? '',
    );
  }
}
