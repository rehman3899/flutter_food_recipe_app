import 'package:flutter/material.dart';
import 'package:food_recipe_app/common/custom_app_bar.dart';
import 'package:food_recipe_app/common/share_recipe.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:hive_flutter/adapters.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the height of the screen
    final h = MediaQuery.of(context).size.height;

    // Open the Hive box named 'shopping' to retrieve shopping items
    var myBox = Hive.box('shopping');

    return Scaffold(
      // Custom app bar with a title and no back button
      appBar: const CustomAppBar(title: AppStrings.shopping, back: false),
      body: ValueListenableBuilder(
        // Listens for changes to the Hive box and rebuilds the widget when changes occur
        valueListenable: myBox.listenable(),
        builder: (context, box, _) {
          // Retrieve all items from the Hive box
          var data = box.values.toList();

          return ListView.builder(
            // Builds a list of shopping items
            itemCount: box.length,
            itemBuilder: (context, index) {
              return ListTile(
                // Display each item in a ListTile
                title: Container(
                  height: h * .085, // Set the height of the container
                  padding:
                      const EdgeInsets.all(10), // Padding inside the container
                  decoration: BoxDecoration(
                    color:
                        Colors.grey[300], // Background color of the container
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(data[index]), // Display the shopping item
                      ),
                      // PopupMenuButton to provide options for each item
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return const [
                            // Menu items: share and delete
                            PopupMenuItem(
                                value: 'share', child: Text(AppStrings.share)),
                            PopupMenuItem(
                                value: 'delete',
                                child: Text(AppStrings.delete)),
                          ];
                        },
                        onSelected: (String value) async {
                          // Handle selection of menu items
                          if (value == 'delete') {
                            // Call deleteItem method to remove the item
                            deleteItem(index);
                          } else if (value == 'share') {
                            // Call ShareRecipe.share method to share the item
                            ShareRecipe.share(data[index]);
                          }
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Method to delete an item from the Hive box
  Future<void> deleteItem(int index) async {
    var myBox = Hive.box('shopping');
    await myBox.deleteAt(index); // Delete the item at the given index
  }
}
