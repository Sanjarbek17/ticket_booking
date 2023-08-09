import 'package:flutter/material.dart';
import 'package:ticket_booking/features/events/presentation/widgets/custom_search_bar.dart';
import 'package:ticket_booking/features/reservation/presentation/widgets/custom_resv_builder.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Reservation'),
      ),
      body: const Column(
        children: [
          CustomSearchBar(),
          CustomResvBuilder(eventModel: [])
        ],
      ),
    );
  }
}
