import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:hive_flutter/adapters.dart';

class IngredientItem extends StatelessWidget {
  // Constructor for IngredientItem, accepting quantity, measure, food, and imageUrl as required parameters
  const IngredientItem({
    super.key,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.imageUrl,
  });

  // Properties representing the ingredient's quantity, measurement unit, food name, and image URL
  final String quantity, measure, food, imageUrl;

  @override
  Widget build(BuildContext context) {
    // Retrieve the height and width of the device's screen
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    // Access the Hive database box named 'shopping' to store shopping list items
    var myBox = Hive.box('shopping');

    // Container widget to display each ingredient item with custom styling
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: h * .01,
          horizontal: w * .001), // Margin around the container
      padding: EdgeInsets.only(
          top: h * .009,
          bottom: h * .009,
          left: h * .008,
          right: w * .06), // Padding inside the container
      decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.2), // Light shadow
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3)) // Shadow position
          ]),
      child: Center(
        // Row to display the image, ingredient details, and an action button
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Spacing between the row's children
          crossAxisAlignment: CrossAxisAlignment
              .center, // Align children in the center vertically
          children: [
            // ClipRRect to display the ingredient's image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl,
                  width: w * .2,
                  height: h * .1,
                  fit: BoxFit.cover), // Display the image
            ),
            // Expanded widget to allow the text to take up available space
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0), // Padding around the text
                child: Text(
                  "$food\n$quantity $measure", // Display the food name, quantity, and measurement unit
                  style: TextStyle(
                      fontSize: w * .04, // Font size based on screen width
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
            ),
            SizedBox(
                width:
                    w * .033), // Space between the text and the action button
            // ValueListenableBuilder to listen for changes in the Hive box
            ValueListenableBuilder(
              valueListenable: myBox
                  .listenable(), // Listen for changes in the 'shopping' box
              builder: (context, box, _) {
                // Check if the ingredient already exists in the shopping list
                bool exist = box.containsKey(food);
                if (exist) {
                  return GestureDetector(
                    // Remove the item from the shopping list if it exists
                    onTap: () {
                      myBox.delete(food);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(AppStrings
                              .itemDeleted), // Show a snackbar when the item is deleted
                        ),
                      );
                    },
                    child: Icon(
                      Icons
                          .done, // Icon to indicate the item is already in the shopping list
                      size: w * .07, // Icon size based on screen width
                      color: Colors.green, // Green color to indicate completion
                    ),
                  );
                } else {
                  return GestureDetector(
                    // Add the item to the shopping list if it doesn't exist
                    onTap: () {
                      String value = '$food $measure $quantity';
                      myBox.put(food, value);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(AppStrings
                              .itemAdded), // Show a snackbar when the item is added
                        ),
                      );
                    },
                    child: Icon(
                      Icons
                          .add_circle_outline_rounded, // Icon to indicate the item can be added
                      size: w * .07, // Icon size based on screen width
                      color: Colors.red, // Red color to indicate adding
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
