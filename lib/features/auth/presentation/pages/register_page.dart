import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_booking/features/auth/presentation/widgets/bottom_text.dart';
import 'package:ticket_booking/features/auth/presentation/widgets/custom_divider.dart';
import 'package:ticket_booking/features/auth/presentation/widgets/triple_box_icon.dart';
import 'package:ticket_booking/features/auth/presentation/widgets/yellow_button.dart';

import '../widgets/custom_back_icon.dart';
import '../widgets/custom_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
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
                        children: [Text('Sign up ', style: TextStyle(color: Color(0xFF2A2A2A), fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.w500))],
                      ),
                      const SizedBox(height: 30),
                      const CustomFormField(labelText: 'Enter your name'),
                      const SizedBox(height: 20),
                      const CustomFormField(labelText: 'Enter your email'),
                      const SizedBox(height: 20),
                      const CustomFormField(labelText: 'Enter your password', obscureText: true),
                      const SizedBox(height: 20),
                      const CustomFormField(labelText: 'Confirm your password', obscureText: true),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/_check-circle.svg'),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'By signing up. you agree to the ', style: TextStyle(color: Color(0xFFB8B8B8), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                  TextSpan(text: 'Terms of service', style: TextStyle(color: Color(0xFFFEC400), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                  TextSpan(text: ' and ', style: TextStyle(color: Color(0xFFB8B8B8), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                  TextSpan(text: 'Privacy policy.', style: TextStyle(color: Color(0xFFFEC400), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      YellowButton(text: 'Sign up', onPressed: () {}),
                      const SizedBox(height: 20),
                      const CustomDivider(),
                      const SizedBox(height: 20),
                      const TripleBoxIcon(),
                      const SizedBox(height: 20),
                      const BottomText(text: 'Already Have account', buttonText: 'Sign in')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
