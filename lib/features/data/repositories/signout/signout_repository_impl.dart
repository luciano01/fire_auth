import '../../../domain/domain.dart';
import '../../data.dart';

class SignOutRepositoryImpl implements SignOutRepository {
  final SignOutDataSource _signOutDataSource;

  SignOutRepositoryImpl({required SignOutDataSource signOutDataSource})
      : _signOutDataSource = signOutDataSource;
  @override
  Future<void> signOut() async {
    return await _signOutDataSource.signOut();
  }
}
