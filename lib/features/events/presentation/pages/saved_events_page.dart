import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/features/events/presentation/widgets/custom_list_builder.dart';
import 'package:ticket_booking/features/events/presentation/widgets/custom_search_bar.dart';

import '../../../../route.dart';

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
          CustomListBuilder(
            onTap: () => context.go(AppRouter.homeSavedDetailsRoute),
          ),
        ],
      ),
    );
  }
}
