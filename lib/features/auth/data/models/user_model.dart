class UserModel {
  final String? firstName;
  final String? lastName;
  final String email;
  final String? username;
  String? crsfToken;

  UserModel({
    this.firstName,
    this.lastName,
    required this.email,
    this.username,
    this.crsfToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      username: json['username'],
      crsfToken: json['crsfToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'username': username,
      'crsfToken': crsfToken,
    };
  }
}
