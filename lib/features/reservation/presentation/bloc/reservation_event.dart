part of 'reservation_bloc.dart';

@immutable
sealed class ReservationEvent {}

class GetReservationEvent extends ReservationEvent {
  final String id;

  GetReservationEvent(this.id);
}

class GetReservationListEvent extends ReservationEvent {}

class CreateReservationEvent extends ReservationEvent {
  final ReservationModel reservation;

  CreateReservationEvent(this.reservation);
}

class UpdateReservationEvent extends ReservationEvent {
  final ReservationModel reservation;

  UpdateReservationEvent(this.reservation);
}

class DeleteReservationEvent extends ReservationEvent {
  final int id;

  DeleteReservationEvent(this.id);
}

// pay reservation
class PayReservationEvent extends ReservationEvent {
  final int id;

  PayReservationEvent(this.id);
}

// cancel reservation
class CancelReservationEvent extends ReservationEvent {
  final int id;

  CancelReservationEvent(this.id);
}
