import 'dart:math' show Random;
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';
// import 'package:mybankapp/models/user_model.dart';

class AuthService {
  // AuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _authErrorMsg = '';
  bool _isLoading = false;
  String get errorMsg => _authErrorMsg;
  bool get isLoading => _isLoading;

  // Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      _isLoading = true;
      final int accNo = generateAccNo();
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      if (user != null) {
        // state = const RegisterStateSuccess();
        user.updateDisplayName(name);
        // user.updatePhoneNumber(PhoneAuthCredential );
        await _firestore.collection('Profiles').doc(user.uid).set({
          'id': user.uid,
          'accNo': accNo,
          'fullname': name,
          'profileImgUrl': null,
          'phoneNumber': null,
        });
        await _firestore.collection('Accounts').doc(user.uid).set({
          'savings': 0.0,
          'investment': {},
          'emergency': 0.0,
        });
        log(UserModel(id: user.uid, fullname: name, accNo: accNo).id);
        _isLoading = false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.message!.contains('An internal error')) {
        _authErrorMsg = 'An internal error occurred.\nPlease try again';
      } else if (e.message!.contains(
          'A network error (such as timeout, interrupted connection or unreachable host)')) {
        _authErrorMsg = 'network error';
      } else if (e.code == 'weak-password') {
        _authErrorMsg = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _authErrorMsg = 'The account already exists for that email.';
      } else {
        _authErrorMsg = e.message!;
      }
      log(_authErrorMsg);
      _isLoading = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      log('login');
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      if (user != null) {
        user.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.message!.contains(
              'There is no user record corresponding to this identifier') ||
          e.message!.contains(
              'The password is invalid or the user does not have a password')) {
        _authErrorMsg = 'Invalid E-mail or Password';
      } else if (e.message!.contains('An internal error')) {
        _authErrorMsg = 'An internal error occurred.\nPlease try again';
      } else if (e.code == 'user-not-found') {
        _authErrorMsg = 'No user found for that email.';
      } else if (e.message!.contains(
          'A network error (such as timeout, interrupted connection or unreachable host)')) {
        _authErrorMsg = 'network error';
      } else {
        _authErrorMsg = e.message!;
      }
      // state = AuthStateError(_authErrorMsg);
      log(_authErrorMsg);
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      _authErrorMsg = e.message!;
    }
  }

  int generateAccNo() {
    int accNo = 5;
    for (var i = 0; i < 9; i++) {
      accNo *= 10;
      accNo += Random().nextInt(9);
    }
    return accNo;
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
final authStateProvider =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges());
