import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/core.dart';

class AppInjections extends Module {
  @override
  void binds(Injector i) {
    /// FirebaseAuth instance.
    i.addSingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker());

    /// FirebaseAuth instance.
    i.addSingleton<FirebaseAuth>(() => FirebaseAuth.instance);

    /// GoogleSignIn instance.
    i.addSingleton<GoogleSignIn>(() => GoogleSignIn());

    /// NetworkCheck instance.
    i.addSingleton<NetworkCheck>(
        () => NetworkCheckImpl(i.get<InternetConnectionChecker>()));
  }

  @override
  void routes(RouteManager r) {
    r.module("/", module: LaunchInjections());
    r.module("/signin/", module: SignInInjections());
    r.module("/home/", module: HomeInjections());
  }
}
