abstract interface class AbstractAuthRepository {
  Future registration({
    required String userName,
    required String password,
    required String email,
  });
  Future login({
    required String password,
    required String email,
  });
}
