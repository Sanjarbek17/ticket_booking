import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ticket_booking/features/auth/data/models/user_modal.dart';

class AuthRemoteData {
  final Dio dio;

  AuthRemoteData(this.dio);

  Future<UserModel> login(String email, String password) async {
    final response = await dio.post(
      '/user/login/',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      String cookie = Cookie.fromSetCookieValue(response.headers['set-cookie']![0]).name;
      return UserModel(email: email, crsfToken: cookie);
    } else {
      throw Exception('Failed to login ${response.data}');
    }
  }

  Future<UserModel> register(UserModel userModel, String password) async {
    final response = await dio.post('/user/register/', data: {
      ...userModel.toJson(),
      'password': password,
      'password1': password,
    });

    if (response.statusCode == 201) {
      String cookie = Cookie.fromSetCookieValue(response.headers['set-cookie']![0]).name;
      return userModel..crsfToken = cookie;
    } else {
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
