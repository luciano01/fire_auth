import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/core.dart';
import 'features/data/data.dart';
import 'features/domain/domain.dart';
import 'features/presentation/presentation.dart';

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

    /// DataSources injections.
    i.add<CurrentUserDataSource>(
      () => CurrentUserDataSourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
      ),
    );
    i.add<SignInDataSource>(
      () => SignInDataSourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
        googleSignIn: i.get<GoogleSignIn>(),
      ),
    );
    i.add<SignOutDataSource>(
      () => SignOutDataSourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
        googleSignIn: i.get<GoogleSignIn>(),
      ),
    );
    i.add<SignUpDataSource>(
      () => SignUpDataSourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
      ),
    );

    /// Repositories injections.
    i.add<CurrentUserRepository>(
      () => CurrentUserRepositoryImpl(
        currentUserDataSource: i.get<CurrentUserDataSource>(),
      ),
    );
    i.add<SignInRepository>(
      () => SignInRepositoryImpl(
        signInDataSource: i.get<SignInDataSource>(),
      ),
    );
    i.add<SignOutRepository>(
      () => SignOutRepositoryImpl(
        signOutDataSource: i.get<SignOutDataSource>(),
      ),
    );
    i.add<SignUpRepository>(
      () => SignUpRepositoryImpl(
        signUpDataSource: i.get<SignUpDataSource>(),
      ),
    );

    /// UseCases injections.
    i.add<CurrentUserUseCase>(
      () => CurrentUserUseCaseImpl(
        currentUserRepository: i.get<CurrentUserRepository>(),
      ),
    );
    i.add<SignInUseCase>(
      () => SignInUseCaseImpl(
        signInRepository: i.get<SignInRepository>(),
      ),
    );
    i.add<SignOutUsecase>(
      () => SignOutUsecaseImpl(
        signOutRepository: i.get<SignOutRepository>(),
      ),
    );
    i.add<SignUpUsecase>(
      () => SignUpUsecaseImpl(
        signUpRepository: i.get<SignUpRepository>(),
      ),
    );

    /// Stores Injections.
    i.add<AuthStore>(
      () => AuthStore(
        currentUserUseCase: i.get<CurrentUserUseCase>(),
        signInUseCase: i.get<SignInUseCase>(),
        signOutUsecase: i.get<SignOutUsecase>(),
        signUpUsecase: i.get<SignUpUsecase>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.module(
      "/",
      module: LaunchInjections(),
      transition: TransitionType.fadeIn,
    );
    r.module(
      "/signin/",
      module: SignInInjections(),
      transition: TransitionType.rightToLeft,
    );
    r.module(
      "/signup/",
      module: SignUpInjections(),
      transition: TransitionType.rightToLeft,
    );
    r.module(
      "/home/",
      module: HomeInjections(),
      transition: TransitionType.rightToLeft,
    );
  }
}
