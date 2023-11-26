import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../presentation.dart';

part 'signin_state.g.dart';

class SignInStore = SignInState with _$SignInStore;

abstract class SignInState with Store {
  final AppStore _appStore;

  SignInState({required AppStore appStore}) : _appStore = appStore;

  @observable
  String errorMessage = "";

  /// Return a User after Sign In by Email and Password.
  @action
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _appStore
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        if (user != null) {}
        Modular.to.pushReplacementNamed('/home');
      });
    } on ServerException catch (error) {
      errorMessage = error.message;
    }
  }

  /// Disconnect user from Firebase Auth.
  void createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _appStore
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) async {
      if (user != null) {
        Modular.to.pushReplacementNamed('/home/');
      }
    });
  }
}
