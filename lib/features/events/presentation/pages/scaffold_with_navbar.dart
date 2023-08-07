import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ticket_booking/route.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  final Widget child;
  final GoRouterState state;
  const ScaffoldWithNavbar({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    print('ScaffoldWithNavbar: ${state.fullPath} $state');
    if (state.fullPath == AppRouter.homeDetailsRoute || state.fullPath == AppRouter.homeSavedDetailsRoute) {
      return child;
    }
    return Scaffold(
      body: child,
      bottomNavigationBar: GNav(
        tabBorderRadius: 14,
        tabs: [
          GButton(
            icon: Icons.home,
            onPressed: () {
              context.go('/home');
            },
          ),
          GButton(
            icon: Icons.bookmark,
            onPressed: () {
              context.go(AppRouter.homeSavedRoute);
            },
          ),
          GButton(
            icon: Icons.book_online,
            onPressed: () {
              context.go('/courses');
            },
          ),
          GButton(
            icon: Icons.notifications,
            onPressed: () {
              context.go('/notifications');
            },
          ),
        ],
      ),
    );
  }
}
