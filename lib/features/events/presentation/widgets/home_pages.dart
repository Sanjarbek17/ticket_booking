import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../route.dart';
import '../event_bloc/event_bloc.dart';
import 'custom_carousel.dart';
import 'custom_list_builder.dart';
import 'topics_widget.dart';

class FirstPageHome extends StatefulWidget {
  const FirstPageHome({
    super.key,
  });

  @override
  State<FirstPageHome> createState() => _FirstPageHomeState();
}

class _FirstPageHomeState extends State<FirstPageHome> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        if (state is EventInitialState) {
          BlocProvider.of<EventBloc>(context).add(GetAllEventsEvent());
        }
        if (state is EventLoadingState) {
          // TODO: Add shimmer effect
          return const Center(child: CircularProgressIndicator());
        }
        if (state is EventErrorState) {
          return Center(child: Text(state.message));
        }
        if (state is EventLoadedState) {
          return Column(
            children: [
              const SizedBox(height: 20.0),
              Expanded(
                flex: 3,
                child: CustomCarousel(
                  height: 150,
                  viewPort: 0.32,
                  eventModels: state.events,
                  child: EnumCarouselChild.small,
                ),
              ),
              Expanded(
                flex: 7,
                child: CustomCarousel(
                  height: 320,
                  viewPort: 0.72,
                  child: EnumCarouselChild.big,
                  eventModels: state.events,
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class SecondPageHome extends StatelessWidget {
  const SecondPageHome({
    super.key,
    required this.eventModels,
  });

  final List<String> eventModels;
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
