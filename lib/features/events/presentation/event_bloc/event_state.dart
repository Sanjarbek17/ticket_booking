part of 'event_bloc.dart';

@immutable
sealed class EventState {}

final class EventInitialState extends EventState {}

final class EventLoadingState extends EventState {}

final class EventLoadedState extends EventState {
  final List<EventModel> events;
  final EventModel? event;

  EventLoadedState({required this.events, this.event});
}

final class EventErrorState extends EventState {
  final String message;

  EventErrorState(this.message);
}

final class EventCreatedState extends EventState {}

final class EventUpdatedState extends EventState {
  final EventModel event;

  EventUpdatedState(this.event);
}

final class EventDeletedState extends EventState {
  final String id;

  EventDeletedState(this.id);
}

final class EventSearchedState extends EventState {
  final List<EventModel> events;

  EventSearchedState(this.events);
}
