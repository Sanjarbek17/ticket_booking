import 'package:ticket_booking/features/auth/data/datasources/auth_local_data.dart';
import 'package:ticket_booking/features/auth/data/datasources/auth_remote_data.dart';
import 'package:ticket_booking/features/auth/data/models/user_modal.dart';

class AuthRepository {
  final AuthRemoteData authRemoteData;
  final AuthLocalData authLocalData;

  AuthRepository({
    required this.authRemoteData,
    required this.authLocalData,
  });

  // login
  Future<void> login(String email, String password) async {
    // call remote data
    final user = await authRemoteData.login(email, password);
    // cache user
    await authLocalData.cacheUser(user);
  }

  // register
  Future<void> register(UserModel userModel, String password) async {
    // call remote data
    final user = await authRemoteData.register(userModel, password);
    // cache user
    await authLocalData.cacheUser(user);
  }

  // reset password
  Future<void> resetPassword(String password) async {
    // call remote data
    await authRemoteData.resetPassword(password);
  }
}
