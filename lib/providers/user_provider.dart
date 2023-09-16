import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/providers/auth_provider.dart';

final userProvider = FutureProvider((ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  User currentUser = FirebaseAuth.instance.currentUser!;
  return await authRepository.getUserDetails(currentUser.uid);
});
