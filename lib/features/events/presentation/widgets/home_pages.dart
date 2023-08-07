import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../route.dart';
import 'custom_carousel.dart';
import 'custom_list_builder.dart';
import 'custom_search_bar.dart';
import 'topics_widget.dart';

class FirstPageHome extends StatelessWidget {
  const FirstPageHome({
    super.key,
    required this.imgPaths,
  });

  final List<String> imgPaths;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSearchBar(),
        const SizedBox(height: 20.0),
        Expanded(
          flex: 3,
          child: CustomCarousel(
            height: 150,
            viewPort: 0.32,
            imgPaths: imgPaths,
            child: EnumCarouselChild.small,
          ),
        ),
        Expanded(
          flex: 7,
          child: CustomCarousel(
            height: 320,
            viewPort: 0.72,
            child: EnumCarouselChild.big,
            imgPaths: imgPaths,
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}

class SecondPageHome extends StatelessWidget {
  const SecondPageHome({
    super.key,
    required this.imgPaths,
  });

  final List<String> imgPaths;
  static const List<String> topics = [
    'Science',
    'Information Technology',
    'Biology',
    'Business',
    'Marketing',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSearchBar(),
        const SizedBox(height: 20.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const ColorTopic(text: 'Topics', isColor: true),
              Container(
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.70, color: const Color(0x4B0E0E0F)),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              ...List.generate(
                topics.length,
                (index) => ColorTopic(text: topics[index]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        CustomListBuilder(
          onTap: () => context.go(AppRouter.homeDetailsRoute),
        ),
      ],
    );
  }
}
