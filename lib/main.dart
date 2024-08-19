import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/onboarding/onboarding_screen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('shopping');
  await Hive.openBox('saved');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
