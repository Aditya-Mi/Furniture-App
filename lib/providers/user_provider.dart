import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/repository/auth_repositroy.dart';

final userProvider = StateProvider((ref) async {
  final user = await AuthRepository().getUserDetails();
  return user;
});
