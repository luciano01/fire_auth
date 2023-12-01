import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_auth/features/domain/repositories/repositories.dart';

class MockSignOutRepository extends Mock implements SignOutRepository {}

void main() {
  late MockSignOutRepository mockSignOutRepository;

  setUp(() {
    mockSignOutRepository = MockSignOutRepository();
  });

  test('Should disconnect the user from Firebase Auth.', () async {
    when(() => mockSignOutRepository.signOut())
        .thenAnswer((_) => Future.value(null));

    await mockSignOutRepository.signOut();

    verify(() => mockSignOutRepository.signOut());
  });

  test('Should disconnect the user from GoogleSignIn.', () async {
    when(() => mockSignOutRepository.disconnect())
        .thenAnswer((_) => Future.value(null));

    await mockSignOutRepository.disconnect();

    verify(() => mockSignOutRepository.disconnect());
  });
}
