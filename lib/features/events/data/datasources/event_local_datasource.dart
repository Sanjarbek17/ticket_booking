import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_booking/features/events/data/models/event_model.dart';

class EventLocalDatasource {
  SharedPreferences sharedPreferences;

  EventLocalDatasource({required this.sharedPreferences});

  /// Get all events
  Future<List<String>> getAllEvents() async {
    final events = sharedPreferences.getStringList('events');
    return events ?? [];
  }

  /// Save all events
  Future<void> saveAllEvents(List<EventModel> events) async {
    await sharedPreferences.setStringList(
      'events',
      events.map((e) => e.toJson().toString()).toList(),
    );
  }

  /// Create a new event
  Future<void> createEvent(String event) async {
    final events = await getAllEvents();
    events.add(event);
    await sharedPreferences.setStringList('events', events);
  }

  /// Search events by name
  Future<List<String>> searchEvents(String query) async {
    final events = await getAllEvents();
    return events.where((element) => element.contains(query)).toList();
  }

  /// update event by id
  Future<void> updateEvent(String event) async {
    final events = await getAllEvents();
    final index = events.indexWhere((element) => element == event);
    events[index] = event;
    await sharedPreferences.setStringList('events', events);
  }

  /// delete event by id
  Future<void> deleteEvent(String event) async {
    final events = await getAllEvents();
    events.remove(event);
    await sharedPreferences.setStringList('events', events);
  }

  /// delete all events
  Future<void> deleteAllEvents() async {
    await sharedPreferences.setStringList('events', []);
  }
}