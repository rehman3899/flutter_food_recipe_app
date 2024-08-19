import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/detail/widgets/circle_button.dart';
import 'package:food_recipe_app/common/custom_clip_path.dart';
import 'package:food_recipe_app/screens/detail/widgets/ingredient_list.dart';
import 'package:food_recipe_app/common/share_recipe.dart';
import 'package:food_recipe_app/screens/detail/components/show_detail_dialog.dart';
import 'package:food_recipe_app/screens/detail/components/show_table.dart';
import 'package:food_recipe_app/screens/detail/components/start_cooking.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:hive_flutter/adapters.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.items});

  final Map<String, dynamic> items;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var myBox = Hive.box('saved');
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * .44,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.items['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: h * .04,
                  left: w * .05,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: BackButton(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: h * .03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    widget.items['label'],
                    style: TextStyle(
                        fontSize: w * .05,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 1),
                  Text("${widget.items['totalTime'].toString()} min"),
                  SizedBox(height: h * .01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ShareRecipe.share(widget.items['url']);
                        },
                        child: const CircleButton(
                          icon: Icons.share,
                          label: AppStrings.share,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: myBox.listenable(),
                        builder: (context, box, _) {
                          String key = widget.items['label'];
                          bool saved = myBox.containsKey(key);
                          if (saved) {
                            return GestureDetector(
                              onTap: () {
                                myBox.delete(key);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text(AppStrings.recipeDeleted),
                                  ),
                                );
                              },
                              child: const CircleButton(
                                icon: Icons.bookmark,
                                label: AppStrings.saved,
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                myBox.put(key, key);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text(AppStrings.recipeAdded),
                                  ),
                                );
                              },
                              child: const CircleButton(
                                icon: Icons.bookmark_border,
                                label: AppStrings.save,
                              ),
                            );
                          }
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          ShowDialog.showCalories(
                              widget.items['totalNutrients'], context);
                        },
                        child: const CircleButton(
                          icon: Icons.monitor_heart_outlined,
                          label: AppStrings.calories,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ShowTable.showTable(context);
                        },
                        child: const CircleButton(
                          icon: Icons.table_chart_outlined,
                          label: AppStrings.unitChart1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        AppStrings.direction,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: w * .06),
                      ),
                      SizedBox(
                        width: w * .34,
                        child: ElevatedButton(
                          onPressed: () {
                            StartCooking.startCooking(widget.items['url']);
                          },
                          child: const Text(AppStrings.start),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * .02),
                  Container(
                    height: h * .07,
                    width: w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipPath(
                            clipper: CustomClipPath(),
                            child: Container(
                              color: Colors.redAccent,
                              child: Center(
                                child: Text(
                                  AppStrings.ingredientsRequired,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: w * .05),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: const Center(
                              child: Text('   6\nitems'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h,
                    child: IngredientList(
                      ingredients: widget.items['ingredients'],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
