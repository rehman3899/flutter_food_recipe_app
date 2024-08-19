import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/category/components/recipe_category_view.dart';
import 'package:food_recipe_app/screens/category/components/category_list.dart';
import 'package:food_recipe_app/screens/all_recipe_screen.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * .06),
            Text(
              AppStrings.forYou,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .06),
            ),
            SizedBox(height: h * .01),
            SizedBox(
              height: h * .106,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeCategoryView(name: names[0], image: images[0]),
                  RecipeCategoryView(name: names[1], image: images[1]),
                  RecipeCategoryView(name: names[2], image: images[2]),
                  RecipeCategoryView(name: names[3], image: images[3]),
                ],
              ),
            ),
            SizedBox(height: h * .02),
            Text(
              AppStrings.forYou,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .055),
            ),
            SizedBox(
              height: h * .45,
              child: GridView.builder(
                itemCount: categoryImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: h * .01,
                    mainAxisSpacing: w * .021),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllRecipeScreen(recipe: category[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h * .043,
                              width: w * .08,
                              child: Image.asset(categoryImages[index],
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(height: h * .003),
                            Text(
                              category[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              AppStrings.preference,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .055),
            ),
            SizedBox(
              height: h * .13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeCategoryView(name: AppStrings.easy, image: images[0]),
                  RecipeCategoryView(name: AppStrings.quick, image: images[1]),
                  RecipeCategoryView(name: AppStrings.chicken, image: images[2]),
                  RecipeCategoryView(name: AppStrings.lowFat, image: images[3]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
