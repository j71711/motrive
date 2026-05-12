import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/loading/domain/entities/loading_entity.dart';
import 'package:multiple_result/multiple_result.dart';


abstract class LoadingRepositoryDomain {
  Future<Result<LoadingEntity, Failure>> loginStatus();
}
