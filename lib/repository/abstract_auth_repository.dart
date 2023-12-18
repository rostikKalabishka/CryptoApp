abstract interface class AbstractAuthRepository {
  Future registration({
    required String username,
    required String password,
    required String email,
  });
  Future login({
    required String password,
    required String email,
  });

  Future<void> signOut();

  Future<void> addUserDetails({
    required String username,
    required String email,
  });

  Future<void> forgotPassword({required String email});

  Future<void> singInWithGoogle();
  Future<void> singInWithAppleID();
}
