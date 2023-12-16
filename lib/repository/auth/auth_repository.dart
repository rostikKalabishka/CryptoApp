// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:crypto_app/repository/abstract_auth_repository.dart';

class AuthRepository implements AbstractAuthRepository {
  final Dio dio;
  final FirebaseAuth firebaseAuthInstance;

  AuthRepository({
    required this.dio,
    required this.firebaseAuthInstance,
  });

  @override
  Future registration({
    required String userName,
    required String password,
    required String email,
  }) async {
    await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future login({
    required String password,
    required String email,
  }) async {
    await firebaseAuthInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
