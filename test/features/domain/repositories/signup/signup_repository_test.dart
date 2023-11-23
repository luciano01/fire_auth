import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_auth/features/domain/domain.dart';

class MockSignUpRepository extends Mock implements SignUpRepository {}

class MockUser extends Mock implements User {}

void main() {
  late MockSignUpRepository mockSignUpRepository;
  late MockUser mockUser;

  setUp(() {
    mockSignUpRepository = MockSignUpRepository();
    mockUser = MockUser();
  });

  const mockEmail = "user@email.com";
  const mockPassword = "user123";

  test(
      'Shoudl create an Account by Email and Password, and return a Firebase User.',
      () async {
    when(() => mockSignUpRepository.createUserWithEmailAndPassword(
          email: mockEmail,
          password: mockPassword,
        )).thenAnswer((_) async => mockUser);

    final result = await mockSignUpRepository.createUserWithEmailAndPassword(
      email: mockEmail,
      password: mockPassword,
    );

    expect(result, mockUser);
    verify(() => mockSignUpRepository.createUserWithEmailAndPassword(
          email: mockEmail,
          password: mockPassword,
        ));
  });
}
