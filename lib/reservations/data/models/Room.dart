import 'Guest.dart';

class Room {
  List<Guest> guests;
  int roomCapacity;
  String roomNumber;
  String roomTypeName;
  String stayName;

  Room({
    required this.guests,
    required this.roomCapacity,
    required this.roomNumber,
    required this.roomTypeName,
    required this.stayName,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      guests: json['guests'] != null
          ? (json['guests'] as List).map((i) => Guest.fromJson(i)).toList()
          : [],
      roomCapacity: json['room_capacity'],
      roomNumber: json['room_number'],
      roomTypeName: json['room_type_name'],
      stayName: json['stay_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['room_capacity'] = roomCapacity;
    data['room_number'] = roomNumber;
    data['room_type_name'] = roomTypeName;
    data['stay_name'] = stayName;
    data['guests'] = guests.map((v) => v.toJson()).toList();
    return data;
  }
}
