import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_booking/features/events/data/models/event_model.dart';

class CarouselChild extends StatelessWidget {
  final EventModel eventModel;
  final bool isSelected;
  const CarouselChild({
    super.key,
    required this.eventModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        context.go('/home/details/${eventModel.id}');
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: ShapeDecoration(color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(eventModel.thumbnail, fit: BoxFit.cover, filterQuality: FilterQuality.high),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(eventModel.name, textAlign: TextAlign.center, style: TextStyle(color: const Color(0xFF161618), fontSize: isSelected ? 17 : 13, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
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
