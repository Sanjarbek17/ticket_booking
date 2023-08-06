import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/route.dart';

import '../widgets/bottom_text.dart';
import '../widgets/custom_back_icon.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/triple_box_icon.dart';
import '../widgets/yellow_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackIcon(),
              Padding(
                padding: const EdgeInsets.all(23.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Row(
                      children: [
                        Text('Sign in ', style: TextStyle(color: Color(0xFF2A2A2A), fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomFormField(
                      labelText: 'Enter your email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomFormField(
                      labelText: 'Enter your password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('Forget password?', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFF44336), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500))],
                    ),
                    const SizedBox(height: 30),
                    YellowButton(
                      text: 'Sign in',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    const CustomDivider(),
                    const SizedBox(height: 20),
                    const TripleBoxIcon(),
                    const SizedBox(height: 20),
                    BottomText(
                      buttonText: 'Sign up',
                      text: 'Don\'t have an account?',
                      onPressed: () => context.go(AppRouter.registerRoute),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
