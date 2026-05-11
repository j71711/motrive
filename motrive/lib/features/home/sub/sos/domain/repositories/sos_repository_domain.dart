import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/sos/domain/entities/sos_entity.dart';

abstract class SosRepositoryDomain {
    Future<Result<SosEntity, Failure>> getSos();
}
