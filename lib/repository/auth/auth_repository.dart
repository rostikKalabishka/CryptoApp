import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/futures/portfolio/model/coin_user_data.dart';
import 'package:crypto_app/repository/auth/model/model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements AbstractAuthRepository {
  final Dio dio;
  final FirebaseAuth firebaseAuthInstance;
  final FirebaseFirestore firebaseStore;

  AuthRepository({
    required this.dio,
    required this.firebaseAuthInstance,
    required this.firebaseStore,
  });

  @override
  Future registration({
    required String username,
    required String password,
    required String email,
  }) async {
    try {
      await firebaseAuthInstance.createUserWithEmailAndPassword(
          email: email, password: password);

      final uid = firebaseAuthInstance.currentUser?.uid;
      if (uid != null) {
        await addUserDetails(
            email: email, username: username, uid: uid, profileImage: '');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        throw 'The account already exists for that email.';
      } else {
        log('$e');
        throw e.code;
      }
    } catch (e) {
      debugPrint('$e');
      throw '$e';
    }
  }

  @override
  Future login({
    required String password,
    required String email,
  }) async {
    try {
      await firebaseAuthInstance.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        throw 'Wrong password provided for that user.';
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        log('INVALID LOGIN CREDENTIALS');
        throw 'Invalid login credentials.';
      } else {
        log('$e');
        throw e.code;
      }
    } catch (e) {
      log('$e');

      throw 'Unknown error, try again';
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await firebaseAuthInstance.sendPasswordResetEmail(email: email.trim());
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthInstance.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Future<void> addUserDetails(
      {required String username,
      required String email,
      required String uid,
      required String? profileImage}) async {
    if (uid.isNotEmpty) {
      final userDoc = firebaseStore.collection('users').doc(uid);
      UserDetails userDetails = UserDetails(
        portfolioName: 'My Portfolio',
        email: email,
        username: username,
        uid: uid,
        portfolio: const <CoinUserData>[],
        profileImage: profileImage,
      );
      await userDoc.set(userDetails.toJson());
    }
  }

  @override
  Stream<User?> get user {
    return firebaseAuthInstance.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> singInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw 'You canceled authentication with Google';
      } else {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final User? firebaseUser = userCredential.user;

        if (firebaseUser != null) {
          final String uid = firebaseUser.uid;
          final userDoc = firebaseStore.collection('users').doc(uid);
          final existingDoc = await userDoc.get();

          if (!existingDoc.exists) {
            UserDetails userDetails = UserDetails(
              portfolioName: 'My Portfolio',
              email: googleUser.email,
              username: googleUser.displayName ?? '',
              uid: uid,
              portfolio: const <CoinUserData>[],
              profileImage: googleUser.photoUrl,
            );

            await userDoc.set(userDetails.toJson());
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      throw e.toString();
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
