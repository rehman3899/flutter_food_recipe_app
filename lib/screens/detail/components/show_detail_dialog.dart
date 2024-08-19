import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class ShowDialog {
  static Future showCalories(
      Map<String, dynamic> item, BuildContext context) async {
    int fat = item['FAT']['quantity'].toInt();
    int sFat = item['FASAT']['quantity'].toInt();
    int cholesterol = item['CHOLE']['quantity'].toInt();
    int nA = item['NA']['quantity'].toInt();
    int carbohydrate = item['CHOCDF.net']['quantity'].toInt();
    int sugar = item['SUGAR']['quantity'].toInt();
    int protein = item['PROCNT']['quantity'].toInt();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.redAccent,
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Text(
                AppStrings.nutritionFact,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          content: Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text(AppStrings.totalFat), Text(fat.toString())],
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text(AppStrings.saturatedFat), Text(sFat.toString())],
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text(AppStrings.cholesterol), Text(cholesterol.toString())],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text(AppStrings.sodium), Text(nA.toString())],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text(AppStrings.carbohydrate), Text(carbohydrate.toString())],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text(AppStrings.sugar), Text(sugar.toString())],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text(AppStrings.protein), Text(protein.toString())],
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
