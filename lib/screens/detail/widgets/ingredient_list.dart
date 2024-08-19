import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/detail/widgets/ingredient_item.dart';

class IngredientList extends StatelessWidget {
  // Constructor for IngredientList, accepting a list of ingredients as a required parameter
  const IngredientList({super.key, required this.ingredients});

  final List<dynamic>
      ingredients; // List of ingredient data passed to the widget

  @override
  Widget build(BuildContext context) {
    // ListView.builder creates a scrollable list of ingredients dynamically
    return ListView.builder(
      physics: const ScrollPhysics(
          parent:
              NeverScrollableScrollPhysics() // Disable scrolling within the ListView
          ),
      itemCount: ingredients
          .length, // Number of items in the list based on the ingredients' length
      itemBuilder: (context, index) {
        // Extract the quantity of the ingredient, converting it to an integer and providing a default value of 1 if null
        int quantity = ingredients[index]['quantity'].toInt() ?? 1;

        // Return an IngredientItem widget for each ingredient in the list
        return IngredientItem(
          quantity: quantity.toString(), // Pass the quantity as a string
          imageUrl: ingredients[index]['image'] ??
              '', // Pass the image URL or an empty string if null
          measure: ingredients[index]['measure'] ??
              '', // Pass the measurement unit or an empty string if null
          food: ingredients[index]['food'] ??
              '', // Pass the food name or an empty string if null
        );
      },
    );
  }
}
