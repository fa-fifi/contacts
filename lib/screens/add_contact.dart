import 'package:contacts/models/contact.dart';
import 'package:flutter/material.dart';
import '../controllers/contacts.dart';
import '../controllers/settings.dart';
import '../services/service_locator.dart';
import '../widgets/avatar.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final ContactsController contactsController = getIt<ContactsController>();
  final SettingsController settingsController = getIt<SettingsController>();
  late final ContactModel newContact = ContactModel(
      user: nameController.text,
      phone: phoneController.text,
      checkin: DateTime.now());

  @override
  void initState() {
    nameController.addListener(
        () => setState(() => newContact.user = nameController.text));
    phoneController.addListener(
        () => setState(() => newContact.phone = phoneController.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Contact'),
          actions: [
            IconButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {
                  contactsController
                    ..add(newContact)
                    ..sortBy(settingsController.sort.value);
                }
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Avatar(
                  contact: newContact,
                  radius: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  autofocus: true,
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_outlined),
                    hintText: 'Phone',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
