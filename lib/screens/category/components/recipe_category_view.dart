import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/all_recipe_screen.dart';

class RecipeCategoryView extends StatelessWidget {
  const RecipeCategoryView({
    super.key,
    required this.name,
    required this.image,
  });

  final String name, image;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Navigate to the recipe list page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AllRecipeScreen(recipe: name),
          ),
        );
      },
      child: SizedBox(
        height: h * .105,
        width: w * .2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: h * .07,
              width: w * .15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black45),
              ),
            )
          ],
        ),
      ),
    );
  }
}
