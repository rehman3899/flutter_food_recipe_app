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

// This is the DetailScreen class, a stateful widget that displays detailed information about a recipe.
class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.items});

  // 'items' is a map containing the details of the recipe, such as label, image, ingredients, etc.
  final Map<String, dynamic> items;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

// The state class for DetailScreen, where the UI is built.
class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    // Hive box for storing saved recipes
    var myBox = Hive.box('saved');

    // Fetching the height and width of the screen
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    // The main layout of the screen
    return Scaffold(
      backgroundColor: Colors.grey.shade300, // Setting the background color
      body: SingleChildScrollView(
        // Allows the entire content to be scrollable
        child: Column(
          children: [
            Stack(
              children: [
                // The top section containing the recipe image
                Container(
                  height:
                      h * .44, // Setting the height to 44% of the screen height
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          widget.items['image']), // Displaying the recipe image
                      fit: BoxFit.cover, // Covering the entire container
                    ),
                  ),
                ),
                // Positioned back button in the top left corner
                Positioned(
                  top: h * .04,
                  left: w * .05,
                  child: InkWell(
                    onTap: () => Navigator.pop(
                        context), // Navigates back to the previous screen
                    child: const CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: BackButton(
                          color: Colors
                              .white), // A white back button inside a red circle
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: h *
                      .03), // Horizontal padding for the content below the image
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // Spacing above the title
                  Text(
                    widget.items['label'], // Displaying the recipe label
                    style: TextStyle(
                        fontSize: w * .05, // Font size relative to screen width
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 1), // Small space
                  Text(
                      "${widget.items['totalTime'].toString()} min"), // Displaying the total cooking time
                  SizedBox(height: h * .01), // Spacing below the cooking time
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceAround, // Evenly spacing the buttons
                    children: [
                      // Share button
                      GestureDetector(
                        onTap: () {
                          ShareRecipe.share(
                              widget.items['url']); // Shares the recipe URL
                        },
                        child: const CircleButton(
                          icon: Icons.share,
                          label: AppStrings.share,
                        ),
                      ),
                      // Save/Unsave button using Hive for local storage
                      ValueListenableBuilder(
                        valueListenable: myBox.listenable(),
                        builder: (context, box, _) {
                          String key = widget.items['label'];
                          bool saved = myBox.containsKey(
                              key); // Checks if the recipe is already saved
                          if (saved) {
                            return GestureDetector(
                              onTap: () {
                                myBox.delete(key); // Deletes the saved recipe
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text(AppStrings
                                        .recipeDeleted), // Shows a message that the recipe was deleted
                                  ),
                                );
                              },
                              child: const CircleButton(
                                icon: Icons.bookmark,
                                label: AppStrings
                                    .saved, // Shows that the recipe is saved
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                myBox.put(key, key); // Saves the recipe
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text(AppStrings
                                        .recipeAdded), // Shows a message that the recipe was added
                                  ),
                                );
                              },
                              child: const CircleButton(
                                icon: Icons.bookmark_border,
                                label: AppStrings.save, // Shows the save option
                              ),
                            );
                          }
                        },
                      ),
                      // Calories button
                      GestureDetector(
                        onTap: () {
                          ShowDialog.showCalories(
                              widget.items['totalNutrients'],
                              context); // Shows a dialog with calorie details
                        },
                        child: const CircleButton(
                          icon: Icons.monitor_heart_outlined,
                          label: AppStrings.calories,
                        ),
                      ),
                      // Unit conversion table button
                      GestureDetector(
                        onTap: () {
                          ShowTable.showTable(
                              context); // Shows a table of unit conversions
                        },
                        child: const CircleButton(
                          icon: Icons.table_chart_outlined,
                          label: AppStrings.unitChart1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: h * .02), // Spacing before the directions section
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceAround, // Aligning text and button
                    children: [
                      Text(
                        AppStrings.direction, // Direction text
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: w * .06),
                      ),
                      SizedBox(
                        width: w * .34, // Setting the button width
                        child: ElevatedButton(
                          onPressed: () {
                            StartCooking.startCooking(widget.items[
                                'url']); // Starts cooking by opening the recipe URL
                          },
                          child: const Text(AppStrings.start),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height:
                          h * .02), // Spacing before the ingredients section
                  Container(
                    height:
                        h * .07, // Setting height for the ingredients header
                    width: w,
                    color: Colors.white, // Background color for the header
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipPath(
                            clipper:
                                CustomClipPath(), // Custom clip path for the ingredients header
                            child: Container(
                              color: Colors.redAccent,
                              child: Center(
                                child: Text(
                                  AppStrings.ingredientsRequired, // Header text
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
                            color: Colors
                                .white, // Background color for the item count
                            child: const Center(
                              child: Text(
                                  '   6\nitems'), // Number of ingredients (static in this example)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h, // Height for the ingredient list
                    child: IngredientList(
                      ingredients: widget.items[
                          'ingredients'], // Passing the ingredients to the IngredientList widget
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
