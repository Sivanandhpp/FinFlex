import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:finflex/core/services/database_service.dart';
import 'package:finflex/core/services/error_handler.dart';
import 'package:finflex/core/services/sharedpref_service.dart';
import '../../main.dart';
import 'package:finflex/core/globalvalues/userauth_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  ErrorHandler errHandler = ErrorHandler();
  DatabaseService dbService = DatabaseService();
  SharedPreferencesService spService = SharedPreferencesService();

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.displayName, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      errHandler.fromErrorCode(e, context);
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
    return null;
  }

  Future<User?> createUserWithEmailAndPassword(
      String name,
      String phoneNo,
      String email,
      String password,
      String accountCreationDate,
      BuildContext context) async {
    // globals.userName = name;
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user!.linkWithPhoneNumber(phoneNo);
      credential.user!.updateDisplayName(name);
      userData.setUserData(credential.user!.uid, name, email, phoneNo, password,
          accountCreationDate, 'user', 'null', 'active',0.00, true);
      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      errHandler.fromErrorCode(e, context);
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
    return null;
  }

  Future<void> signOut() async {
    // spService.clearSharedprefUser();
    return await _firebaseAuth.signOut();
  }
}
