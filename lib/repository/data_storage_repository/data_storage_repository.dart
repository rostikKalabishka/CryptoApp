import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/futures/portfolio/model/coin_user_data.dart';
import 'package:crypto_app/repository/data_storage_repository/abstract_data_storage_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/model/user.dart';

enum PortfolioAction { add, remove }

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
  Future<bool> checkCryptoCurrencyInPortfolio({
    required String id,
  }) async {
    final currentUser = firebaseAuthInstance.currentUser;
    try {
      if (currentUser == null) {
        throw 'currentUser is null';
      }
      final userDoc = firebaseStore.collection('users').doc(currentUser.uid);
      final userData = await userDoc.get();

      final List<Map<String, dynamic>> userPortfolio =
          List<Map<String, dynamic>>.from(userData.data()?['portfolio'] ??
              [] as List<Map<String, dynamic>>);
      return userPortfolio.any((element) => element['id'] == id);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> addOrRemoveCryptoCurrencyToPortfolio({
    required CoinUserData coinUserData,
    required PortfolioAction action,
  }) async {
    final currentUser = firebaseAuthInstance.currentUser;
    try {
      if (currentUser == null) {
        throw 'currentUser is null';
      }
      final userDoc = firebaseStore.collection('users').doc(currentUser.uid);
      final userData = await userDoc.get();

      final List<Map<String, dynamic>> userPortfolio =
          List<Map<String, dynamic>>.from(userData.data()?['portfolio'] ??
              [] as List<Map<String, dynamic>>);
      if (action == PortfolioAction.add) {
        if (!userPortfolio.contains(coinUserData.toJson())) {
          userPortfolio.add(coinUserData.toJson());
        }
      } else if (action == PortfolioAction.remove) {
        userPortfolio
            .removeWhere((element) => element['id'] == coinUserData.id);
      }

      userDoc.update({'portfolio': userPortfolio});
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<XFile?> pickImage() async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
      return file;
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateCurrentCoinInPortfolio({
    required String id,
    required double amountCoins,
    required double coinInUSD,
  }) async {
    final currentUser = firebaseAuthInstance.currentUser;
    try {
      if (currentUser == null) {
        throw 'currentUser is null';
      }

      final userDoc = firebaseStore.collection('users').doc(currentUser.uid);
      final userData = await userDoc.get();

      List<Map<String, dynamic>> userPortfolio =
          List<Map<String, dynamic>>.from(userData.data()?['portfolio'] ?? []);

      final Map<String, dynamic> coinToUpdate = userPortfolio.firstWhere(
        (element) => element['id'] == id,
      );

      coinToUpdate['amount_coins'] = amountCoins;
      coinToUpdate['coin_in_usd'] = coinInUSD;

      await userDoc.update({'portfolio': userPortfolio});
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateCurrentPriceCoin(
      {required String id,
      required double coinInUSD,
      required double currentPrice}) async {
    final currentUser = firebaseAuthInstance.currentUser;
    try {
      if (currentUser == null) {
        throw 'currentUser is null';
      }

      final userDoc = firebaseStore.collection('users').doc(currentUser.uid);
      final userData = await userDoc.get();

      List<Map<String, dynamic>> userPortfolio =
          List<Map<String, dynamic>>.from(userData.data()?['portfolio'] ?? []);

      final Map<String, dynamic> coinToUpdate = userPortfolio.firstWhere(
        (element) => element['id'] == id,
      );

      coinToUpdate['coin_in_usd'] = coinInUSD;
      coinToUpdate['price_current'] = currentPrice;

      await userDoc.update({'portfolio': userPortfolio});
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> updateCurrentPrice({
    required String id,
    required double amountCoins,
    required double coinInUSD,
  }) async {
    final currentUser = firebaseAuthInstance.currentUser;
    try {
      if (currentUser == null) {
        throw 'currentUser is null';
      }

      final userDoc = firebaseStore.collection('users').doc(currentUser.uid);
      final userData = await userDoc.get();

      List<Map<String, dynamic>> userPortfolio =
          List<Map<String, dynamic>>.from(userData.data()?['portfolio'] ?? []);

      final Map<String, dynamic> coinToUpdate = userPortfolio.firstWhere(
        (element) => element['id'] == id,
      );

      coinToUpdate['amount_coins'] = amountCoins;
      coinToUpdate['coin_in_usd'] = coinInUSD;

      await userDoc.update({'portfolio': userPortfolio});
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateSettingsUsersInfo(
      {required String username, required String image}) async {
    final currentUser = firebaseAuthInstance.currentUser;
    try {
      if (currentUser == null) {
        throw 'currentUser is null';
      }
      final userDoc = firebaseStore.collection('users').doc(currentUser.uid);

      final Reference ref = FirebaseStorage.instance
          .ref()
          .child('${currentUser.uid}_profileimage.jpg');

      if (username.isEmpty && image.isNotEmpty) {
        String downloadUrl = await getImageFromStorage(ref, image);
        await userDoc.update({'profile_image': downloadUrl});
      } else if (username.isNotEmpty && image.isEmpty) {
        await userDoc.update({'username': username});
      } else if (username.isNotEmpty && image.isNotEmpty) {
        String downloadUrl = await getImageFromStorage(ref, image);
        await userDoc
            .update({'username': username, 'profile_image': downloadUrl});
      } else {
        return;
      }
    } catch (e) {
      throw '$e';
    }
  }

  Future<String> getImageFromStorage(Reference ref, String image) async {
    await ref.putFile(File(image));
    final downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }
}
