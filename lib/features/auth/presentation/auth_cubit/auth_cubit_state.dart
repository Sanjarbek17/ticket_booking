part of 'auth_cubit_cubit.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthCubitState {
  AuthStatus status = AuthStatus.initial;
  String message = '';
  UserModel? user;

  AuthCubitState({
    this.status = AuthStatus.initial,
    this.message = '',
    this.user,
  });

  AuthCubitState copyWith({
    AuthStatus? status,
    String? message,
    UserModel? user,
  }) {
    return AuthCubitState(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
