import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/constants/app_hive_keys.dart';
import 'package:motrive/features/profile/data/models/profile_model.dart';

abstract class BaseProfileLocalDataSource {
  Future<ProfileModel?> getProfile();

  Future<void> saveProfile(ProfileModel profile);
}

@LazySingleton(as: BaseProfileLocalDataSource)
class ProfileLocalDataSource
    implements BaseProfileLocalDataSource {
  final Box _box;

  ProfileLocalDataSource(this._box);

  @override
  Future<ProfileModel?> getProfile() async {
    try {
      final rawProfile = await _box.get(
        HiveBoxes.profile,
      );

      if (rawProfile == null) {
        return null;
      }

      final profileMap = toStringMap(rawProfile);

      return ProfileModel.fromJson(profileMap);
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
  Future<void> saveProfile(
    ProfileModel profile,
  ) async {
    try {
      await _box.put(
        HiveBoxes.profile,
        profile.toJson(),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}