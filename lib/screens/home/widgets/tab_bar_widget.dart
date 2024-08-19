import 'package:flutter/material.dart'; // Importing Flutter's Material package for UI components.
import 'package:food_recipe_app/screens/home/widgets/home_tab_bar_view.dart';
import 'package:food_recipe_app/screens/home/widgets/tab_items.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart'; // Importing text string constants.

class TabBarWidget extends StatelessWidget {
  // A stateless widget to display a tab bar.
  const TabBarWidget(
      {super.key}); // Constructor for TabBarWidget with an optional key parameter.

  @override
  Widget build(BuildContext context) {
    // Overriding the build method to define the UI.
    final h =
        MediaQuery.of(context).size.height; // Getting the height of the screen.
    final w =
        MediaQuery.of(context).size.width; // Getting the width of the screen.

    return DefaultTabController(
      // Creating a DefaultTabController to manage the tabs.
      length: 4, // Setting the number of tabs.
      child: Column(
        // Using a Column to stack widgets vertically.
        children: [
          SizedBox(
            // Using SizedBox to give the TabBar a specific height.
            height:
                h * .05, // Setting the height relative to the screen height.
            child: TabBar(
              // Defining the TabBar with four tabs.
              tabs: const [
                // List of TabItems (breakfast, lunch, dinner, quick).
                TabItems(title: AppStrings.breakFast),
                TabItems(title: AppStrings.lunch),
                TabItems(title: AppStrings.dinner),
                TabItems(title: AppStrings.quick),
              ],
              unselectedLabelColor:
                  Colors.red, // Color for unselected tab labels.
              labelColor: Colors.white, // Color for selected tab labels.
              dividerColor:
                  Colors.white, // Color for the divider under the TabBar.
              indicator: BoxDecoration(
                // Customizing the indicator under the selected tab.
                color: Colors.red, // Setting the indicator color.
                borderRadius:
                    BorderRadius.circular(20), // Making the indicator rounded.
              ),
              labelPadding: EdgeInsets.symmetric(
                  horizontal: w * .012), // Adding padding to the tab labels.
            ),
          ),
          SizedBox(height: h * 0.030), // Adding some space below the TabBar.
          SizedBox(
            height: h * .3, // Setting the height for the TabBarView.
            child: const TabBarView(
              // Displaying different content for each tab.
              children: [
                HomeTabBarView(
                    recipe: 'breakfast'), // Tab content for breakfast.
                HomeTabBarView(recipe: 'lunch'), // Tab content for lunch.
                HomeTabBarView(recipe: 'dinner'), // Tab content for dinner.
                HomeTabBarView(
                    recipe: 'quick'), // Tab content for quick recipes.
              ],
            ),
          ),
        ],
      ),
    );
  }
}
