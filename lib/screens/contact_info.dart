import 'package:contacts/models/contact.dart';
import 'package:contacts/services/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/avatar.dart';

class ContactInfoScreen extends StatefulWidget {
  final ContactModel contact;

  const ContactInfoScreen({super.key, required this.contact});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  late final TextEditingController nameController =
      TextEditingController(text: widget.contact.user);
  late final TextEditingController phoneController =
      TextEditingController(text: widget.contact.phone);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact Info'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Avatar(
                      contact: widget.contact,
                      radius: 50,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.contact.user,
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Mobile',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text(
                  widget.contact.phone,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () =>
                            UrlLauncherService.sms(widget.contact.phone),
                        icon: const Icon(Icons.sms_outlined)),
                    IconButton(
                        onPressed: () =>
                            UrlLauncherService.call(widget.contact.phone),
                        icon: const Icon(Icons.call_outlined))
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Date Added',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text(
                  DateFormat('d MMM y hh:mm a').format(widget.contact.checkin),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
