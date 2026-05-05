import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theory_project/core/theme/app_theme.dart';
import 'package:theory_project/routes/app_pages.dart';
import 'package:theory_project/bindings/initial_binding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

  runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;

  const MyApp({Key? key, required this.hasSeenOnboarding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Teorias Nerds',
      theme: AppTheme.darkTheme,
      initialBinding: InitialBinding(),
      initialRoute: hasSeenOnboarding ? Routes.HOME : Routes.ONBOARDING,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
