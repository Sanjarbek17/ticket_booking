import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/route.dart';

import '../widgets/yellow_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, bottom: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Welcome', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFFEC400), fontSize: 30, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                  Text('Have a better sharing experience', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFFEC400), fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  YellowButton(
                    text: 'Create an account',
                    onPressed: () {
                      context.go(AppRouter.registerRoute);
                    },
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.6)),
                      side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Color(0xFFEDAE10))),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(260, 50)),
                    ),
                    onPressed: () {
                      context.go(AppRouter.loginRoute);
                    },
                    child: const Text('Log In', style: TextStyle(color: Color(0xFFEDAE10), fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
