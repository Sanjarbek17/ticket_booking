import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/route.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              const Text('Login Page'),
              ElevatedButton(
                onPressed: () {
                  context.go(AppRouter.registerRoute);
                },
                child: const Text('Log In'),
              ),
            ],
          )),
    );
  }
}
