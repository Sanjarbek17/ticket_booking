import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:ticket_booking/features/events/data/repositories/event_repository.dart';

import '../../data/models/event_model.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventRepository eventRepository;

  EventBloc({required this.eventRepository}) : super(EventInitialState()) {
    on<InitialEventEvent>((event, emit) async {
      emit(EventInitialState());
    });

    on<GetAllEventsEvent>((event, emit) async {
      emit(EventLoadingState());
      try {
        final events = await eventRepository.getAllEvents();
        emit(EventLoadedState(events: events));
      } catch (e) {
        emit(EventErrorState(e.toString()));
      }
    });

    on<GetEventByIdEvent>((event, emit) async {
      final events = (state as EventLoadedState).events;
      print(events);
      final eventModel = events.firstWhere((element) => element.id == event.id);
      print(eventModel.toJson());
      emit(EventLoadedState(events: events, event: eventModel));
    });

    on<SearchEventsEvent>((event, emit) async {
      emit(EventLoadingState());
      try {
        final events = await eventRepository.searchEvents(event.query);
        emit(EventSearchedState(events));
      } catch (e) {
        emit(EventErrorState(e.toString()));
      }
    });

    on<CreateEventEvent>((event, emit) async {
      emit(EventLoadingState());
      try {
        await eventRepository.createEvent(event.event);
        emit(EventCreatedState());
      } catch (e) {
        if (e is DioException) {
          print(e.response?.data);
        }
        emit(EventErrorState(e.toString()));
      }
    });

    on<UpdateEventEvent>((event, emit) async {
      emit(EventLoadingState());
      try {
        final updatedEvent = await eventRepository.updateEvent(event.event);
        emit(EventUpdatedState(updatedEvent));
      } catch (e) {
        emit(EventErrorState(e.toString()));
      }
    });

    on<DeleteEventEvent>((event, emit) async {
      emit(EventLoadingState());
      try {
        await eventRepository.deleteEvent(event.id);
        emit(EventDeletedState(event.id));
      } catch (e) {
        emit(EventErrorState(e.toString()));
      }
    });
  }
}
