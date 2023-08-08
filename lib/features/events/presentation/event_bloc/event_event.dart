part of 'event_bloc.dart';

@immutable
sealed class EventEvent {}

class InitialEventEvent extends EventEvent {}

class GetAllEventsEvent extends EventEvent {}

class GetEventByIdEvent extends EventEvent {
  final int? id;

  GetEventByIdEvent(this.id);
}

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