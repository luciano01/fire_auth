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
  String? errorMessage;

  @observable
  bool isLoading = false;

  @observable
  bool isShowPassword = false;

  @observable
  String email = '';

  @observable
  String password = '';

  /// Update Email value.
  @action
  updateEmail(String value) => email = value;

  /// Update Password value.
  @action
  updatePassword(String value) => password = value;

  @computed
  bool get isValid => validateEmail() == null && validatePassword() == null;

  @action
  updateIsShowPassword(bool value) => isShowPassword = value;

  /// Validates the email and
  /// returns a message if the email does not contain @
  String? validateEmail() {
    if (!(email.contains('@'))) {
      return 'Invalid Email';
    }
    return null;
  }

  /// Validates the password and
  /// returns a message if the password is less than 6.
  String? validatePassword() {
    if (password.length < 6) {
      return 'Must contain at least 6 characters';
    }
    return null;
  }

  /// Return a User after Sign In by Email and Password.
  @action
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    errorMessage = null;
    Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
      try {
        await _authStore
            .signInWithEmailAndPassword(email: email, password: password)
            .then((user) {
          if (user != null) isLoading = false;
          Modular.to.pushReplacementNamed('/home');
        });
      } on ServerException catch (error) {
        errorMessage = error.message;
      } finally {
        isLoading = false;
      }
    });
  }

  /// /// Return a User after Sign In by GoogleSignIn.
  Future<void> signWithGoogleLogin() async {
    isLoading = true;
    errorMessage = null;
    try {
      await _authStore.signInWithgoogleSignIn().then((user) async {
        if (user != null) isLoading = false;
        Modular.to.pushReplacementNamed('/home');
      });
    } on ServerException catch (error) {
      errorMessage = error.message;
    } finally {
      isLoading = false;
    }
  }
}
