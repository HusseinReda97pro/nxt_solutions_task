import 'Stay.dart';
import 'UserTicket.dart';

class Reservation {
  String endDate;
  int id;
  String startDate;
  List<Stay> stays;
  List<UserTicket> userTickets;

  Reservation({
    required this.endDate,
    required this.id,
    required this.startDate,
    required this.stays,
    required this.userTickets,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      endDate: json['end_date'],
      id: json['id'],
      startDate: json['start_date'],
      stays: json['stays'] != null
          ? (json['stays'] as List).map((i) => Stay.fromJson(i)).toList()
          : [],
      userTickets: json['user_tickets'] != null
          ? (json['user_tickets'] as List)
              .map((i) => UserTicket.fromJson(i))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end_date'] = endDate;
    data['id'] = id;
    data['start_date'] = startDate;
    data['stays'] = stays.map((v) => v.toJson()).toList();
    data['user_tickets'] = userTickets.map((v) => v.toJson()).toList();
    return data;
  }
}
