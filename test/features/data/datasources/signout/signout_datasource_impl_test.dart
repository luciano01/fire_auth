import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_auth/features/data/data.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late SignOutDataSourceImpl signOutDataSourceImpl;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    signOutDataSourceImpl = SignOutDataSourceImpl(
      firebaseAuth: mockFirebaseAuth,
    );
  });

  test('Should disconnect user from Firebase Auth.', () async {
    when(() => mockFirebaseAuth.signOut())
        .thenAnswer((_) => Future.value(null));

    await signOutDataSourceImpl.signOut();

    verify(() => mockFirebaseAuth.signOut());
  });
}
