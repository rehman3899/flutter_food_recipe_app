import 'package:flutter/material.dart';

// This widget creates a custom AppBar with a title and optional back button.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Constructor for CustomAppBar, requiring a title and a boolean to show/hide the back button.
  const CustomAppBar({
    super.key,
    required this.title,
    required this.back,
  });

  // The title to be displayed in the AppBar.
  final String title;

  // A boolean to determine if the back button should be shown.
  final bool back;

  // Define the preferred size for the AppBar. This is used by the Scaffold to layout the AppBar.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // Get the width of the device screen.
    final w = MediaQuery.of(context).size.width;

    return AppBar(
      // Display the title in the AppBar with customized text style.
      title: Text(
        title,
        style: TextStyle(
          fontSize: w * .06, // Set the font size as a percentage of screen width.
          fontWeight: FontWeight.bold, // Make the font bold.
          letterSpacing: 2, // Add spacing between letters.
          color: Colors.white, // Set the text color to white.
        ),
      ),
      // Center the title in the AppBar.
      centerTitle: true,

      // Set the background color of the AppBar.
      backgroundColor: Colors.deepOrangeAccent,

      // Conditionally show the back button based on the `back` boolean.
      leading: back ? const BackButton(color: Colors.white) : Container(),
    );
  }
}
