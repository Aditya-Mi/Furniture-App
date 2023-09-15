import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteProvider = StreamProvider((ref) {
  User? user = FirebaseAuth.instance.currentUser;
  final userId = user?.uid;
  return FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('favourite')
      .snapshots();
});
