import 'package:flutter/material.dart'; // Import the Flutter material package for UI components
import 'package:food_recipe_app/screens/onboarding/onboarding_screen.dart'; // Import the OnboardingScreen widget
import 'package:hive_flutter/adapters.dart'; // Import the Hive package for local storage

void main() async {
  // Ensure that widgets are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local storage with Flutter integration
  await Hive.initFlutter();

  // Open Hive boxes for 'shopping' and 'saved' data storage
  await Hive.openBox('shopping');
  await Hive.openBox('saved');

  // Run the app and set MyApp as the root widget
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner in the app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary color for the app theme
        brightness: Brightness.light, // Set the theme brightness to light
        useMaterial3: true, // Enable Material Design 3
      ),
      home:
          const OnboardingScreen(), // Set the OnboardingScreen as the home screen of the app
    );
  }
}
