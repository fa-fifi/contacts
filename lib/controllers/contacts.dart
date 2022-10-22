import 'package:contacts/controllers/settings.dart';
import 'package:contacts/models/contact.dart';
import 'package:contacts/repositories/contacts.dart';
import 'package:flutter/material.dart';

class ContactsController {
  final list = ValueNotifier<List<ContactModel>>(_initialList);

  static const List<ContactModel> _initialList = [];

  Future<void> initialize() async {
    final savedList = await ContactsRepository.getDataset();
    if (savedList != null) {
      list.value = savedList.map((e) => ContactModel.fromJson(e)).toList();
    }
    sortBy(Sort.none);
  }

  void sortBy(Sort sort) {
    if (sort == Sort.newest) {
      list.value.sort((a, b) => a.checkin.compareTo(b.checkin));
    } else if (sort == Sort.oldest) {
      list.value.sort((b, a) => a.checkin.compareTo(b.checkin));
    } else {
      list.value.sort((a, b) => a.user.compareTo(b.user));
    }

    list.value = List.from(list.value);
  }
}
