import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/all_recipe_screen.dart';

// A stateless widget that displays a category view for recipes.
class RecipeCategoryView extends StatelessWidget {
  // Constructor for RecipeCategoryView, requires a name and an image.
  const RecipeCategoryView({
    super.key,
    required this.name,
    required this.image,
  });

  // The name of the recipe category.
  final String name;

  // The path to the image associated with the recipe category.
  final String image;

  @override
  Widget build(BuildContext context) {
    // Get the height and width of the device screen.
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return GestureDetector(
      // Handle tap events on the category view.
      onTap: () {
        // Navigate to the AllRecipeScreen, passing the category name as a parameter.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AllRecipeScreen(recipe: name),
          ),
        );
      },
      child: SizedBox(
        // Set the dimensions of the category view.
        height: h * .105, // Height as a percentage of screen height.
        width: w * .2, // Width as a percentage of screen width.
        child: Column(
          // Align children of the column with space between them.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // Set the dimensions of the image container.
              height: h * .07, // Height as a percentage of screen height.
              width: w * .15, // Width as a percentage of screen width.
              decoration: BoxDecoration(
                // Apply decoration to the container.
                color: Colors.white, // Background color of the container.
                borderRadius: BorderRadius.circular(10), // Rounded corners.
                image: DecorationImage(
                    image: AssetImage(image), // Load the image from assets.
                    fit: BoxFit
                        .cover), // Scale the image to cover the container.
              ),
            ),
            Center(
              child: Text(
                name, // Display the category name.
                style: const TextStyle(
                    fontWeight: FontWeight.bold, // Bold text.
                    color: Colors.black45), // Text color.
              ),
            )
          ],
        ),
      ),
    );
  }
}
