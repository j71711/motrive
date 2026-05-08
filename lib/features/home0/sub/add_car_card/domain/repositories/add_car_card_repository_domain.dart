import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/entities/add_car_card_entity.dart';

abstract class AddCarCardRepositoryDomain {
    Future<Result<AddCarCardEntity, Failure>> getAddCarCard();
}
