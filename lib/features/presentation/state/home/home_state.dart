import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../presentation.dart';

part 'home_state.g.dart';

class HomeStore = HomeState with _$HomeStore;

abstract class HomeState with Store {
  final AuthStore _authStore;

  HomeState({required AuthStore appStore}) : _authStore = appStore;

  String get userEmail {
    return _authStore.user?.email ?? "";
  }

  String get userUid {
    return _authStore.user?.uid ?? "";
  }

  /// Disconnect user from Firebase Auth.
  void signOut() async {
    await _authStore.signOut().then((_) {
      Modular.to.pushReplacementNamed('/signin/');
    });
  }
}
