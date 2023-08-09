import 'package:dio/dio.dart';
import 'package:ticket_booking/features/reservation/data/models/reservation_model.dart';

class ReservRemoteDatasource {
  Dio dio;

  ReservRemoteDatasource({required this.dio});

  Future<List<ReservationModel>> getReservs() async {
    final response = await dio.get('/reservations/all/');
    if (response.statusCode == 200) {
      return response.data.map<ReservationModel>((json) => ReservationModel.fromJson(json)).toList();
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

  Future<ReservationModel> createReserv(int eventId, int numberOfTickets) async {
    final response = await dio.post('/reservations/create/', data: {'event_id': eventId, 'number_of_tickets': numberOfTickets});
    if (response.statusCode == 201) {
      return ReservationModel.fromJson(response.data);
    } else {
      throw Exception('Error: ${response.data}');
    }
  }

  Future<ReservationModel> updateReserv(int reservId, int eventId, int numberOfTickets) async {
    final response = await dio.put('/reservations/$reservId/', data: {
      'event_id': eventId,
      'number_of_tickets': numberOfTickets,
    });
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
