import 'package:firebase_auth/firebase_auth.dart';

import '../../domain.dart';

abstract class CurrentUserUsecase {
  /// Return a Current Logged Firebase User.
  Future<User?> currentUser();
}

class CurrentUserUsecaseImpl implements CurrentUserUsecase {
  final CurrentUserRepository _currentUserRepository;

  CurrentUserUsecaseImpl({required CurrentUserRepository currentUserRepository})
      : _currentUserRepository = currentUserRepository;

  @override
  Future<User?> currentUser() async {
    return await _currentUserRepository.currentUser();
  }
}
