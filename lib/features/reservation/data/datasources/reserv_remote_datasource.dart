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
