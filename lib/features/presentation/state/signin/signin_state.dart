import 'package:mobx/mobx.dart';

import '../../../domain/domain.dart';

part 'signin_state.g.dart';

class SignInStore = SignInState with _$SignInStore;

abstract class SignInState with Store {
  final SignInUseCase _signInUseCase;

  SignInState({required SignInUseCase signInUseCase})
      : _signInUseCase = signInUseCase;

  void signIn() async {
    _signInUseCase.signInWithEmailAndPassword(
      email: "jaina@email.com",
      password: "jaina123",
    );
  }
}
