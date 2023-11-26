import 'package:fire_auth/features/presentation/presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'launch_state.g.dart';

class LaunchStore = LaunchState with _$LaunchStore;

abstract class LaunchState with Store {
  final AppStore _appStore;

  LaunchState({required AppStore appStore}) : _appStore = appStore {
    checkIfUserIsLogged();
  }

  /// Verify if the User is logged
  /// If is true, go to HomePage
  /// If is false, fo to SignIn
  void checkIfUserIsLogged() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (_appStore.user != null) {
        Modular.to.pushReplacementNamed('/home/');
      } else {
        Modular.to.pushReplacementNamed('/signin/');
      }
    });
  }
}
