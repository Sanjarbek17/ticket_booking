import 'package:flutter/material.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavbar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home/saved');
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: child,
    );
  }
}
