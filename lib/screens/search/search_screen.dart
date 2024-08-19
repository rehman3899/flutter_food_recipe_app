import 'package:flutter/material.dart';
import 'package:food_recipe_app/common/custom_app_bar.dart';
import 'package:food_recipe_app/common/text_field_widget.dart';
import 'package:food_recipe_app/screens/search/components/search_tags.dart'; // Import tags list
import 'package:food_recipe_app/screens/all_recipe_screen.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the height and width of the screen
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      // Custom app bar with a search title and no back button
      appBar: const CustomAppBar(title: AppStrings.search, back: false),
      body: Padding(
        // Add padding around the body of the screen
        padding: EdgeInsets.symmetric(vertical: h * .016, horizontal: w * .032),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextFieldWidget for inputting search queries
            const TextFieldWidget(),
            SizedBox(
                height: h * .04), // Spacer between the text field and the title
            // Title for the search tags section
            Text(
              AppStrings.searchTags,
              style: TextStyle(fontSize: w * .06, fontWeight: FontWeight.bold),
            ),
            // Wrap widget to display tags as buttons
            Wrap(
                spacing: 8, // Spacing between buttons
                children: tags.map((label) {
                  return ElevatedButton(
                    onPressed: () {
                      // Navigate to the AllRecipeScreen when a tag button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllRecipeScreen(recipe: label),
                        ),
                      );
                    },
                    child: Text(label), // Display tag label on the button
                  );
                }).toList())
          ],
        ),
      ),
    );
  }
}
