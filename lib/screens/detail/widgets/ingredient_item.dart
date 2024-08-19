import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:hive_flutter/adapters.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.imageUrl,
  });

  final String quantity, measure, food, imageUrl;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    var myBox = Hive.box('shopping');
    return Container(
      margin: EdgeInsets.symmetric(vertical: h * .01, horizontal: w * .001),
      padding: EdgeInsets.only(
          top: h * .009, bottom: h * .009, left: h * .008, right: w * .06),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3))
          ]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl,
                  width: w * .2, height: h * .1, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "$food\n$quantity $measure",
                  style: TextStyle(
                      fontSize: w * .04,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
            ),
            SizedBox(width: w * .033),
            ValueListenableBuilder(
              valueListenable: myBox.listenable(),
              builder: (context, box, _) {
                bool exist = box.containsKey(food);
                if (exist) {
                  return GestureDetector(
                    onTap: () {
                      myBox.delete(food);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(AppStrings.itemDeleted),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.done,
                      size: w * .07,
                      color: Colors.green,
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      String value = '$food $measure $quantity';
                      myBox.put(food, value);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(AppStrings.itemAdded),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add_circle_outline_rounded,
                      size: w * .07,
                      color: Colors.red,
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
