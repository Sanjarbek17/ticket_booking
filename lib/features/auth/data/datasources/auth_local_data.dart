import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/features/auth/data/models/user_model.dart';

class AuthLocalData {
  SharedPreferences sharedPreferences;

  AuthLocalData(this.sharedPreferences);

  // cache user
  Future<void> cacheUser(UserModel userModel) async {
    await sharedPreferences.setString('user', jsonEncode(userModel.toJson()));
  }

  // get cached user
  Future<UserModel> getCachedUser() async {
    String? user = sharedPreferences.getString('user');
    if (user != null) {
      return UserModel.fromJson(jsonDecode(user));
    } else {
      throw Exception('No user cached');
    }
  }
}
