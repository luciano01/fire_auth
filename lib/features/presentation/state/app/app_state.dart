import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/domain.dart';

part 'app_state.g.dart';

class AppStore = AppState with _$AppStore;

abstract class AppState with Store {
  final CurrentUserUseCase _currentUserUseCase;
  final SignInUseCase _signInUseCase;
  final SignOutUsecase _signOutUsecase;
  final SignUpUsecase _signUpUsecase;

  AppState({
    required CurrentUserUseCase currentUserUseCase,
    required SignInUseCase signInUseCase,
    required SignOutUsecase signOutUsecase,
    required SignUpUsecase signUpUsecase,
  })  : _currentUserUseCase = currentUserUseCase,
        _signInUseCase = signInUseCase,
        _signOutUsecase = signOutUsecase,
        _signUpUsecase = signUpUsecase {
    _currentUserUseCase.currentUser().then((setUser));
  }

  @observable
  User? user;

  @action
  setUser(User? value) {
    user = value;
  }

  /// Return a User after Sign In by Email and Password.
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    user = await _signInUseCase.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }

  /// Create an Account by Email and Password, and return a Firebase User.
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    user = await _signUpUsecase.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return user;
  }

  /// Disconnect user from Firebase Auth.
  Future signOut() async {
    await _signOutUsecase.signOut().whenComplete(() {
      user = null;
    });
  }
}
