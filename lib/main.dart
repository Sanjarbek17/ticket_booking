import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:ticket_booking/core/routes/route.dart';
import 'package:ticket_booking/features/reservation/presentation/bloc/reservation_bloc.dart';

import 'features/events/presentation/event_bloc/event_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => sl<AuthCubit>(),
        ),
        BlocProvider<EventBloc>(
          create: (_) => sl<EventBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<ReservationBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Ticket Booking',
        theme: ThemeData(
          primarySwatch: const MaterialColor(
            0xFFFEA400,
            <int, Color>{
              50: Color(0xFFFFF8E1),
              100: Color(0xFFFFECB3),
              200: Color(0xFFFFE082),
              300: Color(0xFFFFD54F),
              400: Color(0xFFFFCA28),
              500: Color(0xFFFEA400),
              600: Color(0xFFFF9100),
              700: Color(0xFFFF6D00),
              800: Color(0xFFFF6D00),
              900: Color(0xFFFF3D00),
            },
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
