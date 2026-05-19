import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/common/auth_model.dart';
import 'package:motrive/core/constants/app_hive_keys.dart';

abstract class BaseAuthLocalDataSource {
  Future<AuthModel?> getAuth();

  Future<void> saveAuth(AuthModel auth);

  Future<void> clearAuth();
}

@LazySingleton(as: BaseAuthLocalDataSource)
class AuthLocalDataSource
    implements BaseAuthLocalDataSource {
  final Box _box;

  AuthLocalDataSource(this._box);

  @override
  Future<AuthModel?> getAuth() async {
    try {
      final rawAuth = await _box.get(
        HiveBoxes.auth,
      );

      if (rawAuth == null) {
        return null;
      }

      final authMap = toStringMap(rawAuth);

      return AuthModel.fromJson(authMap);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Map<String, dynamic> toStringMap(dynamic raw) =>
      (raw as Map).map(
        (k, v) => MapEntry(k.toString(), v),
      );

  @override
  Future<void> saveAuth(
    AuthModel auth,
  ) async {
    try {
      await _box.put(
        HiveBoxes.auth,
        auth.toJson(),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> clearAuth() async {
    try {
      await _box.delete(
        HiveBoxes.auth,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}