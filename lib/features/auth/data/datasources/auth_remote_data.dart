import 'package:dio/dio.dart';
import 'package:ticket_booking/features/auth/data/models/user_model.dart';

class AuthRemoteData {
  final Dio dio;

  AuthRemoteData({required this.dio});

  Future<void> login(String email, String password) async {
    final response = await dio.post(
      '/user/login/',
      data: {
        'username': email,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to login ${response.data}');
    }
  }

  Future<void> register(UserModel userModel, String password) async {
    final response = await dio.post(
      '/user/registration/',
      data: {
        'email': userModel.email,
        'username': userModel.email,
        'first_name': userModel.username,
        'last_name': userModel.username,
        'password': password,
        'password1': password,
      },
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to register ${response.data}');
    }
  }

  Future<UserModel> logout(UserModel userModel) async {
    final response = await dio.post(
      '/user/logout/',
      data: {
        'email': userModel.email,
      },
    );

    if (response.statusCode == 200) {
      return userModel..crsfToken = '';
    } else {
      throw Exception('Failed to logout ${response.data}');
    }
  }

  // reset password
  Future<void> resetPassword(String password) async {
    await dio.post(
      '/user/reset_password/',
      data: {
        'password': password,
        'password1': password,
      },
    );
  }
}
