part of 'event_bloc.dart';

@immutable
sealed class EventState {}

final class EventInitial extends EventState {}

final class EventLoading extends EventState {}

final class EventLoaded extends EventState {
  final List<EventModel> events;

  EventLoaded(this.events);
}

final class EventError extends EventState {
  final String message;

  EventError(this.message);
}

final class EventCreated extends EventState {
  final EventModel event;

  EventCreated(this.event);
}

final class EventUpdated extends EventState {
  final EventModel event;

  EventUpdated(this.event);
}

final class EventDeleted extends EventState {
  final String id;

  EventDeleted(this.id);
}

final class EventSearched extends EventState {
  final List<EventModel> events;

  EventSearched(this.events);
}
