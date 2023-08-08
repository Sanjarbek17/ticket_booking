import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking/features/events/data/models/event_model.dart';
import 'package:ticket_booking/features/events/presentation/widgets/big_custom_carousel.dart';
import 'package:ticket_booking/features/events/presentation/widgets/small_custom_carousel.dart';

enum EnumCarouselChild { small, big }

class CustomCarousel extends StatefulWidget {
  final double height;
  final double viewPort;
  final List<EventModel> eventModels;
  final EnumCarouselChild child;
  const CustomCarousel({
    super.key,
    required this.height,
    required this.viewPort,
    required this.child,
    required this.eventModels,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        clipBehavior: Clip.none,
        onPageChanged: (index, reason) => setState(() => currentIndex = index),
        height: widget.height,
        // aspectRatio: 16 / 10,
        viewportFraction: widget.viewPort,
        enlargeCenterPage: true,
      ),
      items: widget.eventModels
          .mapIndexed(
            (index, eventModel) => widget.child == EnumCarouselChild.small
                ? CarouselChild(
                    eventModel: eventModel,
                    isSelected: index == currentIndex,
                  )
                : CarouselChildBig(
                    eventModel: eventModel,
                    isSelected: index == currentIndex,
                  ),
          )
          .toList(),
    );
  }
}
