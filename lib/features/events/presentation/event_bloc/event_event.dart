part of 'event_bloc.dart';

@immutable
sealed class EventEvent {}

class GetAllEventsEvent extends EventEvent {}

class SearchEventsEvent extends EventEvent {
  final String query;

  SearchEventsEvent(this.query);
}

class CreateEventEvent extends EventEvent {
  final EventModel event;

  CreateEventEvent(this.event);
}

class UpdateEventEvent extends EventEvent {
  final EventModel event;

  UpdateEventEvent(this.event);
}

class DeleteEventEvent extends EventEvent {
  final String id;

  DeleteEventEvent(this.id);
}