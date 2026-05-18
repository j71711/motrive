import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/profile/sub/user/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,

    String? email,

    String? phone,

    @JsonKey(name: 'full_name') String? fullName,

    String? gender,

    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      phone: phone,
      fullName: fullName,
      gender: gender,
      dateOfBirth: dateOfBirth,
    );
  }
}
