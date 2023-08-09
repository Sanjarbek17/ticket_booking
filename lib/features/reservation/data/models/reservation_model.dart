import 'package:ticket_booking/features/events/data/models/event_model.dart';

class ReservationModel {
  final int? id;
  final int? eventId;
  EventModel? eventModel;
  final int numberOfTickets;
  final String? status;

  ReservationModel({
    this.id,
    this.eventId,
    this.eventModel,
    required this.numberOfTickets,
    this.status,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    print('json: $json');
    return ReservationModel(
      id: json['id'],
      eventId: json['event'],
      numberOfTickets: json['number_of_tickets'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event': eventId,
      'number_of_tickets': numberOfTickets,
      'status': status,
    };
  }
}
