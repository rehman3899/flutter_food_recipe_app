import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:food_recipe_app/screens/all_recipe_screen.dart';

// A stateless widget that represents a text field with search functionality.
class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the height and width of the device screen.
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    // Create a TextEditingController to manage the input text.
    TextEditingController searchController = TextEditingController();

    return Container(
      // Set the height of the container.
      height: h * 0.06,
      decoration: BoxDecoration(
        // Add rounded corners and a shadow effect to the container.
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 2)
        ],
      ),
      child: TextField(
        // Assign the text controller to the TextField.
        controller: searchController,
        // Set the style of the text within the TextField.
        style: TextStyle(fontSize: w * .04, color: Colors.black),
        decoration: InputDecoration(
          filled: true, // Fill the background of the TextField.
          fillColor: Colors.white, // Set the background color.
          hintText: AppStrings.homeTextField, // Set the hint text.
          hintStyle: TextStyle(
            fontSize: w * .03, // Set the font size of the hint text.
            color: Colors.grey, // Set the color of the hint text.
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 20), // Set padding inside the TextField.
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(12), // Round the corners of the border.
            borderSide: BorderSide.none, // Remove the border line.
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                12), // Round the corners of the focused border.
          ),
          suffixIcon: GestureDetector(
            // Handle tap events on the suffix icon.
            onTap: () {
              // Navigate to the AllRecipeScreen with the search text as a parameter.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AllRecipeScreen(recipe: searchController.text),
                ),
              );
            },
            child: Icon(
              Icons.search, // Set the icon to a search icon.
              color: Colors.deepOrangeAccent, // Set the color of the icon.
              size: w * .07, // Set the size of the icon.
            ),
          ),
        ),
      ),
    );
  }
}
