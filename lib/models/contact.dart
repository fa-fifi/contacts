class ContactModel {
  String user;
  String phone;
  final DateTime checkin;

  ContactModel(
      {required this.user, required this.phone, required this.checkin});

  ContactModel.fromJson(Map<String, dynamic> json)
      : user = json['user'],
        phone = json['phone'],
        checkin = DateTime.parse(json['check-in']);
}
