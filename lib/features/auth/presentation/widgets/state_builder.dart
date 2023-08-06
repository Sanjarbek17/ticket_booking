
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_cubit/auth_cubit.dart';

class StatusBuilder extends StatelessWidget {
  final AuthCubitState state;
  const StatusBuilder({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.status == AuthStatus.loading) {
      return Container(
        color: Colors.black.withOpacity(0.5),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (state.status == AuthStatus.error) {
      return Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.message,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().reset();
                },
                child: const Text('Try again'),
              )
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
