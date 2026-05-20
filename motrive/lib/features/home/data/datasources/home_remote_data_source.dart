import 'package:injectable/injectable.dart';
import 'package:motrive/core/common/auth_entity.dart';
import 'package:motrive/core/services/user_services.dart';

abstract class BaseHomeRemoteDataSource {
  Future<AuthEntity> getHome();
}

@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  final UserService _userService;

  HomeRemoteDataSource(this._userService);

  @override
  Future<AuthEntity> getHome() async {
    return _userService.currentUser!;
  }
}
