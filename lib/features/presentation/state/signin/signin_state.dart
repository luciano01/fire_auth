import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../presentation.dart';

part 'signin_state.g.dart';

class SignInStore = SignInState with _$SignInStore;

abstract class SignInState with Store {
  final AuthStore _authStore;

  SignInState({required AuthStore appStore}) : _authStore = appStore;

  @observable
  String errorMessage = "";

  /// Return a User after Sign In by Email and Password.
  @action
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _authStore
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        if (user != null) {}
        Modular.to.pushReplacementNamed('/home');
      });
    } on ServerException catch (error) {
      errorMessage = error.message;
    } finally {
      errorMessage = "";
    }
  }
}
