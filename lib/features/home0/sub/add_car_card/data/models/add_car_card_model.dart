import 'package:motrive/features/home0/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_car_card_model.freezed.dart';
part 'add_car_card_model.g.dart';

@freezed
abstract class AddCarCardModel with _$AddCarCardModel {
  const factory AddCarCardModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _AddCarCardModel;

  factory AddCarCardModel.fromJson(Map<String, Object?> json) => _$AddCarCardModelFromJson(json);
}



extension AddCarCardModelMapper on AddCarCardModel {
  AddCarCardEntity toEntity() {
    return AddCarCardEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
