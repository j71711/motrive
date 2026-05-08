import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home0/domain/entities/home0_entity.dart';

abstract class Home0RepositoryDomain {
    Future<Result<Home0Entity, Failure>> getHome0();
}
