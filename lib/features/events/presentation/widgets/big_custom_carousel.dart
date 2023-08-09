import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/features/events/data/models/event_model.dart';

class CarouselChildBig extends StatelessWidget {
  final EventModel eventModel;
  final bool isSelected;

  const CarouselChildBig({super.key, required this.eventModel, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/home/details/${eventModel.id}');
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          image: DecorationImage(
            image: NetworkImage(eventModel.thumbnail),
            fit: BoxFit.cover,
            colorFilter: !isSelected ? ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken) : null,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(eventModel.name, style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  Text(eventModel.description, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  Transform.translate(
                    offset: const Offset(0, 25),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(minimumSize: const Size(150, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      child: const Text('Explore', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
