import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/features/auth/data/models/user_model.dart';
import 'package:ticket_booking/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:ticket_booking/features/auth/presentation/widgets/bottom_text.dart';
import 'package:ticket_booking/features/auth/presentation/widgets/custom_divider.dart';
import 'package:ticket_booking/features/auth/presentation/widgets/triple_box_icon.dart';
import 'package:ticket_booking/features/auth/presentation/widgets/yellow_button.dart';
import 'package:ticket_booking/core/routes/route.dart';

import '../widgets/custom_back_icon.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/state_builder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AuthCubit, AuthCubitState>(
          builder: (context, state) {
            return Stack(
              children: [
                Container(
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
                              CustomFormField(labelText: 'Enter your name', controller: nameController),
                              const SizedBox(height: 20),
                              CustomFormField(labelText: 'Enter your email', controller: emailController),
                              const SizedBox(height: 20),
                              CustomFormField(labelText: 'Enter your password', controller: passwordController, obscureText: true),
                              const SizedBox(height: 20),
                              CustomFormField(labelText: 'Confirm your password', controller: confirmPasswordController, obscureText: true),
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
                              YellowButton(
                                text: 'Sign up',
                                onPressed: signUp,
                              ),
                              const SizedBox(height: 20),
                              const CustomDivider(),
                              const SizedBox(height: 20),
                              const TripleBoxIcon(),
                              const SizedBox(height: 20),
                              BottomText(
                                text: 'Already Have account',
                                buttonText: 'Sign in',
                                onPressed: () => context.go(AppRouter.loginRoute),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                StatusBuilder(state: state),
              ],
            );
          },
        ),
      ),
    );
  }

  void signUp() async {
    bool isLoggin = await context.read<AuthCubit>().register(
          UserModel(username: nameController.text, email: emailController.text),
          confirmPasswordController.text,
        );
    if (isLoggin) {
      // ignore: use_build_context_synchronously
      context.go(AppRouter.loginRoute);
    }
  }
}
