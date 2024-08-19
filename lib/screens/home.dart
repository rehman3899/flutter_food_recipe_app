import 'package:flutter/material.dart';
import 'package:food_recipe_app/common/bottom_nav_bar.dart';
import 'package:food_recipe_app/screens/home/home_screen.dart';
import 'package:food_recipe_app/screens/category/categories_screen.dart';
import 'package:food_recipe_app/screens/saved/saved_screen.dart';
import 'package:food_recipe_app/screens/search/search_screen.dart';
import 'package:food_recipe_app/screens/shopping/shopping_screen.dart';

class Home extends StatefulWidget {
  // Constructor for the Home widget
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controller to manage the PageView
  late PageController pageController;

  // Index to keep track of the currently selected page
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the PageController with the initial page index
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose of the PageController when the widget is removed from the tree
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom navigation bar for switching between pages
      bottomNavigationBar: BottomNavBar(
        selectedItem: currentIndex, // Highlight the currently selected item
        onTap: (index) {
          // Animate to the selected page
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
          // Update the current index state
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: PageView(
        controller: pageController, // Controller to manage the PageView
        onPageChanged: (index) {
          // Update the current index state when the page changes
          setState(() {
            currentIndex = index;
          });
        },
        physics:
            const NeverScrollableScrollPhysics(), // Disable manual scrolling
        children: const [
          // List of pages for the PageView
          HomeScreen(),
          CategoryScreen(),
          SearchScreen(),
          SavedScreen(),
          ShoppingScreen(),
        ],
      ),
    );
  }
}
