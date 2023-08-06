import 'package:bloc/bloc.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  final AuthRepository authRepository;
  AuthCubitCubit({required this.authRepository}) : super(AuthCubitState());

  // login
  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      // call remote data
      await authRepository.login(email, password);
      // cache user
      emit(state.copyWith(status: AuthStatus.authenticated));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, message: e.toString()));
    }
  }

  // register
  Future<void> register(UserModel userModel, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      // call remote data
      await authRepository.register(userModel, password);
      // cache user
      emit(state.copyWith(status: AuthStatus.authenticated));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, message: e.toString()));
    }
  }

  // reset password
  Future<void> resetPassword(String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      // call remote data
      await authRepository.resetPassword(password);
      // cache user
      emit(state.copyWith(status: AuthStatus.authenticated));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, message: e.toString()));
    }
  }
}