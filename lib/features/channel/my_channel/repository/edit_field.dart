import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editSettingsProvider = Provider((ref) {
  return EditSettingsField(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  );
});

class EditSettingsField {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  EditSettingsField({required this.firestore, required this.auth});

  editDisplayName(String displayName) async {
    try {
      await firestore.collection('users').doc(auth.currentUser!.uid).update({
        'displayName': displayName,
      });
    } catch (error) {
      print(error);
    }
  }

  editUserName(String username) async {
    try {
      await firestore.collection('users').doc(auth.currentUser!.uid).update({
        'username': username,
      });
    } catch (error) {
      print(error);
    }
  }

  editDescription(String description) async {
    try {
      await firestore.collection('users').doc(auth.currentUser!.uid).update({
        'description': description,
      });
    } catch (error) {
      print(error);
    }
  }
}
