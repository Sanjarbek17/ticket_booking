import 'package:go_router/go_router.dart';
import 'package:ticket_booking/features/auth/presentation/pages/main_page.dart';

import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: loginRoute,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: registerRoute,
        builder: (context, state) => const RegisterPage(),
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
