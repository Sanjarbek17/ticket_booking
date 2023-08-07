import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavbar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const GNav(
        tabBorderRadius: 14,
        tabs: [
          GButton(icon: Icons.home),
          GButton(icon: Icons.bookmark),
          GButton(icon: Icons.book_online),
          GButton(icon: Icons.notifications),
        ],
      ),
    );
  }
}
