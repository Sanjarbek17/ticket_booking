import 'package:ticket_booking/features/reservation/data/datasources/reserv_remote_datasource.dart';

class ReservRepository {
  ReservRemoteDatasource reservRemoteDatasource;

  ReservRepository({required this.reservRemoteDatasource});

  // create reservation
  Future<void> createReserv(int eventId, int numberOfTickets) async {
    await reservRemoteDatasource.createReserv(eventId, numberOfTickets);
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
  Future<void> updateReserv(int reservId, int eventId, int numberOfTickets) async {
    await reservRemoteDatasource.updateReserv(reservId, eventId, numberOfTickets);
  }

  
}
