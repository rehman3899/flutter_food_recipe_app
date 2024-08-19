import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  // Constructor for CircleButton, accepting an icon and label as required parameters
  const CircleButton({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon; // Icon to display inside the circle
  final String label; // Label text to display below the circle

  @override
  Widget build(BuildContext context) {
    // Retrieve the width and height of the device screen
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    // Build the widget tree
    return Column(
      children: [
        // CircleAvatar widget to create a circular button with an icon
        CircleAvatar(
          radius: w * .06, // Radius of the circle, based on screen width
          backgroundColor: Colors.redAccent, // Background color of the circle
          child: Center(
            child: Icon(icon,
                color: Colors.white), // Center the icon inside the circle
          ),
        ),
        SizedBox(height: h * .005), // Spacing between the circle and the label
        Text(label), // Display the label text below the circle
      ],
    );
  }
}
