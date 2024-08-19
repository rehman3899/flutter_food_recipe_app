import 'package:flutter/material.dart'; // Importing Flutter's Material package for UI components.
import 'package:food_recipe_app/utils/constants/text_strings.dart'; // Importing the text constants from the utils directory.

class HomeAppBar extends StatelessWidget {
  // Declaring a stateless widget called HomeAppBar.
  const HomeAppBar(
      {super.key}); // Constructor for HomeAppBar with an optional key parameter.

  @override
  Widget build(BuildContext context) {
    // Overriding the build method to define the UI.
    //final h = MediaQuery.of(context).size.height;  // Getting the height of the screen (commented out).
    final w =
        MediaQuery.of(context).size.width; // Getting the width of the screen.
    return Row(
      // Returning a Row widget to layout its children horizontally.
      children: [
        Text(
          // Displaying a Text widget.
          AppStrings
              .homeAppBarTxt, // The text is retrieved from a constant string.
          style: TextStyle(
            // Defining the text style.
            fontWeight: FontWeight.bold, // Making the text bold.
            fontSize:
                w * 0.07, // Setting the font size relative to the screen width.
            height: 1, // Setting the height of the text line.
          ),
        ),
        const Spacer(), // Adding a Spacer to push the Text widget to the start of the row.
      ],
    );
  }
}
