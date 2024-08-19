import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/detail/widgets/ingredient_item.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key, required this.ingredients});

  final List<dynamic> ingredients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(
        parent: NeverScrollableScrollPhysics()
      ),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        int quantity = ingredients[index]['quantity'].toInt() ?? 1; 
        return IngredientItem(
          quantity: quantity.toString(),
          imageUrl: ingredients[index]['image']??'',
          measure: ingredients[index]['measure']??'',
          food: ingredients[index]['food']??'',
        );
      },
    );
  }
}
