import 'package:firebase_auth/firebase_auth.dart';

abstract class CurrentUserRepository {
  Future<User?> currentUser();
}
