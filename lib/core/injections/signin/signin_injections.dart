import 'package:flutter_modular/flutter_modular.dart';

import '../../../features/data/data.dart';
import '../../../features/domain/domain.dart';
import '../../../features/presentation/presentation.dart';

class SignInInjections extends Module {
  @override
  void binds(Injector i) {
    /// DataSources injections.
    i.add<SignInDataSource>(
      () => SignInDataSourceImpl(
        firebaseAuth: i.get(),
        googleSignIn: i.get(),
      ),
    );

    /// Repositories injections.
    i.add<SignInRepository>(
      () => SignInRepositoryImpl(
        signInDataSource: i.get(),
      ),
    );

    /// UseCases injections.
    i.add<SignInUseCase>(
      () => SignInUseCaseImpl(
        signInRepository: i.get(),
      ),
    );

    /// Stores injections.
    i.add<SignInStore>(
      () => SignInStore(
        signInUseCase: i.get<SignInUseCase>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SignInPage());
  }
}
