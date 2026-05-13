import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/common/auth_entity.dart';

@lazySingleton
class UserService {
  final ValueNotifier<AuthEntity?> _authEntity = ValueNotifier(null);
  AuthEntity? get currentUser => _authEntity.value;
  set setUser(AuthEntity newUser) => _authEntity.value = newUser;
  void signOut() => _authEntity.value = null;
}
