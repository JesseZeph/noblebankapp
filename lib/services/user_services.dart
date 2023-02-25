import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';

class UserService {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final User? _user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    // final name = _user?.displayName;
    // final phoneNumber = _user?.phoneNumber;
    // final img = _user?.photoURL;
    //   final data = value.data()!;
    // return UserModel(
    //   id: _user!.uid,
    //   fullname: name,
    //   phoneNumber: phoneNumber,
    //   profileImgUrl: img,
    // );
    DocumentSnapshot ds =
        await _firestore.collection('Profiles').doc(_user!.uid).get();
    final UserModel user = UserModel(
      id: ds.get('id'),
      fullname: ds.get('fullname'),
      accNo: ds.get('accNo'),
      phoneNumber: ds.get('phoneNumber'),
      profileImgUrl: ds.get('profileImgUrl'),
    );
    log('${user.id}');
    return user;
  }

  // userInfo() async {
  //   DocumentSnapshot ds =
  //       await _firestore.collection('User Profiles').doc(_user!.uid).get();
  //   final String ff = ds.get('field');
  // }
}

final userServiceProvider = Provider<UserService>((ref) => UserService());
final userDetailProvider = FutureProvider<UserModel>(
  (ref) async => await ref.watch(userServiceProvider).getUserDetails(),
);
