// ignore_for_file: constant_identifier_names

enum Currency { USD, UZS, PLN, RUB }

// currency as map
const currencyMap = {
  Currency.USD: 'USD',
  Currency.UZS: 'UZS',
  Currency.PLN: 'PLN',
  Currency.RUB: 'RUB',
};

class EventModel {
  final int? id;
  final String name;
  final String topic;
  final DateTime date;
  final String place;
  final int numberOfSeats;
  final String ticketPrice;
  final Currency currency;
  final String thumbnail;
  final String description;

  EventModel({
    this.id,
    required this.name,
    required this.topic,
    required this.date,
    required this.place,
    required this.numberOfSeats,
    required this.ticketPrice,
    required this.currency,
    required this.thumbnail,
    required this.description,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return EventModel(
      id: json['id'],
      name: json['name'],
      topic: json['topic'],
      date: DateTime.parse(json['date']),
      place: json['place'],
      numberOfSeats: json['number_of_seats'],
      ticketPrice: json['ticket_price'],
      currency: currencyMap.keys.firstWhere((element) => currencyMap[element] == json['currency']),
      thumbnail: json['thumbnail'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? '1',
      'name': name,
      'topic': topic,
      'date': date.toIso8601String(),
      'place': place,
      'number_of_seats': numberOfSeats,
      'ticket_price': ticketPrice,
      'currency': currencyMap[currency],
      'thumbnail': thumbnail,
      'description': description,
    };
  }
}
