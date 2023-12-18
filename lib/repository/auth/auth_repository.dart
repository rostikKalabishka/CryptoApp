import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/repository/auth/model/model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:crypto_app/repository/abstract_auth_repository.dart';
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

      await addUserDetails(email: email, username: username);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      } else {
        log('$e');
      }
    } catch (e) {
      log('$e');
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
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      } else {
        log('$e');
      }
    } catch (e) {
      log('$e');
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await firebaseAuthInstance.sendPasswordResetEmail(email: email.trim());
  }

  @override
  Future<void> signOut() {
    throw firebaseAuthInstance.signOut();
  }

  @override
  Future<void> addUserDetails(
      {required String username, required String email}) async {
    final uid = firebaseAuthInstance.currentUser!.uid;
    if (uid.isNotEmpty) {
      final userDoc = firebaseStore.collection('users').doc(uid);
      UserDetails userDetails = UserDetails(
        email: email,
        username: username,
        uid: uid,
        portfolio: const [],
        profileImage: '',
      );
      await userDoc.set(userDetails.toJson());
    }
  }

  @override
  Future singInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> singInWithAppleID() {
    // TODO: implement singInWithAppleID
    throw UnimplementedError();
  }
}
