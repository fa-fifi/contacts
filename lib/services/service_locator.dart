import 'package:get_it/get_it.dart';
import '../controllers/contacts.dart';
import '../controllers/settings.dart';

final getIt = GetIt.instance;

void setupGetIt() => getIt
  ..registerLazySingleton<ContactsController>(() => ContactsController())
  ..registerLazySingleton<SettingsController>(() => SettingsController());
