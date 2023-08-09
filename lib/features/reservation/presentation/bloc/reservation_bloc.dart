import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
// ignore: unused_import
import 'package:ticket_booking/features/events/data/models/event_model.dart';
import 'package:ticket_booking/features/reservation/data/models/reservation_model.dart';
import 'package:ticket_booking/features/reservation/data/repositories/reserv_repository.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservRepository repository;

  ReservationBloc({required this.repository}) : super(ReservationInitial()) {
    on<GetReservationListEvent>((event, emit) async {
      emit(ReservationLoading());
      try {
        final reservationList = await repository.getAllReserv();
        emit(ReservationLoaded(reservationList));
      } catch (e) {
        emit(ReservationError(e.toString()));
      }
    });

    on<CreateReservationEvent> ((event, emit) async {
      emit(ReservationLoading());
      try {
        await repository.createReserv(event.reservation);
        emit(ReservationCreated());
      } catch (e) {
        emit(ReservationError(e.toString()));
      }
    });

    on<UpdateReservationEvent> ((event, emit) async {
      emit(ReservationLoading());
      try {
        await repository.updateReserv(event.reservation);
        emit(ReservationUpdated());
      } catch (e) {
        emit(ReservationError(e.toString()));
      }
    });

    on<DeleteReservationEvent> ((event, emit) async {
      emit(ReservationLoading());
      try {
        await repository.cancelReserv(event.id);
        emit(ReservationDeleted());
      } catch (e) {
        emit(ReservationError(e.toString()));
      }
    });

    on<PayReservationEvent> ((event, emit) async {
      emit(ReservationLoading());
      try {
        await repository.payReserv(event.id);
        emit(ReservationAccepted());
      } catch (e) {
        emit(ReservationError(e.toString()));
      }
    });

    on<CancelReservationEvent> ((event, emit) async {
      emit(ReservationLoading());
      try {
        await repository.cancelReserv(event.id);
        emit(ReservationCanceled());
      } catch (e) {
        emit(ReservationError(e.toString()));
      }
    });
  }
}
