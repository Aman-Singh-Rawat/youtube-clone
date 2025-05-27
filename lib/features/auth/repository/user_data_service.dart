import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';

final userDataServiceProvider = Provider(
      (ref) => UserDataService(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class UserDataService {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  UserDataService({required this.auth, required this.firestore});

  addUserDataToFirestore({
    required String displayName,
    required String username,
    required String email,
    required String profilePicture,
    required String description,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      username: username,
      email: email,
      profilePicture: profilePicture,
      subscription: [],
      userId: auth.currentUser!.uid,
      description: description,
      type: 'user',
      videos: 0,
    );
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set(user.toMap());
  }
}
