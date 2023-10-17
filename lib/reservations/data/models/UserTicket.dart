import 'TicketUserData.dart';

class UserTicket {
  String gate;
  String seat;
  int ticketId;
  String ticketSystemId;
  String ticketTypeName;
  TicketUserData? ticketUserData;

  UserTicket({
    required this.gate,
    required this.seat,
    required this.ticketId,
    required this.ticketSystemId,
    required this.ticketTypeName,
    this.ticketUserData,
  });

  factory UserTicket.fromJson(Map<String, dynamic> json) {
    return UserTicket(
      gate: json['gate'],
      seat: json['seat'],
      ticketId: json['ticket_id'],
      ticketSystemId: json['ticket_system_id'],
      ticketTypeName: json['ticket_type_name'],
      ticketUserData: json['ticket_user_data'] != null
          ? TicketUserData.fromJson(json['ticket_user_data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gate'] = gate;
    data['seat'] = seat;
    data['ticket_id'] = ticketId;
    data['ticket_system_id'] = ticketSystemId;
    data['ticket_type_name'] = ticketTypeName;
    data['ticket_user_data'] = ticketUserData?.toJson();
    return data;
  }
}
