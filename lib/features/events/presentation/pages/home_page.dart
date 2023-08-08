import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/auth_cubit/auth_cubit.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/home_pages.dart';

class HomePage extends StatefulWidget {
  static const List<String> imgPaths = [
    'assets/images/bali1 1.png',
    'assets/images/third.png',
    'assets/images/first.png',
  ];

  static const List<Widget> pages = [
    FirstPageHome(),
    SecondPageHome(eventModels: imgPaths),
  ];

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEEEE),
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('hello Sanjarbek')],
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // clear cache
              context.read<AuthCubit>().clearCache();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CustomSearchBar(
            searchController: searchController,
            onChanged: (p0) => setState(() {
              if (p0.isEmpty) {
                searchController.clear();
              }
            }),
          ),
          Expanded(
            child: searchController.text.isEmpty ? const FirstPageHome() : const SecondPageHome(eventModels: HomePage.imgPaths),
          ),
        ],
      ),
    );
  }
}
