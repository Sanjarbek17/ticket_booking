import 'package:dio/dio.dart';
import 'package:ticket_booking/features/events/data/models/event_model.dart';

class EventRemoteDatasource {
  Dio dio;

  EventRemoteDatasource({required this.dio});

  /// Create a new event
  Future<EventModel> createEvent(EventModel event) async {
    final response = await dio.post(
      '/events/create/',
      data: FormData.fromMap(await event.toJson()),
    );
    return EventModel.fromJson(response.data);
  }

  /// Get all events
  Future<List<EventModel>> getAllEvents() async {
    final response = await dio.get('/events/all/');
    return (response.data as List).map((e) => EventModel.fromJson(e)).toList();
  }

  /// Search events by name
  Future<List<EventModel>> searchEvents(String query) async {
    final response = await dio.get('/events/search/?search=$query');
    return (response.data as List).map((e) => EventModel.fromJson(e)).toList();
  }

  /// update event by id
  Future<EventModel> updateEvent(EventModel event) async {
    final response = await dio.put(
      '/events/{id}/${event.id}/update/',
      data: event.toJson(),
    );
    return EventModel.fromJson(response.data);
  }

  /// delete event by id
  Future<void> deleteEvent(String id) async {
    await dio.delete('/events/$id/delete/');
  }
}
