import 'package:contacts/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../models/contact.dart';

class Avatar extends StatelessWidget {
  final ContactModel contact;
  final double radius;

  const Avatar({super.key, required this.contact, this.radius = 20});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: [
        ...Colors.primaries,
        ...Colors.primaries,
      ][contact.checkin.day][800],
      foregroundColor: Colors.white,
      child: Text(
        contact.user.getInitials(),
        style: TextStyle(fontSize: radius - 5),
      ),
    );
  }
}
