// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/features/auth/data/models/user_model.dart';

class AuthLocalData {
  SharedPreferences sharedPreferences;

  AuthLocalData({required this.sharedPreferences});

  // clear cache
  Future<void> clearCache() async {
    await sharedPreferences.clear();
  }

  // cache user
  Future<void> cacheUser(UserModel userModel) async {
    await sharedPreferences.setString('user', jsonEncode(userModel.toJson()));
  }

  // get cached user
  Future<UserModel> getCachedUser() async {
    String? user = sharedPreferences.getString('user');
    print(user);
    if (user != null) {
      return UserModel.fromJson(jsonDecode(user));
    } else {
      throw Exception('No user cached');
    }
  }
}
