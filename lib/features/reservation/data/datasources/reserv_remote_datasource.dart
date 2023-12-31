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
    final response = await dio.get('/reservations/all/');
    // print(response.data);
    final events = await getAllEvents();
    if (response.statusCode == 200) {
      List<ReservationModel> reservs = [];
      for (var i in (response.data as List)) {
        ReservationModel reserv = ReservationModel.fromJson(i);
        reserv.eventModel = events.firstWhere((element) => element.id == reserv.eventId);
        reservs.add(reserv);
      }
      return reservs;
    } else {
      throw Exception('Error: ${response.data}');
    }
  }

  Future<ReservationModel> createReserv(ReservationModel reservationModel) async {
    try {
      final response = await dio.post('/reservations/create/', data: reservationModel.toJson());
      if (response.statusCode == 201) {
        return ReservationModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      if (e is DioException) {
        throw Exception('Error: ${e.response!.data}');
      } else {
        throw Exception('Error: ${e.toString()}');
      }
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
  Future<String> payReserv(int reservId) async {
    try {
      final response = await dio.put('/reservations/$reservId/pay/');
      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      if (e is DioException) {
        throw Exception('Error: ${e.response!.data}');
      } else {
        throw Exception('Error: ${e.toString()}');
      }
    }
  }
}
