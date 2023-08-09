import 'package:flutter/material.dart';

import '../widgets/custom_search_bar.dart';

class SavedEvents extends StatefulWidget {
  const SavedEvents({super.key});

  @override
  State<SavedEvents> createState() => _SavedEventsState();
}

class _SavedEventsState extends State<SavedEvents> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Saved Events'),
      ),
      body: Column(
        children: [
          CustomSearchBar(searchController: searchController),
          const SizedBox(height: 20.0),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Saved Events'),
              ],
            ),
          )
          // const CustomListBuilder(
          //   eventModel: [],
          // ),
        ],
      ),
    );
  }
}
