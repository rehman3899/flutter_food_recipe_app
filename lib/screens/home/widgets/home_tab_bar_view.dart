import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/detail/detail_screen.dart';
import 'package:food_recipe_app/utils/constants/api_constants.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class HomeTabBarView extends StatelessWidget {
  // A stateless widget to display content for each tab.
  const HomeTabBarView(
      {super.key,
      required this.recipe}); // Constructor with a required recipe parameter.

  final String
      recipe; // The recipe type (breakfast, lunch, etc.) for this view.

  @override
  Widget build(BuildContext context) {
    final h =
        MediaQuery.of(context).size.height; // Getting the height of the screen.
    final w =
        MediaQuery.of(context).size.width; // Getting the width of the screen.

    return FutureBuilder(
      // Using FutureBuilder to fetch recipe data asynchronously.
      future: ConstantFunction.getRecipeApi(
          recipe), // Fetching data from the API based on the recipe type.
      builder: (context, snapshot) {
        // Building the UI based on the API response.
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading spinner if data is still loading.
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData) {
          // Display a message if no data is available.
          return const Center(
            child: Text(AppStrings.noData),
          );
        }
        return SizedBox(
          // Display the list of recipes.
          height: h * .28, // Setting the height of the list.
          child: ListView.separated(
            // Creating a horizontal list of recipes.
            scrollDirection:
                Axis.horizontal, // Scrolling the list horizontally.
            itemBuilder: (context, index) {
              // Building each item in the list.
              Map<String, dynamic> snap =
                  snapshot.data![index]; // Getting the recipe data.
              int time = snap['totalTime'].toInt(); // Getting the cooking time.
              int calories =
                  snap['calories'].toInt(); // Getting the calorie count.

              return Container(
                margin: EdgeInsets.only(
                    right: w *
                        .02), // Adding some margin to the right of each item.
                width: w * .5, // Setting the width of each item.
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Aligning content to the start of the column.
                      children: [
                        InkWell(
                          // Making the image clickable.
                          onTap: () {
                            // Navigate to the detail screen when tapped.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    items:
                                        snap), // Passing the recipe data to the detail screen.
                              ),
                            );
                          },
                          child: Container(
                            // Displaying the recipe image.
                            width: w, // Setting the width of the image.
                            height: h * .17, // Setting the height of the image.
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  15), // Making the image rounded.
                              image: DecorationImage(
                                image: NetworkImage(snap[
                                    'image']), // Loading the image from the network.
                                fit: BoxFit
                                    .fill, // Filling the container with the image.
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                h * .01), // Adding some space below the image.
                        Text(
                          snap['label'], // Displaying the recipe label.
                          style: TextStyle(
                            fontSize: w *
                                .035, // Setting the font size for the label.
                            fontWeight:
                                FontWeight.bold, // Making the label bold.
                          ),
                        ),
                        Text(
                          "calories ${calories.toString()}, ${time.toString()} min", // Displaying calories and cooking time.
                          style: TextStyle(
                            fontSize: w *
                                .03, // Setting the font size for the additional information.
                            color: Colors.grey, // Making the text grey.
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              // Adding a separator between items.
              return const SizedBox(height: 15);
            },
            itemCount:
                snapshot.data!.length, // Setting the total number of items.
          ),
        );
      },
    );
  }
}
