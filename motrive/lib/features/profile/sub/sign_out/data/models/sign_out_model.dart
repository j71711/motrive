
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/profile/sub/sign_out/domain/entities/sign_out_entity.dart';
part 'sign_out_model.freezed.dart';
part 'sign_out_model.g.dart';

@freezed
abstract class SignOutModel with _$SignOutModel {
  const factory SignOutModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _SignOutModel;

  factory SignOutModel.fromJson(Map<String, Object?> json) => _$SignOutModelFromJson(json);
}



extension SignOutModelMapper on SignOutModel {
  SignOutEntity toEntity() {
    return SignOutEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
