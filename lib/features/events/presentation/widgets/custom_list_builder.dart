import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/features/events/data/models/event_model.dart';
import 'package:ticket_booking/route.dart';

class CustomListBuilder extends StatelessWidget {
  final List<EventModel> eventModel;
  const CustomListBuilder({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: eventModel.length,
        itemBuilder: (context, index) => CustomCard(eventModel: eventModel[index]),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final EventModel eventModel;
  const CustomCard({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(AppRouter.homeFuncDetailsRoute(eventModel.id ?? 0));
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(eventModel.thumbnail),
            ),
            const SizedBox(width: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eventModel.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF161618), fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5.0),
                  Text(eventModel.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF161618), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const Spacer(),
            const Column(
              children: [
                Icon(Icons.bookmark, color: Color(0xFF161618), size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
