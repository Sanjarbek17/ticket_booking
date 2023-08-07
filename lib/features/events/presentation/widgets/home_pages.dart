import 'package:flutter/material.dart';

import 'custom_carousel.dart';
import 'custom_search_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSearchBar(),
        SizedBox(height: 20.0),
        Row(
          children: [],
        )
      ],
    );
  }
}
