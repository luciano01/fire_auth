import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../features/data/data.dart';
import '../../../features/domain/domain.dart';
import '../../../features/presentation/presentation.dart';

class HomeInjections extends Module {
  @override
  void binds(Injector i) {
    /// DataSources injections.
    i.add<SignOutDataSource>(
      () => SignOutDataSourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
      ),
    );

    /// Repositories injections.
    i.add<SignOutRepository>(
      () => SignOutRepositoryImpl(
        signOutDataSource: i.get<SignOutDataSource>(),
      ),
    );

    /// UseCases injections.
    i.add<SignOutUsecase>(
      () => SignOutUsecaseImpl(
        signOutRepository: i.get<SignOutRepository>(),
      ),
    );

    /// Stores injections.
    i.add<HomeStore>(
      () => HomeStore(
        appStore: i.get<AuthStore>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
