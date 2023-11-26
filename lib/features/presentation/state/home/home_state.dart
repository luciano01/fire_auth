import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../presentation.dart';

part 'home_state.g.dart';

class HomeStore = HomeState with _$HomeStore;

abstract class HomeState with Store {
  final AppStore _appStore;

  HomeState({required AppStore appStore}) : _appStore = appStore;

  String get userEmail {
    return _appStore.user?.email ?? "";
  }

  String get userUid {
    return _appStore.user?.uid ?? "";
  }

  /// Disconnect user from Firebase Auth.
  void signOut() async {
    await _appStore.signOut().then((_) {
      Modular.to.pushReplacementNamed('/signin/');
    });
  }
}
