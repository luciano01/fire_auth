abstract class SignOutRepository {
  /// Disconnect user from Firebase Auth.
  Future<void> signOut();
}
