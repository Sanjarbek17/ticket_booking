import 'package:dio/dio.dart';
import 'package:ticket_booking/features/events/data/models/event_model.dart';
import 'package:ticket_booking/features/reservation/data/models/reservation_model.dart';

class ReservRemoteDatasource {
  Dio dio;

  ReservRemoteDatasource({required this.dio});

  /// Get all events
  Future<List<EventModel>> getAllEvents() async {
    final response = await dio.get('/events/all/');
    return (response.data as List).map((e) => EventModel.fromJson(e)).toList();
  }

  Future<List<EventModel>> getReservs() async {
    final response = await dio.get('/reservations/all/');
    final events = await getAllEvents();
    if (response.statusCode == 200) {
      final reservs = (response.data as List).map((e) => events.where((element) => element.id == e['id']).first).toList();
      return reservs;
    } else {
      throw Exception('Error: ${response.data}');
    }
  }

  Future<ReservationModel> getReserv(int id) async {
    final response = await dio.get('/reservations/$id/');
    if (response.statusCode == 200) {
      return ReservationModel.fromJson(response.data);
    } else {
      throw Exception('Error: ${response.data}');
    }
  }

  Future<ReservationModel> createReserv(ReservationModel reservationModel) async {
    final response = await dio.post('/reservations/create/', data: reservationModel.toJson());
    if (response.statusCode == 201) {
      return ReservationModel.fromJson(response.data);
    } else {
      throw Exception('Error: ${response.data}');
    }
  }

  Future<ReservationModel> updateReserv(ReservationModel reservationModel) async {
    final response = await dio.put('/reservations/${reservationModel.id}/', data: reservationModel.toJson());
    if (response.statusCode == 200) {
      return ReservationModel.fromJson(response.data);
    } else {
      throw Exception('Error: ${response.data}');
    }
  }

  Future<void> cancelReserv(int id) async {
    final response = await dio.delete('/reservations/$id/');
    if (response.statusCode != 204) {
      throw Exception('Error: ${response.data}');
    }
  }

  // pay reserv
  Future<ReservationModel> payReserv(int reservId) async {
    final response = await dio.put('/reservations/$reservId/pay/');
    if (response.statusCode == 200) {
      return ReservationModel.fromJson(response.data);
    } else {
      throw Exception('Error: ${response.data}');
    }
  }
}
