import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/datasources/auth_local_data.dart';
import 'features/auth/data/datasources/auth_remote_data.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'features/events/data/datasources/event_local_datasource.dart';
import 'features/events/data/datasources/event_remote_datasource.dart';
import 'features/events/data/repositories/event_repository.dart';
import 'features/events/presentation/event_bloc/event_bloc.dart';
import 'features/reservation/data/datasources/reserv_remote_datasource.dart';
import 'features/reservation/data/repositories/reserv_repository.dart';
import 'features/reservation/presentation/bloc/reservation_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => AuthCubit(authRepository: sl()),
  );

  sl.registerFactory(
    () => EventBloc(eventRepository: sl()),
  );

  sl.registerFactory(
    () => ReservationBloc(repository: sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      authLocalData: sl(),
      authRemoteData: sl(),
    ),
  );

  sl.registerLazySingleton<EventRepository>(
    () => EventRepository(
      eventLocalDatasource: sl(),
      eventRemoteDatasource: sl(),
    ),
  );

  sl.registerLazySingleton<ReservRepository>(
    () => ReservRepository(
      reservRemoteDatasource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthLocalData>(
    () => AuthLocalData(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<AuthRemoteData>(
    () => AuthRemoteData(dio: sl()),
  );

  sl.registerLazySingleton<EventLocalDatasource>(
    () => EventLocalDatasource(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<EventRemoteDatasource>(
    () => EventRemoteDatasource(dio: sl()),
  );

  sl.registerLazySingleton<ReservRemoteDatasource>(
    () => ReservRemoteDatasource(dio: sl()),
  );

  //! Core
  // sl.registerLazySingleton(() => InputConverter());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  BaseOptions options = BaseOptions(
    baseUrl: "http://127.0.0.1:8000/",
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  // cookie manager
  final dio = Dio(options);
  CookieJar cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => dio);
}
