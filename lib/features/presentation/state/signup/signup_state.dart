import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../presentation.dart';

part 'signup_state.g.dart';

class SignUpStore = SignUpState with _$SignUpStore;

abstract class SignUpState with Store {
  final AuthStore _authStore;

  SignUpState({required AuthStore appStore}) : _authStore = appStore;

  @observable
  String? errorMessage;

  @observable
  bool isLoadingByEmail = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String repeatPassword = '';

  /// Update Email value.
  @action
  updateEmail(String value) => email = value;

  /// Update Password value.
  @action
  updatePassword(String value) => password = value;

  /// Update Repeat Password value.
  @action
  updateRepeatPassword(String value) => repeatPassword = value;

  @computed
  bool get isValid =>
      validateEmail() == null &&
      validatePassword() == null &&
      validateRepeatPassword() == null;

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

  /// Validates if the repeatPassword are equal to password.
  String? validateRepeatPassword() {
    if (repeatPassword.length < 6) {
      return 'Must contain at least 6 characters';
    } else if (repeatPassword != password) {
      return 'The passwords do not match';
    }
    return null;
  }

  /// Return a User after Sign Up by Email and Password.
  @action
  Future<void> createUserWithEmailAndPassword() async {
    isLoadingByEmail = true;
    errorMessage = null;
    Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
      try {
        await _authStore
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((user) {
          if (user != null) isLoadingByEmail = false;
          Modular.to.popUntil((route) => route.isFirst);
          Modular.to.pushReplacementNamed('/home');
        });
      } on ServerException catch (error) {
        errorMessage = error.message;
      } finally {
        isLoadingByEmail = false;
      }
    });
  }

  /// /// Return a User after Sign Up by GoogleSignIn.
  Future<void> signWithGoogleLogin() async {
    // isLoadingByGoogle = true;
    // errorMessage = null;
    // Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
    //   try {
    //     await _authStore.signInWithgoogleSignIn().then((user) async {
    //       if (user != null) isLoadingByGoogle = false;
    //       Modular.to.popUntil((route) => route.isFirst);
    //       Modular.to.pushReplacementNamed('/home');
    //     });
    //   } on ServerException catch (error) {
    //     errorMessage = error.message;
    //   } finally {
    //     isLoadingByGoogle = false;
    //   }
    // });
  }
}
