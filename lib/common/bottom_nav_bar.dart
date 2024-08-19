import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.selectedItem,
    required this.onTap,
  });

  final int selectedItem;
  final Function(int) onTap;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.015,
          vertical: h * 0.01,
        ),
        child: GNav(
          tabs: const [
            GButton(icon: CupertinoIcons.home, text: AppStrings.home),
            GButton(icon: Icons.category, text: AppStrings.categories),
            GButton(icon: CupertinoIcons.search, text: AppStrings.search),
            GButton(icon: CupertinoIcons.bookmark_solid, text: AppStrings.saved1),
            GButton(icon: CupertinoIcons.shopping_cart, text: AppStrings.shopping),
          ],
          onTabChange: widget.onTap,
          selectedIndex: 0,
          gap: 10,
          tabBorderRadius: 100,
          backgroundColor: Colors.grey[100]!,
          activeColor: Colors.white,
          color: Colors.blue[600],
          tabBackgroundGradient: LinearGradient(
              colors: [Colors.blue[600]!, Colors.blueAccent.shade700],
              begin: Alignment.topLeft,
              end: Alignment.topRight),
          iconSize: 30,
          textSize: 18,
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.01,
            vertical: h * 0.01,
          ),
        ),
      ),
    );
  }
}
