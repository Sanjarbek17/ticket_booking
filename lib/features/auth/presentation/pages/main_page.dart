import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/route.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              const Text('Main Page'),
              ElevatedButton(
                onPressed: () {
                  context.go(AppRouter.loginRoute);
                },
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go(AppRouter.registerRoute);
                },
                child: const Text('Register'),
              ),
            ],
          )),
    );
  }
}
