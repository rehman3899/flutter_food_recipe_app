import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// This widget creates a customizable bottom navigation bar.
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.selectedItem,
    required this.onTap,
  });

  // The index of the currently selected item in the bottom navigation bar.
  final int selectedItem;

  // A callback function that gets called when a tab is tapped.
  final Function(int) onTap;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    // Get the height and width of the device screen.
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      // Set a background color for the bottom navigation bar.
      color: Colors.grey[100],

      child: Padding(
        padding: EdgeInsets.symmetric(
          // Apply padding to the bottom navigation bar.
          horizontal: w * 0.015, // Horizontal padding as a percentage of screen width.
          vertical: h * 0.01,   // Vertical padding as a percentage of screen height.
        ),
        child: GNav(
          // Define the tabs in the bottom navigation bar.
          tabs: const [
            GButton(icon: CupertinoIcons.home, text: AppStrings.home),
            GButton(icon: Icons.category, text: AppStrings.categories),
            GButton(icon: CupertinoIcons.search, text: AppStrings.search),
            GButton(icon: CupertinoIcons.bookmark_solid, text: AppStrings.saved1),
            GButton(icon: CupertinoIcons.shopping_cart, text: AppStrings.shopping),
          ],
          // Handle tab changes using the provided callback.
          onTabChange: widget.onTap,

          // Set the index of the selected tab (can be dynamically updated).
          selectedIndex: widget.selectedItem,

          // Set spacing between tabs.
          gap: 10,

          // Define the border radius for the tabs.
          tabBorderRadius: 100,

          // Set the background color for the navigation bar.
          backgroundColor: Colors.grey[100]!,

          // Set the color for the selected tab.
          activeColor: Colors.white,

          // Set the color for the unselected tabs.
          color: Colors.blue[600],

          // Define a gradient background for the selected tab.
          tabBackgroundGradient: LinearGradient(
              colors: [Colors.blue[600]!, Colors.blueAccent.shade700],
              begin: Alignment.topLeft,
              end: Alignment.topRight
          ),

          // Set the size of the icons in the tabs.
          iconSize: 30,

          // Set the size of the text in the tabs.
          textSize: 18,

          // Apply padding to the tabs within the navigation bar.
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.01, // Horizontal padding as a percentage of screen width.
            vertical: h * 0.01,   // Vertical padding as a percentage of screen height.
          ),
        ),
      ),
    );
  }
}
