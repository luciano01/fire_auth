import 'package:mobx/mobx.dart';

part 'home_state.g.dart';

class HomeStore = HomeState with _$HomeStore;

abstract class HomeState with Store {}
