import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInRepository {
  /// Return a User after Sign In by Email and Password.
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
