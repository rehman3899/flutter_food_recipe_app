import 'dart:convert';

import 'package:http/http.dart' as http;

class ConstantFunction {
  static Future<List<Map<String, dynamic>>> getRecipeApi(String findRecipe) async {
    String id = '49cb6331';
    String key = '4b6042ae8e321fdc3733cda0f792e2d0';
    final response = await http.get(Uri.parse(
        'https://api.edamam.com/search?q=$findRecipe&app_id=$id&app_key=$key&from=0&to=3&calories=591-722&health=alcohol-free'));

    List<Map<String, dynamic>> recipe = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      if (data['hits'] != null) {
        for (var items in data['hits']) {
          recipe.add(items['recipe']);
        }
      }
      return recipe;
    }
    return recipe;
  }
}
