part of 'reservation_bloc.dart';

@immutable
sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

final class ReservationLoading extends ReservationState {}

final class ReservationLoaded extends ReservationState {
  final List<EventModel> reservations;

  ReservationLoaded(this.reservations);
}

final class ReservationError extends ReservationState {
  final String message;

  ReservationError(this.message);
}

final class ReservationCreated extends ReservationState {}

final class ReservationUpdated extends ReservationState {}

final class ReservationDeleted extends ReservationState {}

final class ReservationCanceled extends ReservationState {}

final class ReservationAccepted extends ReservationState {}
