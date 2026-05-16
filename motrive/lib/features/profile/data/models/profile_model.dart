import 'package:motrive/features/profile/domain/entities/profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) => _$ProfileModelFromJson(json);
}



extension ProfileModelMapper on ProfileModel {
  ProfileEntity toEntity() {
    return ProfileEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
