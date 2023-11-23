import 'package:fire_auth/features/data/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredentials extends Mock implements UserCredential {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredentials mockUserCredentials;
  late MockGoogleSignIn mockGoogleSignIn;
  late SignInDataSourceImpl signInDataSourceImpl;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredentials = MockUserCredentials();
    mockGoogleSignIn = MockGoogleSignIn();
    signInDataSourceImpl = SignInDataSourceImpl(
      firebaseAuth: mockFirebaseAuth,
      googleSignIn: mockGoogleSignIn,
    );
  });

  const email = 'user@email.com';
  const password = 'user123';

  test('Should return a User after Sign In by Email and Password.', () async {
    when(() => mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password)).thenAnswer((_) async => mockUserCredentials);

    final result = await signInDataSourceImpl.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    expect(result, mockUserCredentials.user);
    verify(() => mockFirebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        ));
    verifyNoMoreInteractions(mockFirebaseAuth);
  });
}
