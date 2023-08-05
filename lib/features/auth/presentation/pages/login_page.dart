import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_booking/features/auth/presentation/widgets/yellow_button.dart';

import '../widgets/custom_form_field.dart';
import '../widgets/triple_box_icon.dart';

class LoginPage extends StatelessWidget {
  final String mainPageroute = '/';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/angle-left.svg', width: 27, height: 27),
                    const SizedBox(width: 10),
                    const Text('Back', style: TextStyle(color: Color(0xFF414141), fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
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
                  const CustomFormField(labelText: 'Enter your email'),
                  const SizedBox(height: 20),
                  const CustomFormField(labelText: 'Enter your password', obscureText: true),
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
                  const Row(
                    children: [
                      Expanded(flex: 9, child: Divider()),
                      Expanded(
                        flex: 2,
                        child: Text('or', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB8B8B8), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      ),
                      Expanded(flex: 9, child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const TripleBoxIcon(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don’t have an account? ', style: TextStyle(color: Color(0xFF5A5A5A), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Sign Up', style: TextStyle(color: Color(0xFFEDAE10), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
