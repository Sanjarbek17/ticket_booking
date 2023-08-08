import 'dart:io';

class UserModel {
  final String? firstName;
  final String? lastName;
  final String email;
  final String? username;
  Cookie? crsfToken;
  String? setCookie;

  UserModel({
    this.firstName,
    this.lastName,
    required this.email,
    this.username,
    this.crsfToken,
    this.setCookie,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'username': username,
      'crsfToken': crsfToken?.toString(),
      'setCookie': setCookie,
    };
  }
}
