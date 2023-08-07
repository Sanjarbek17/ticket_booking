import 'package:flutter/material.dart';

import '../widgets/home_pages.dart';

class HomePage extends StatelessWidget {
  static const List<String> imgPaths = [
    'assets/images/bali1 1.png',
    'assets/images/third.png',
    'assets/images/first.png',
  ];

  static const List<Widget> pages = [
    FirstPageHome(imgPaths: imgPaths),
    SecondPageHome(imgPaths: imgPaths),
  ];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEEEE),
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        actions: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('hello Sanjarbek')],
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: pages[1],
    );
  }
}
