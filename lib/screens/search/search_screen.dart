import 'package:flutter/material.dart';
import 'package:food_recipe_app/common/custom_app_bar.dart';
import 'package:food_recipe_app/common/text_field_widget.dart';
import 'package:food_recipe_app/screens/search/components/search_tags.dart';
import 'package:food_recipe_app/screens/all_recipe_screen.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.search, back: false),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: h * .016, horizontal: w * .032),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextFieldWidget(),
            SizedBox(height: h * .04),
            Text(
              AppStrings.searchTags,
              style: TextStyle(fontSize: w * .06, fontWeight: FontWeight.bold),
            ),
            Wrap(
                spacing: 8,
                children: tags.map((label) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllRecipeScreen(recipe: label),
                        ),
                      );
                    },
                    child: Text(label),
                  );
                }).toList())
          ],
        ),
      ),
    );
  }
}
