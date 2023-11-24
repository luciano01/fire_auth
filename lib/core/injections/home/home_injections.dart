import 'package:flutter_modular/flutter_modular.dart';

import '../../../features/presentation/presentation.dart';

class HomeInjections extends Module {
  @override
  void binds(Injector i) {
    /// Stores injections.
    i.add<HomeStore>(
      () => HomeStore(),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LaunchPage());
  }
}
