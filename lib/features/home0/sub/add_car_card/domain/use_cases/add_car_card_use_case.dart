import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/repositories/add_car_card_repository_domain.dart';


@lazySingleton
class AddCarCardUseCase {
  final AddCarCardRepositoryDomain _repositoryData;

  AddCarCardUseCase(this._repositoryData);

   Future<Result<AddCarCardEntity, Failure>> getAddCarCard() async {
    return _repositoryData.getAddCarCard();
  }
}
