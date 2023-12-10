import 'package:crypto_app/repository/abstract_auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepository extends AbstractAuthRepository {
  final Dio dio;

  AuthRepository({required this.dio});
}
