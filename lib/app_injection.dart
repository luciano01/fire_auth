import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/core.dart';

class AppInjections extends Module {
  @override
  void binds(Injector i) {
    /// FirebaseAuth instance.
    i.addSingleton<FirebaseAuth>(() => FirebaseAuth.instance);

    /// GoogleSignIn instance.
    i.addSingleton<GoogleSignIn>(() => GoogleSignIn());
  }

  @override
  void routes(RouteManager r) {
    r.module("/", module: LaunchInjections());
  }
}
