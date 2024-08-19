import 'dart:convert'; // Import the dart:convert library for JSON decoding
import 'package:http/http.dart'
    as http; // Import the http package for making HTTP requests

class ConstantFunction {
  // Static method to fetch recipe data from the API
  static Future<List<Map<String, dynamic>>> getRecipeApi(
      String findRecipe) async {
    // API credentials and endpoint
    String id = '49cb6331'; // Application ID
    String key = '4b6042ae8e321fdc3733cda0f792e2d0'; // Application key

    // Construct the API request URL with query parameters
    final response = await http.get(Uri.parse(
        'https://api.edamam.com/search?q=$findRecipe&app_id=$id&app_key=$key&from=0&to=3&calories=591-722&health=alcohol-free'));

    // List to hold the recipe data
    List<Map<String, dynamic>> recipe = [];

    // Check if the HTTP request was successful
    if (response.statusCode == 200) {
      // Parse the JSON response body
      var data = jsonDecode(response.body);

      // Check if 'hits' exists in the response data
      if (data['hits'] != null) {
        // Iterate over each item in 'hits' and add the 'recipe' data to the list
        for (var items in data['hits']) {
          recipe.add(items['recipe']);
        }
      }
      // Return the list of recipes
      return recipe;
    }

    // Return an empty list if the request was not successful
    return recipe;
  }
}
