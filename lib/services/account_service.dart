import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/account_model.dart';

class AccountService {
  final User? _user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AccountModel?> accountDetails() async {
    try {
      log('geting acc details');
      DocumentSnapshot ds =
          await _firestore.collection('Accounts').doc(_user!.uid).get();
      // log("eeee ${ds.get('savings')}");
      final AccountModel account = AccountModel(
        savings: ds.get('savings'),
        emergency: ds.get('emergency'),
        investment: ds.get('investment'),
      );
      log('done acc details');
      return account;
    } on FirebaseException catch (e) {
      log(e.toString());
      return null;
    }
  }
}

final accountProvider = Provider<AccountService>((ref) => AccountService());
final accountDetailsProvider = FutureProvider<AccountModel?>(
    (ref) => ref.watch(accountProvider).accountDetails());
