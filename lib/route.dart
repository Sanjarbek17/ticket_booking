import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/features/auth/presentation/pages/main_page.dart';
import 'package:ticket_booking/features/events/presentation/pages/create_event_page.dart';
import 'package:ticket_booking/features/events/presentation/pages/details_page.dart';
import 'package:ticket_booking/features/events/presentation/pages/scaffold_with_navbar.dart';
import 'package:ticket_booking/features/events/presentation/pages/saved_events_page.dart';

import 'features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/events/presentation/pages/home_page.dart';

class AppRouter {
  // auth
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  // home
  static const String homeRoute = '/home';
  static const String homeDetailsRoute = '/home/details';
  static const String homeSavedRoute = '/saved';
  static const String homeSavedDetailsRoute = '/saved/details';

  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const MainPage(),
        routes: [
          GoRoute(
            path: 'login',
            name: 'login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: 'register',
            name: 'register',
            builder: (context, state) => const RegisterPage(),
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) => ScaffoldWithNavbar(state: state, child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: 'details/:id',
                name: 'homeDetails',
                builder: (context, state) => DetailsPage(
                  id: int.parse(state.pathParameters['id'] ?? '0'),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/saved',
            name: 'saved',
            builder: (context, state) => const SavedEvents(),
            routes: [
              GoRoute(
                path: 'details/:id',
                name: 'savedDetails',
                builder: (context, state) => DetailsPage(
                  id: int.parse(state.pathParameters['id'] ?? '0'),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/create_event',
            name: 'createEvent',
            builder: (context, state) => const CreateEventPage(),
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      AuthCubit authCubit = context.read<AuthCubit>();
      final bool loggedIn = authCubit.state.status == AuthStatus.authenticated;

      final bool loggingIn = state.fullPath == '/login' || state.fullPath == '/register';
      print(state.uri);
      if (!loggedIn) {
        bool value = await authCubit.isLogged();
        if (value) {
          print('redirect to home');
          return '/home';
        } else {
          print('redirect to login');
          return loggingIn ? null : '/login';
        }
      } else if (loggedIn) {
        print('redirect to login');
        return null;
      }
      print('outside');
      return null;
    },
  );
}
