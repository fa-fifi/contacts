import 'package:contacts/controllers/contacts.dart';
import 'package:flutter/material.dart';
import '../services/service_locator.dart';

class SettingsController {
  final sort = ValueNotifier<Sort>(Sort.none);

  void change(Sort newSort) {
    final ContactsController contactsController = getIt<ContactsController>();

    sort.value = newSort;
    contactsController.sortBy(newSort);
  }
}

enum Sort { none, newest, oldest }
