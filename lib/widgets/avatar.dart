import 'package:contacts/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../models/contact.dart';

class Avatar extends StatelessWidget {
  final ContactModel contact;

  const Avatar({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          Colors.primaries[int.parse(contact.phone[contact.phone.length - 1])],
      foregroundColor: Colors.white,
      child: Text(
        contact.user.getInitials(),
      ),
    );
  }
}
