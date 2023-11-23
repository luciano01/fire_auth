import 'package:firebase_auth/firebase_auth.dart';

abstract class SignOutDataSource {
  /// Disconnect user from Firebase Auth.
  Future<void> signOut();
}

class SignOutDataSourceImpl implements SignOutDataSource {
  final FirebaseAuth _firebaseAuth;

  SignOutDataSourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
