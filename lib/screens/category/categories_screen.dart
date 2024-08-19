import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/category/components/recipe_category_view.dart';
import 'package:food_recipe_app/screens/category/components/category_list.dart';
import 'package:food_recipe_app/screens/all_recipe_screen.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

// A stateless widget that represents the category screen of the app.
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the height and width of the device screen.
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          Colors.grey.withOpacity(.1), // Set background color with opacity.
      body: Padding(
        // Apply padding around the content.
        padding: EdgeInsets.symmetric(horizontal: w * .04),
        child: Column(
          // Align children of the column with space between them.
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * .06), // Add space at the top.
            Text(
              AppStrings.forYou, // Display the title "For You".
              style: TextStyle(
                fontWeight: FontWeight.bold, // Make the font bold.
                fontSize: w *
                    .06, // Set the font size as a percentage of screen width.
              ),
            ),
            SizedBox(height: h * .01), // Add space below the title.
            SizedBox(
              height: h * .106, // Set the height of the category row.
              child: Row(
                // Align children of the row with space between them.
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Create a RecipeCategoryView for each category.
                  RecipeCategoryView(name: names[0], image: images[0]),
                  RecipeCategoryView(name: names[1], image: images[1]),
                  RecipeCategoryView(name: names[2], image: images[2]),
                  RecipeCategoryView(name: names[3], image: images[3]),
                ],
              ),
            ),
            SizedBox(height: h * .02), // Add space below the category row.
            Text(
              AppStrings.forYou, // Display the title "For You" again.
              style: TextStyle(
                fontWeight: FontWeight.bold, // Make the font bold.
                fontSize: w *
                    .055, // Set the font size as a percentage of screen width.
              ),
            ),
            SizedBox(
              height: h * .45, // Set the height of the grid view.
              child: GridView.builder(
                itemCount: categoryImages
                    .length, // Set the number of items in the grid.
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Number of columns in the grid.
                  crossAxisSpacing: h * .01, // Spacing between columns.
                  mainAxisSpacing: w * .021, // Spacing between rows.
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // Handle tap events on the grid items.
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllRecipeScreen(recipe: category[index]),
                        ),
                      );
                    },
                    child: Container(
                      // Style the container for each grid item.
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color.
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners.
                      ),
                      child: Center(
                        child: Column(
                          // Align children of the column with center alignment.
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h * .043, // Height of the image.
                              width: w * .08, // Width of the image.
                              child: Image.asset(
                                categoryImages[
                                    index], // Load the image from assets.
                                fit: BoxFit
                                    .cover, // Scale the image to cover the container.
                              ),
                            ),
                            SizedBox(
                                height: h * .003), // Add space below the image.
                            Text(
                              category[index], // Display the category name.
                              style: const TextStyle(
                                fontWeight:
                                    FontWeight.bold, // Make the font bold.
                                color: Colors.black45, // Set the text color.
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              AppStrings.preference, // Display the title "Preference".
              style: TextStyle(
                fontWeight: FontWeight.bold, // Make the font bold.
                fontSize: w *
                    .055, // Set the font size as a percentage of screen width.
              ),
            ),
            SizedBox(
              height: h * .13, // Set the height of the row for preferences.
              child: Row(
                // Align children of the row with space between them.
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Create a RecipeCategoryView for each preference.
                  RecipeCategoryView(name: AppStrings.easy, image: images[0]),
                  RecipeCategoryView(name: AppStrings.quick, image: images[1]),
                  RecipeCategoryView(
                      name: AppStrings.chicken, image: images[2]),
                  RecipeCategoryView(name: AppStrings.lowFat, image: images[3]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
