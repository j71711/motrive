import 'package:motrive/features/home/domain/entities/home_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  const factory HomeModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, Object?> json) => _$HomeModelFromJson(json);
}



extension HomeModelMapper on HomeModel {
  HomeEntity toEntity() {
    return HomeEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
