import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/route.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            const Text('Sign In Page'),
            ElevatedButton(
              onPressed: () {
                context.go(AppRouter.loginRoute);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
