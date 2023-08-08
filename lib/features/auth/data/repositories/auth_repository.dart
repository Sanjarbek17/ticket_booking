import 'package:ticket_booking/features/auth/data/datasources/auth_local_data.dart';
import 'package:ticket_booking/features/auth/data/datasources/auth_remote_data.dart';
import 'package:ticket_booking/features/auth/data/models/user_model.dart';

class AuthRepository {
  final AuthRemoteData authRemoteData;
  final AuthLocalData authLocalData;

  AuthRepository({
    required this.authRemoteData,
    required this.authLocalData,
  });

  // clear cache
  Future<void> clearCache() async {
    await authLocalData.clearCache();
  }

  // get cached user
  Future<UserModel> getCachedUser() async {
    return await authLocalData.getCachedUser();
  }

  // login
  Future<void> login(String email, String password) async {
    // call remote data
    UserModel userModel = await authRemoteData.login(email, password);
    // cache user
    await authLocalData.cacheUser(userModel);
  }

  // register
  Future<void> register(UserModel userModel, String password) async {
    // call remote data
    await authRemoteData.register(userModel, password);
  }

  // reset password
  Future<void> resetPassword(String password) async {
    // call remote data
    await authRemoteData.resetPassword(password);
  }
}
