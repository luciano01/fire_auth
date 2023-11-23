import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_auth/features/domain/domain.dart';

class MockCurrentUserRepository extends Mock implements CurrentUserRepository {}

class MockUser extends Mock implements User {}

void main() {
  late MockCurrentUserRepository mockCurrentUserRepository;
  late MockUser mockUser;
  late CurrentUserUsecaseImpl currentUserUsecaseImpl;

  setUp(() {
    mockCurrentUserRepository = MockCurrentUserRepository();
    mockUser = MockUser();
    currentUserUsecaseImpl = CurrentUserUsecaseImpl(
      currentUserRepository: mockCurrentUserRepository,
    );
  });

  test('Shoudl return a Current Logged Firebase User.', () async {
    when(() => mockCurrentUserRepository.currentUser())
        .thenAnswer((_) async => mockUser);

    final result = await currentUserUsecaseImpl.currentUser();

    expect(result, mockUser);
    verify(() => mockCurrentUserRepository.currentUser());
    verifyNoMoreInteractions(mockCurrentUserRepository);
  });
}
