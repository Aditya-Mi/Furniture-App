import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/providers/user_provider.dart';

final addressesProvider = StreamProvider((ref) {
  final user = ref.read(userProvider).value;
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('addresses')
      .snapshots();
});
