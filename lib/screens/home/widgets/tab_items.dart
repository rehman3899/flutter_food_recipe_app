import 'package:flutter/material.dart';

class TabItems extends StatelessWidget {
  // A stateless widget for individual tab items.
  const TabItems(
      {super.key,
      required this.title}); // Constructor with a required title parameter.

  final String title; // The title for the tab item.

  @override
  Widget build(BuildContext context) {
    return Container(
      // Using a container to style the tab item.
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.red), // Adding a red border around the tab item.
        borderRadius: BorderRadius.circular(20), // Making the tab item rounded.
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 8), // Adding padding inside the tab item.
        child: Center(
          child: Text(
            title, // Displaying the title.
            style: const TextStyle(
                fontSize: 9.8), // Setting the font size for the title.
          ),
        ),
      ),
    );
  }
}