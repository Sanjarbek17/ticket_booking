// ignore_for_file: unused_import

import 'package:ticket_booking/features/events/data/models/event_model.dart';
import 'package:ticket_booking/features/reservation/data/datasources/reserv_remote_datasource.dart';
import 'package:ticket_booking/features/reservation/data/models/reservation_model.dart';

class ReservRepository {
  ReservRemoteDatasource reservRemoteDatasource;

  ReservRepository({required this.reservRemoteDatasource});

  // get all reservations
  Future<List<ReservationModel>> getAllReserv() async {
    return await reservRemoteDatasource.getReservs();
  }

  // create reservation
  Future<void> createReserv(ReservationModel reservationModel) async {
    await reservRemoteDatasource.createReserv(reservationModel);
  }

  // pay reservation
  Future<void> payReserv(int reservId) async {
    await reservRemoteDatasource.payReserv(reservId);
  }

  // cancel reservation
  Future<void> cancelReserv(int reservId) async {
    await reservRemoteDatasource.cancelReserv(reservId);
  }

  // update reservation
  Future<void> updateReserv(ReservationModel reservationModel) async {
    await reservRemoteDatasource.updateReserv(reservationModel);
  }


}
