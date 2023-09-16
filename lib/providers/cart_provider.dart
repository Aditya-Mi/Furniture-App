import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/providers/firestore_provider.dart';
import 'package:furniture_app/providers/user_provider.dart';

final cartProvider = StreamProvider((ref) {
  final user = ref.watch(userProvider).value;
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('cart')
      .snapshots();
});

final isInCartProvider = FutureProvider.family((ref, String productId) async {
  final firestoreRespositoryProvider = ref.watch(firestoreProvider);
  final user = ref.watch(userProvider).value;
  return await firestoreRespositoryProvider.isInCart(productId, user!.uid);
});
