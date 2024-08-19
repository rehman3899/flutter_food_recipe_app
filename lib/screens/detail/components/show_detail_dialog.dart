import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class ShowDialog {
  // Static method to show a dialog displaying nutritional information
  static Future showCalories(
      Map<String, dynamic> item, BuildContext context) async {
    // Extract nutritional values from the item map and convert them to integers
    int fat = item['FAT']['quantity'].toInt();
    int sFat = item['FASAT']['quantity'].toInt();
    int cholesterol = item['CHOLE']['quantity'].toInt();
    int nA = item['NA']['quantity'].toInt();
    int carbohydrate = item['CHOCDF.net']['quantity'].toInt();
    int sugar = item['SUGAR']['quantity'].toInt();
    int protein = item['PROCNT']['quantity'].toInt();

    // Display a dialog with the nutritional information
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              EdgeInsets.zero, // Removes default padding around content
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)), // Rounded corners
          backgroundColor: Colors.redAccent, // Dialog background color

          // Dialog title
          title: const Center(
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: 18), // Adds spacing below the title
              child: Text(
                AppStrings.nutritionFact, // Title text from constants
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400), // Styling the title text
              ),
            ),
          ),

          // Dialog content
          content: Container(
            height: 300, // Fixed height of the dialog content
            decoration: const BoxDecoration(
              color: Colors.white, // Content background color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10), // Rounded bottom left corner
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 18), // Horizontal padding inside the content
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimum size for the column
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Align children to the start of the column
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Evenly distribute space between children
                children: [
                  // Rows for each nutritional fact displaying the name and value
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppStrings.totalFat),
                      Text(fat.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppStrings.saturatedFat),
                      Text(sFat.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppStrings.cholesterol),
                      Text(cholesterol.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppStrings.sodium),
                      Text(nA.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppStrings.carbohydrate),
                      Text(carbohydrate.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppStrings.sugar),
                      Text(sugar.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppStrings.protein),
                      Text(protein.toString())
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
