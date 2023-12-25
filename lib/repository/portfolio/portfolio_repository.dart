import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'abstract_portfolio_repository.dart';

class PortfolioRepository implements AbstractPortfolioRepository {
  final Dio dio;
  final FirebaseAuth firebaseAuthInstance;
  final FirebaseFirestore firebaseStore;

  PortfolioRepository(
      {required this.dio,
      required this.firebaseAuthInstance,
      required this.firebaseStore});

  @override
  Future<void> addCryptoCurrencyInPortfolio() async {}

  @override
  Future<void> deleteCryptoCurrencyInPortfolio() async {}

  @override
  Future<void> checkCryptoCurrencyInPortfolio() async {}

  @override
  Future<List<dynamic>> listPortfolio() {
    throw UnimplementedError();
  }
}
