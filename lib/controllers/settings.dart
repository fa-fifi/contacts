import 'package:contacts/controllers/contacts.dart';
import 'package:flutter/material.dart';
import '../models/sort.dart';
import '../services/service_locator.dart';

class SettingsController {
  final sort = ValueNotifier<SortEnum>(SortEnum.none);

  void change(SortEnum newSort) {
    final ContactsController contactsController = getIt<ContactsController>();

    sort.value = newSort;
    contactsController.sortBy(newSort);
  }
}
