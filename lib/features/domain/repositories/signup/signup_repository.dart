import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepository {
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
