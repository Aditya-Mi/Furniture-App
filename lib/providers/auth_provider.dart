import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/repository/auth_repositroy.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());

final authStateProvider = StreamProvider((ref) {
  return ref.read(authRepositoryProvider).authStateChange;
});
