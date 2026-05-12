
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/loading/domain/entities/loading_entity.dart';
part 'loading_model.freezed.dart';
part 'loading_model.g.dart';

@freezed
abstract class LoadingModel with _$LoadingModel {
  const factory LoadingModel({
    @JsonKey(defaultValue: false) required bool isLogin,
    bool? isUser,
  }) = _LoadingModel;

  factory LoadingModel.fromJson(Map<String, Object?> json) =>
      _$LoadingModelFromJson(json);
}

extension LoadingModelMapper on LoadingModel {
  LoadingEntity toEntity() {
    return LoadingEntity(isLogin: isLogin, isUser: isUser);
  }
}
