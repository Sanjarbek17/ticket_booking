import 'package:ticket_booking/features/events/data/datasources/event_local_datasource.dart';
import 'package:ticket_booking/features/events/data/datasources/event_remote_datasource.dart';
import 'package:ticket_booking/features/events/data/models/event_model.dart';

class EventRepository {
  EventLocalDatasource eventLocalDatasource;
  EventRemoteDatasource eventRemoteDatasource;

  EventRepository({
    required this.eventLocalDatasource,
    required this.eventRemoteDatasource,
  });

  /// Get all events and save them to local storage
  Future<List<EventModel>> getAllEvents() async {
    final events = await eventRemoteDatasource.getAllEvents();
    await eventLocalDatasource.saveAllEvents(events);
    return events;
  }

  /// Search events by name
  Future<List<EventModel>> searchEvents(String query) async {
    final events = await eventRemoteDatasource.searchEvents(query);
    return events;
  }

  /// Create a new event and save it to local storage
  Future<EventModel> createEvent(EventModel event) async {
    final newEvent = await eventRemoteDatasource.createEvent(event);
    await eventLocalDatasource.createEvent(newEvent.toJson().toString());
    return newEvent;
  }

  /// update event by id and save it to local storage
  Future<EventModel> updateEvent(EventModel event) async {
    final updatedEvent = await eventRemoteDatasource.updateEvent(event);
    await eventLocalDatasource.updateEvent(updatedEvent.toJson().toString());
    return updatedEvent;
  }

  /// delete event by id and save it to local storage
  Future<void> deleteEvent(String id) async {
    await eventRemoteDatasource.deleteEvent(id);
    await eventLocalDatasource.deleteEvent(id);
  }

  /// delete all events and save it to local storage
  Future<void> deleteAllEvents() async {
    await eventLocalDatasource.deleteAllEvents();
  }
}
