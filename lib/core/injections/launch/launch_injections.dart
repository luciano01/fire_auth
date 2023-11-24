import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../features/data/data.dart';
import '../../../features/domain/domain.dart';
import '../../../features/presentation/presentation.dart';

class LaunchInjections extends Module {
  @override
  void binds(Injector i) {
    /// DataSources injections.
    i.add<CurrentUserDataSource>(
      () => CurrentUserDataSourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
      ),
    );

    /// Repositories injections.
    i.add<CurrentUserRepository>(
      () => CurrentUserRepositoryImpl(
        currentUserDataSource: i.get<CurrentUserDataSource>(),
      ),
    );

    /// UseCases injections.
    i.add<CurrentUserUseCase>(
      () => CurrentUserUseCaseImpl(
        currentUserRepository: i.get<CurrentUserRepository>(),
      ),
    );

    /// Stores injections.
    i.add<LaunchStore>(
      () => LaunchStore(currentUserUseCase: i.get<CurrentUserUseCase>()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LaunchPage());
  }
}
