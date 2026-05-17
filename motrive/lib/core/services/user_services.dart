import 'package:injectable/injectable.dart';
import 'package:motrive/core/common/auth_entity.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';

@lazySingleton
class UserService {
  AuthEntity? _authEntity;
  UserVehicleModel? _userVehicle;

  AuthEntity? get currentUser => _authEntity;
  set setUser(AuthEntity newUser) => _authEntity = newUser;
  void signOut() => _authEntity = null;

  UserVehicleModel? get currentVehicle => _userVehicle;
  set setVehicle(UserVehicleModel newVehicle) => _userVehicle = newVehicle;
}
