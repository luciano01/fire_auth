import 'package:mobx/mobx.dart';

part 'launch_state.g.dart';

class LaunchStore = LaunchState with _$LaunchStore;

abstract class LaunchState with Store {}
