import 'package:fire_auth/features/presentation/presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'launch_state.g.dart';

class LaunchStore = LaunchState with _$LaunchStore;

abstract class LaunchState with Store {
  final AuthStore _authStore;

  LaunchState({required AuthStore appStore}) : _authStore = appStore {
    checkIfUserIsLogged();
  }

  /// Verify if the User is logged
  /// If is true, go to HomePage
  /// If is false, fo to SignIn
  void checkIfUserIsLogged() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (_authStore.isLogged) {
        Modular.to.pushReplacementNamed('/home/');
      } else {
        Modular.to.pushReplacementNamed('/signin/');
      }
    });
  }
}
