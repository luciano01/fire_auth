import 'package:flutter_modular/flutter_modular.dart';

import '../../../features/presentation/presentation.dart';

class SignUpInjections extends Module {
  @override
  void binds(Injector i) {
    /// Stores injections.
    i.add<SignUpStore>(
      () => SignUpStore(
        appStore: i.get<AuthStore>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SignUpPage());
  }
}
