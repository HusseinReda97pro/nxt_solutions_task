class Guest {
  String avatar;
  String firstName;
  String lastName;

  Guest(
      {required this.avatar, required this.firstName, required this.lastName});

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      avatar: json['avatar'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = avatar;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}
