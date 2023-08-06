import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/features/auth/data/repositories/auth_repository.dart';
import 'package:ticket_booking/features/auth/presentation/auth_cubit/auth_cubit.dart';

import 'features/auth/data/datasources/auth_local_data.dart';
import 'features/auth/data/datasources/auth_remote_data.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => AuthCubit(authRepository: sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      authLocalData: sl(),
      authRemoteData: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthLocalData>(
    () => AuthLocalData(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<AuthRemoteData>(
    () => AuthRemoteData(dio: sl()),
  );

  //! Core
  // sl.registerLazySingleton(() => InputConverter());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  BaseOptions options = BaseOptions(
    baseUrl: "https://api.themoviedb.org/3/",
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio(options);

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => sharedPreferences);
}
