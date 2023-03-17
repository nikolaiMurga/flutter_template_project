import 'dart:async';

import 'package:flutter_template_project/data/repo/auth/auth_local_repo.dart';
import 'package:flutter_template_project/domain/repo/auth_repo.dart';
import 'package:flutter_template_project/utils/debug_constants.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final AuthLocalRepo _authLocalRepo;

  AuthRepoImpl(this._authLocalRepo);

  @override
  Future<bool> loginWithEmail({required String email, required String password}) async {
    final loggedIn = email == DebugConst.email && password == DebugConst.password;
    if (loggedIn) await _authLocalRepo.saveToken("token");
    return loggedIn;
  }

  @override
  Future<bool> createNewPassword(
      {required String email, required String verificationCode, required String password, required String confirmation}) async {
    try {
      const response = true;
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> resetPassword({required String email}) async {
    try {
      const response = true;
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> changePassword({required String email}) async {
    try {
      const response = true;
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
