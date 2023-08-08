import 'package:go_router/go_router.dart';
import 'package:ticket_booking/features/auth/presentation/pages/main_page.dart';
import 'package:ticket_booking/features/events/presentation/pages/details_page.dart';
import 'package:ticket_booking/features/events/presentation/pages/scaffold_with_navbar.dart';
import 'package:ticket_booking/features/events/presentation/pages/saved_events_page.dart';

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
    initialLocation: homeRoute,
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
        ],
      ),
    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   // final bool loggedIn = loginCubit.state.status == AuthStatus.authenticated;
    //   // final bool loggingIn = state.subloc == '/login';
    //   // print(state.uri);
    //   const bool loggedIn = 5 == 5;
    //   const bool loggingIn = 4 == 4;
    //   if (!loggedIn) {
    //     return loggingIn ? null : '/login';
    //   }
    //   if (loggingIn) {
    //     return '/';
    //   }
    //   return null;
    // },
  );
}
