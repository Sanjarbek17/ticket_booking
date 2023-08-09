import 'package:flutter/material.dart';
import 'package:ticket_booking/core/paints/container_painter.dart';

import '../../../../core/paints/dashed_line_painter.dart';
import '../../../events/data/models/event_model.dart';

class CustomResvBuilder extends StatelessWidget {
  final List<EventModel> eventModel;
  const CustomResvBuilder({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const CustomCard(),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final EventModel? eventModel;
  const CustomCard({
    super.key,
    this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.go(AppRouter.homeFuncDetailsRoute(eventModel.id ?? 0));
      },
      child: CustomPaint(
        painter: ContainerPainter(),
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            // color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: CustomPaint(
            painter: DashedLinePainter(),
            child: const Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bukit', style: TextStyle(color: Color(0xFF161618), fontSize: 17.71, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bukit', style: TextStyle(color: Color(0xFF161618), fontSize: 17.71, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
