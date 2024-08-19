import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:food_recipe_app/screens/all_recipe_screen.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    TextEditingController searchController = TextEditingController();
    return Container(
      height: h * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 2)
        ],
      ),
      child: TextField(
        controller: searchController,
        style: TextStyle(fontSize: w * .04, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: AppStrings.homeTextField,
          hintStyle: TextStyle(
            fontSize: w * .03,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AllRecipeScreen(recipe: searchController.text),
                ),
              );
            },
            child: Icon(
              Icons.search,
              color: Colors.deepOrangeAccent,
              size: w * .07,
            ),
          ),
        ),
      ),
    );
  }
}
