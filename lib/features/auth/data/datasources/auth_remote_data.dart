import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ticket_booking/features/auth/data/models/user_model.dart';

import '../../../../injection_container.dart';

class AuthRemoteData {
  final Dio dio;

  AuthRemoteData({required this.dio});

  Future<UserModel> login(String email, String password) async {
    final response = await dio.post(
      '/user/login/',
      data: {
        'username': email,
        'password': password,
      },
    );

    var cookie = response.headers['set-cookie'];
    sl<Dio>().options.headers['X-CSRFToken'] = Cookie.fromSetCookieValue(cookie!.first).value;
    if (response.statusCode != 200) {
      throw Exception('Failed to login ${response.data}');
    }
    return UserModel(
      email: email,
      crsfToken: Cookie.fromSetCookieValue(cookie.first),
      setCookie: "csrftoken=${Cookie.fromSetCookieValue(cookie.first).value}; sessionid=${Cookie.fromSetCookieValue(cookie.last).value}",
    );
  }

  Future<UserModel> register(UserModel userModel, String password) async {
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
    var cookie = response.headers['set-cookie'];
    sl<Dio>().options.headers['X-CSRFToken'] = Cookie.fromSetCookieValue(cookie!.first).value;
    if (response.statusCode != 201) {
      throw Exception('Failed to register ${response.data}');
    }

    return userModel
      ..crsfToken = Cookie.fromSetCookieValue(cookie.first)
      ..setCookie = "csrftoken=${Cookie.fromSetCookieValue(cookie.first).value}; sessionid=${Cookie.fromSetCookieValue(cookie.last).value}";
  }

  Future<UserModel> logout(UserModel userModel) async {
    final response = await dio.post(
      '/user/logout/',
      data: {
        'email': userModel.email,
      },
    );

    if (response.statusCode == 200) {
      return userModel
        ..crsfToken = null
        ..setCookie = null;
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
