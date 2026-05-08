import 'package:motrive/features/home0/domain/entities/home0_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home0_model.freezed.dart';
part 'home0_model.g.dart';

@freezed
abstract class Home0Model with _$Home0Model {
  const factory Home0Model({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _Home0Model;

  factory Home0Model.fromJson(Map<String, Object?> json) => _$Home0ModelFromJson(json);
}



extension Home0ModelMapper on Home0Model {
  Home0Entity toEntity() {
    return Home0Entity(id: id, firstName: firstName, lastName: lastName);
  }
  }
