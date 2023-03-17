abstract class AuthRepo {
  Future<bool> loginWithEmail({required String email, required String password});

  Future<bool> resetPassword({required String email});

  Future<bool> createNewPassword({
    required String email,
    required String verificationCode,
    required String password,
    required String confirmation,
  });

  Future<bool> changePassword({required String email});
}
