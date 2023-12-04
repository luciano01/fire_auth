import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../presentation.dart';

part 'home_state.g.dart';

class HomeStore = HomeState with _$HomeStore;

abstract class HomeState with Store {
  final AuthStore _authStore;

  HomeState({required AuthStore appStore}) : _authStore = appStore;

  @observable
  bool isLoading = false;

  String get userEmail {
    return _authStore.user?.email ?? "";
  }

  String get userUid {
    return _authStore.user?.uid ?? "";
  }

  Future<void> signOut() async {
    isLoading = true;
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      try {
        await _authStore.signOut();
        await _authStore.disconnect();
      } on ServerException catch (_) {}
    }).whenComplete(() {
      isLoading = false;
      Modular.to.pushReplacementNamed("/signin/");
    });
  }
}
