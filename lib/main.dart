import 'package:contacts/screens/home.dart';
import 'package:contacts/screens/onboarding.dart';
import 'package:contacts/utils/constants.dart';
import 'package:contacts/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();
  final showHome = pref.getBool('showHome') ?? false;

  setupGetIt();
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({super.key, required this.showHome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: showHome ? const HomeScreen() : const OnboardingScreen(),
    );
  }
}
