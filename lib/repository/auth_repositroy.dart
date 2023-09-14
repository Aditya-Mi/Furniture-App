import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.idTokenChanges();
  Future<User?> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('User not found');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Wrong Password');
      } else {
        throw AuthException('An error occured. Please try again late');
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<UserCredential> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
  @override
  String toString() {
    return message;
  }
}
