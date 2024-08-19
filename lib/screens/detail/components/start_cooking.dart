import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class StartCooking {
  // Static method to start cooking by launching a given URL
  static Future<void> startCooking(String url) async {
    // Parse the provided URL string into a Uri object
    final recipe = Uri.parse(url);

    // Attempt to launch the URL using the url_launcher package
    if (!await launchUrl(recipe)) {
      // If the URL cannot be launched, throw an exception with a custom message
      throw Exception(AppStrings.notLaunch);
    }
  }
}
