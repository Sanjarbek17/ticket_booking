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

  Future<List<ReservationModel>> getReservs() async {
    print('started');
    final response = await dio.get('/reservations/all/');
    // print(response.data);
    final events = await getAllEvents();
    print(events);
    if (response.statusCode == 200) {
      List<ReservationModel> reservs = [];
      for (var i in (response.data as List)) {
        print('i not $i');
        ReservationModel reserv = ReservationModel.fromJson(i);
        print(reserv.status);
        reserv.eventModel = events.firstWhere((element) => element.id == reserv.eventId);
        print(reserv.eventId);
        reservs.add(reserv);
      }
      print('done');
      return reservs;
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
    final response = await dio.put('/reservations/${reservationModel.id}/update/', data: reservationModel.toJson());
    if (response.statusCode == 200) {
      return ReservationModel.fromJson(response.data);
    } else {
      throw Exception('Error: ${response.data}');
    }
  }

  Future<void> cancelReserv(int id) async {
    final response = await dio.delete('/reservations/$id/cancel/');
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
