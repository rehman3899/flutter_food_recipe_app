
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class StartCooking{

  static Future<void> startCooking(String url) async {
    final recipe = Uri.parse(url);

    if(!await launchUrl(recipe)){
      throw Exception(AppStrings.notLaunch);
    }
  }

}