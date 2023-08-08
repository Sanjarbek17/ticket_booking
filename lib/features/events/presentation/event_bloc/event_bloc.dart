import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ticket_booking/features/events/data/repositories/event_repository.dart';

import '../../data/models/event_model.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventRepository eventRepository;

  EventBloc({required this.eventRepository}) : super(EventInitial()) {
    on<GetAllEventsEvent>((event, emit) async {
      emit(EventLoading());
      try {
        final events = await eventRepository.getAllEvents();
        emit(EventLoaded(events));
      } catch (e) {
        emit(EventError(e.toString()));
      }
    });

    on<SearchEventsEvent>((event, emit) async {
      emit(EventLoading());
      try {
        final events = await eventRepository.searchEvents(event.query);
        emit(EventSearched(events));
      } catch (e) {
        emit(EventError(e.toString()));
      }
    });

    on<CreateEventEvent>((event, emit) async {
      emit(EventLoading());
      try {
        final newEvent = await eventRepository.createEvent(event.event);
        emit(EventCreated(newEvent));
      } catch (e) {
        emit(EventError(e.toString()));
      }
    });

    on<UpdateEventEvent>((event, emit) async {
      emit(EventLoading());
      try {
        final updatedEvent = await eventRepository.updateEvent(event.event);
        emit(EventUpdated(updatedEvent));
      } catch (e) {
        emit(EventError(e.toString()));
      }
    });

    on<DeleteEventEvent>((event, emit) async {
      emit(EventLoading());
      try {
        await eventRepository.deleteEvent(event.id);
        emit(EventDeleted(event.id));
      } catch (e) {
        emit(EventError(e.toString()));
      }
    });
  }
}
