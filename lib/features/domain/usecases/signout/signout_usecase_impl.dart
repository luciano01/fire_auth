import '../../domain.dart';

abstract class SignOutUsecase {
  /// Disconnect user from Firebase Auth.
  Future<void> signOut();
}

class SignOutUsecaseImpl implements SignOutUsecase {
  final SignOutRepository _signOutRepository;

  SignOutUsecaseImpl({required SignOutRepository signOutRepository})
      : _signOutRepository = signOutRepository;

  @override
  Future<void> signOut() async {
    return await _signOutRepository.signOut();
  }
}
