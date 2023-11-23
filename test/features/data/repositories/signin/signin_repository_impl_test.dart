import 'package:fire_auth/features/data/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSignInDatasource extends Mock implements SignInDataSource {}

class MockUser extends Mock implements User {}

void main() {
  late MockSignInDatasource mockSignInDataSource;
  late SignInRepositoryImpl signInRepositoryImpl;
  late MockUser mockUser;

  setUp(() {
    mockSignInDataSource = MockSignInDatasource();
    signInRepositoryImpl = SignInRepositoryImpl(
      signInDataSource: mockSignInDataSource,
    );
    mockUser = MockUser();
  });

  test('Should return a User after Sign In by Email and Password.', () async {
    const email = 'user@email.com';
    const password = 'user123';

    when(() => mockSignInDataSource.signInWithEmailAndPassword(
        email: email, password: password)).thenAnswer((_) async => mockUser);

    final user = await signInRepositoryImpl.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    expect(user, mockUser);
    verify(() => mockSignInDataSource.signInWithEmailAndPassword(
          email: email,
          password: password,
        ));
    verifyNoMoreInteractions(mockSignInDataSource);
  });

  test('Should return a User after Sign In by GoogleSignIn.', () async {
    when(() => mockSignInDataSource.googleSignIn())
        .thenAnswer((_) async => mockUser);

    final user = await signInRepositoryImpl.googleSignIn();

    expect(user, mockUser);
    verify(() => mockSignInDataSource.googleSignIn());
    verifyNoMoreInteractions(mockSignInDataSource);
  });
}
