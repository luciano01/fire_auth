import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_auth/features/domain/repositories/repositories.dart';

class MockSignOutRepository extends Mock implements SignOutRepository {}

void main() {
  late MockSignOutRepository mockSignOutRepository;

  setUp(() {
    mockSignOutRepository = MockSignOutRepository();
  });

  test('Shoudl disconnect the user from Firebase Auth.', () async {
    when(() => mockSignOutRepository.signOut())
        .thenAnswer((_) => Future.value(null));

    await mockSignOutRepository.signOut();

    verify(() => mockSignOutRepository.signOut());
  });
}
