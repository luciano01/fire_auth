import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_auth/features/domain/domain.dart';

class MockSignInRepository extends Mock implements SignInRepository {}

class MockUser extends Mock implements User {}

void main() {
  late MockSignInRepository mockSignInRepository;
  late MockUser mockUser;

  setUp(() {
    mockSignInRepository = MockSignInRepository();
    mockUser = MockUser();
  });

  const mockEmail = "user@email.com";
  const mockPassword = "user123";

  test(
      'Should return a Firebase User after Sign In by Email and Password from Repository.',
      () async {
    when(() => mockSignInRepository.signInWithEmailAndPassword(
          email: mockEmail,
          password: mockPassword,
        )).thenAnswer((_) async => mockUser);

    final user = await mockSignInRepository.signInWithEmailAndPassword(
      email: mockEmail,
      password: mockPassword,
    );

    expect(user, mockUser);
    verify(() => mockSignInRepository.signInWithEmailAndPassword(
          email: mockEmail,
          password: mockPassword,
        ));
  });
}
