import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/features/auth/presentation/pages/main_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainPage(),
      ),
      // GoRoute(
      //   path: '/login',
      //   pageBuilder: (context, state) => LoginPage(),
      // ),
      // GoRoute(
      //   path: '/register',
      //   pageBuilder: (context, state) => RegisterPage(),
      // ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      // final bool loggedIn = loginCubit.state.status == AuthStatus.authenticated;
      // final bool loggingIn = state.subloc == '/login';
      const bool loggedIn = 5 == 5;
      const bool loggingIn = 4 == 4;
      if (!loggedIn) {
        return loggingIn ? null : '/login';
      }
      if (loggingIn) {
        return '/';
      }
      return null;
    },
  );
}
