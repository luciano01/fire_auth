import 'package:flutter_modular/flutter_modular.dart';

import '../../../features/presentation/presentation.dart';

class SignInInjections extends Module {
  @override
  void binds(Injector i) {
    /// Stores injections.
    i.add<SignInStore>(
      () => SignInStore(
        appStore: i.get<AuthStore>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SignInPage());
  }
}
