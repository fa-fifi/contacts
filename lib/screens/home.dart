import 'package:contacts/models/contact.dart';
import 'package:contacts/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controllers/contacts.dart';
import '../controllers/settings.dart';
import '../models/sort.dart';
import '../services/service_locator.dart';
import '../widgets/avatar.dart';
import 'add_contact.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final ContactsController contactsController = getIt<ContactsController>();
  final SettingsController settingsController = getIt<SettingsController>();

  Widget _buildList(ContactModel contact) {
    return Visibility(
      visible: contact.user.toLowerCase().contains(searchController.text) ||
          contact.phone.toLowerCase().contains(searchController.text),
      child: ListTile(
        onTap: () {},
        leading: Avatar(contact: contact),
        title: Text(
          contact.user,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(contact.phone),
        trailing: Text(
          DateFormat('d MMM y hh:mm a').format(contact.checkin),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  Future<void> _buildDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          title: const Text('Sort by'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: ValueListenableBuilder(
            valueListenable: settingsController.sort,
            builder: (context, value, _) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: SortEnum.values
                    .map((sort) => RadioListTile<SortEnum>(
                        value: sort,
                        groupValue: value,
                        title: Text(sort.name),
                        onChanged: (val) => settingsController.change(sort)))
                    .toList(),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void initState() {
    searchController.addListener(() => setState(() {}));
    contactsController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddContactScreen())),
                icon: const Icon(Icons.add)),
            IconButton(
                onPressed: () => _buildDialog(context),
                icon: const Icon(Icons.filter_list)),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: contactsController.list,
                  builder: (context, value, _) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: value.length,
                      itemBuilder: (context, index) => _buildList(value[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
