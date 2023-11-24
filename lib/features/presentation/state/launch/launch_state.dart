import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/domain.dart';

part 'launch_state.g.dart';

class LaunchStore = LaunchState with _$LaunchStore;

abstract class LaunchState with Store {
  final CurrentUserUseCase _currentUserUseCase;

  LaunchState({required CurrentUserUseCase currentUserUseCase})
      : _currentUserUseCase = currentUserUseCase {
    _getCurrentUserInfor();
  }

  @action
  Future<void> _getCurrentUserInfor() async {
    if (await _currentUserUseCase.currentUser() != null) {
      Modular.to.pushReplacementNamed('/signin');
    }
  }
}
