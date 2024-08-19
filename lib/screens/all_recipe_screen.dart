import 'package:flutter/material.dart';
import 'package:food_recipe_app/common/custom_app_bar.dart';
import 'package:food_recipe_app/utils/constants/api_constants.dart';
import 'package:food_recipe_app/screens/detail/detail_screen.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class AllRecipeScreen extends StatelessWidget {
  // Constructor to receive the recipe type
  const AllRecipeScreen({super.key, required this.recipe});

  // Recipe type to filter the API call
  final String recipe;

  @override
  Widget build(BuildContext context) {
    // Retrieve the height and width of the screen
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      // Custom app bar with the recipe type as the title and a back button
      appBar: CustomAppBar(title: recipe, back: true),
      body: FutureBuilder(
        // Future to fetch recipes from the API based on the recipe type
        future: ConstantFunction.getRecipeApi(recipe),
        builder: (context, snapshot) {
          // Show a loading spinner while waiting for data
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show an error message if there's an error
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Show a message if no recipes are found
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text(AppStrings.noRecipesFound));
          }

          // Display recipes in a grid layout
          return Padding(
            padding:
                EdgeInsets.only(right: w * .034, left: w * .034, top: h * .03),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 20, // Spacing between rows
                crossAxisSpacing: 10, // Spacing between columns
                childAspectRatio: .6 / 1, // Aspect ratio for each grid item
              ),
              itemCount: snapshot.data!.length, // Number of items in the grid
              itemBuilder: (context, index) {
                // Get the recipe data for the current index
                Map<String, dynamic> snap = snapshot.data![index];
                int time =
                    snap['totalTime'].toInt(); // Total time for the recipe

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the item
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            // GestureDetector to navigate to the detail screen on tap
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(items: snap),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        snap['image']), // Recipe image
                                    fit: BoxFit
                                        .cover, // Cover the entire container
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 7,
                              left: 15,
                              child: Container(
                                height: 20,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Colors
                                      .red, // Background color for the time label
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "${time.toString()} min", // Display the cooking time
                                    style: const TextStyle(
                                      color: Colors.white, // Text color
                                      fontSize: 10, // Font size
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 6),
                          child: Text(
                            snap['label'], // Recipe label
                            style: TextStyle(
                              fontSize:
                                  w * .03, // Font size based on screen width
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
