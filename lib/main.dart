import 'package:crypto_app/crypto_app.dart';
import 'package:crypto_app/firebase_options.dart';
import 'package:crypto_app/repository/abstract_coin_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'repository/abstract_auth_repository.dart';
import 'repository/auth/auth_repository.dart';
import 'repository/crypto_coin/crypto_coins_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final Dio dio = Dio();
  final firebaseAuthInstance = FirebaseAuth.instance;

  GetIt.I.registerLazySingleton<AbstractCoinRepository>(
      () => CryptoCoinsRepository(dio: dio));

  GetIt.I.registerLazySingleton<AbstractAuthRepository>(() =>
      AuthRepository(dio: dio, firebaseAuthInstance: firebaseAuthInstance));
  runApp(const CryptoApp());
}
