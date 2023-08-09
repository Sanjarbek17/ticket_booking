class ReservationModel {
  final int id;
  final int eventId;
  final int numberOfTickets;
  final String? status;

  ReservationModel({
    required this.id,
    required this.eventId,
    required this.numberOfTickets,
     this.status,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      eventId: json['event_id'],
      numberOfTickets: json['number_of_tickets'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_id': eventId,
      'number_of_tickets': numberOfTickets,
      'status': status,
    };
  }
}
