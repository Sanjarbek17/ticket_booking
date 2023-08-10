import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../injection_container.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  final AuthRepository authRepository;
  AuthCubit({required this.authRepository}) : super(AuthCubitState());

  UserModel? userModel;

  // clear cache
  Future<void> clearCache() async {
    await authRepository.clearCache();
    emit(state.copyWith(status: AuthStatus.initial));
  }

  Future<bool> isLogged() async {
    try {
      userModel = await authRepository.getCachedUser();
      sl<Dio>().options.headers['X-CSRFToken'] = userModel!.crsfToken;
      sl<Dio>().options.headers['Cookie'] = userModel!.setCookie;

      emit(state.copyWith(status: AuthStatus.authenticated));
      return true;
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.initial));
      return false;
    }
  }

  // login
  Future<bool> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      // call remote data
      await authRepository.login(email, password);
      // cache user
      emit(state.copyWith(status: AuthStatus.authenticated));
      return true;
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, message: e.toString()));
      return false;
    }
  }

  // register
  Future<bool> register(UserModel userModel, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      // call remote data
      await authRepository.register(userModel, password);
      // cache user
      emit(state.copyWith(status: AuthStatus.unauthenticated));
      return true;
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, message: e.toString()));
      return false;
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

  // reset
  Future<void> reset() async {
    emit(state.copyWith(status: AuthStatus.initial));
  }
}
