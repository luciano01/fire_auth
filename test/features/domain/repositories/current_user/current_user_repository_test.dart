import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_auth/features/domain/domain.dart';

class MockSignOutRepository extends Mock implements CurrentUserRepository {}

class MockUser extends Mock implements User {}

void main() {
  late MockSignOutRepository mockSignOutRepository;
  late MockUser mockUser;

  setUp(() {
    mockSignOutRepository = MockSignOutRepository();
    mockUser = MockUser();
  });

  test('Should return an User from Firebase Auth.', () async {
    when(() => mockSignOutRepository.currentUser())
        .thenAnswer((_) async => mockUser);

    final result = await mockSignOutRepository.currentUser();

    expect(result, mockUser);
    verify(() => mockSignOutRepository.currentUser());
  });
}
