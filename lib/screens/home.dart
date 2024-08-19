import 'package:flutter/material.dart';
import 'package:food_recipe_app/common/bottom_nav_bar.dart';
import 'package:food_recipe_app/screens/home/home_screen.dart';
import 'package:food_recipe_app/screens/category/categories_screen.dart';
import 'package:food_recipe_app/screens/saved/saved_screen.dart';
import 'package:food_recipe_app/screens/search/search_screen.dart';
import 'package:food_recipe_app/screens/shopping/shopping_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedItem: 0,
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
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
