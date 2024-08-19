import 'package:flutter/material.dart'; // Importing Flutter's Material package for UI components.
import 'package:food_recipe_app/screens/home/widgets/tab_bar_widget.dart'; // Importing the TabBarWidget for tabbed navigation.
import 'package:food_recipe_app/common/text_field_widget.dart'; // Importing a custom TextField widget.
import 'package:food_recipe_app/utils/constants/image_string.dart'; // Importing image constants.
import 'package:food_recipe_app/screens/home/widgets/home_app_bar.dart'; // Importing the HomeAppBar widget.
import 'package:food_recipe_app/utils/constants/text_strings.dart'; // Importing text string constants.

class HomeScreen extends StatefulWidget {
  // Declaring a stateful widget for the home screen.
  const HomeScreen(
      {super.key}); // Constructor for HomeScreen with an optional key parameter.

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState(); // Creating the state for HomeScreen.
}

class _HomeScreenState extends State<HomeScreen> {
  // The state class for HomeScreen.
  @override
  Widget build(BuildContext context) {
    // Overriding the build method to define the UI.
    final h =
        MediaQuery.of(context).size.height; // Getting the height of the screen.
    final w =
        MediaQuery.of(context).size.width; // Getting the width of the screen.

    return Scaffold(
      // Creating a Scaffold widget for basic material design layout.
      body: SafeArea(
        // Using SafeArea to ensure content is not obscured by system UI elements.
        child: SingleChildScrollView(
          // Enabling scrolling if the content overflows the screen height.
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20,
                bottom: 15,
                left: 15,
                right: 15), // Adding padding around the content.
            child: Column(
              // Using a Column to stack widgets vertically.
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Aligning children to the start of the column.
              children: [
                const HomeAppBar(), // Adding the custom app bar at the top.
                SizedBox(
                    height: h *
                        0.022), // Adding some vertical space between widgets.
                const TextFieldWidget(), // Adding a custom text field widget.
                SizedBox(height: h * 0.022), // Adding some vertical space.
                Container(
                  height:
                      h * 0.25, // Setting the height of the banner container.
                  width:
                      w, // Setting the width of the banner container to match the screen width.
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(AppImages
                          .homeScreenBanner), // Loading the banner image from assets.
                      fit: BoxFit.fill, // Filling the container with the image.
                    ),
                    borderRadius: BorderRadius.circular(
                        20), // Adding rounded corners to the container.
                  ),
                ),
                SizedBox(height: h * 0.023), // Adding some vertical space.
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Distributing space evenly between child widgets.
                  children: [
                    Text(
                      AppStrings.categories, // Displaying the categories text.
                      style: TextStyle(
                        fontSize: w *
                            .045, // Setting the font size relative to the screen width.
                        fontWeight: FontWeight.bold, // Making the text bold.
                      ),
                    ),
                    const Text(
                        AppStrings.seeAll) // Displaying the "See All" text.
                  ],
                ),
                SizedBox(height: h * 0.022), // Adding some vertical space.
                const TabBarWidget(), // Adding the tab bar widget for recipe categories.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
