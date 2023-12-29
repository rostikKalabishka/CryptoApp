import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/repository/data_storage_repository/abstract_data_storage_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/model/user.dart';

class DataStorageRepository implements AbstractDataStorageRepository {
  final SharedPreferences sharedPreferences;
  final FirebaseAuth firebaseAuthInstance;
  final FirebaseFirestore firebaseStore;

  DataStorageRepository(
      {required this.sharedPreferences,
      required this.firebaseAuthInstance,
      required this.firebaseStore});

  static const themeKey = 'theme_key';

  @override
  Future<String> getPortfolioName() {
    throw UnimplementedError();
  }

  @override
  Future<bool> getTheme() async {
    return sharedPreferences.getBool(themeKey) ?? true;
  }

  @override
  Future<void> setTheme({required bool swithBool}) async {
    await sharedPreferences.setBool(themeKey, swithBool);
  }

  @override
  Future<UserDetails> getUserInfo() async {
    final currentUser = firebaseAuthInstance.currentUser;

    if (currentUser != null) {
      final isGoogleSignIn = currentUser.providerData
          .any((info) => info.providerId == GoogleAuthProvider.PROVIDER_ID);

      if (isGoogleSignIn) {
        final googleUserInfo =
            await firebaseStore.collection('users').doc(currentUser.uid).get();
        if (googleUserInfo.exists) {
          return UserDetails.fromJson(googleUserInfo.data()!);
        } else {
          throw 'User data not found.';
        }
      } else {
        final userDoc =
            await firebaseStore.collection('users').doc(currentUser.uid).get();
        if (userDoc.exists) {
          return UserDetails.fromJson(userDoc.data()!);
        } else {
          throw 'User data not found.';
        }
      }
    } else {
      throw 'The user is not authorized.';
    }
  }

  @override
  Future<void> updatePortfolioName({required String newPortfolioName}) async {
    final currentUser = firebaseAuthInstance.currentUser;
    try {
      final userDoc = firebaseStore.collection('users').doc(currentUser!.uid);

      await userDoc.update({'portfolio_name': newPortfolioName});
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateSettingsUsersInfo() {
    // TODO: implement updateSettingsUsersInfo
    throw UnimplementedError();
  }
}
