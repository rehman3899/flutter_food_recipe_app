import 'package:flutter/material.dart';
import 'package:food_recipe_app/common/custom_app_bar.dart';
import 'package:food_recipe_app/utils/constants/api_constants.dart';
import 'package:food_recipe_app/screens/detail/detail_screen.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class AllRecipeScreen extends StatelessWidget {
  const AllRecipeScreen({super.key, required this.recipe});

  final String recipe;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: recipe, back: true),
      body: FutureBuilder(
        future: ConstantFunction.getRecipeApi(recipe),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Add check for snapshot.data
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text(AppStrings.noRecipesFound));
          }

          return Padding(
            padding:
                EdgeInsets.only(right: w * .034, left: w * .034, top: h * .03),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                childAspectRatio: .6 / 1,
              ),
              itemCount: snapshot.data!.length, // Specify the item count
              itemBuilder: (context, index) {
                Map<String, dynamic> snap = snapshot.data![index];
                int time = snap['totalTime'].toInt();
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(items: snap),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: NetworkImage(snap['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 7,
                              left: 15,
                              child: Container(
                                height: 20,
                                width: 55,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "${time.toString()} min",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 6),
                          child: Text(
                            snap['label'],
                            style: TextStyle(
                                fontSize: w * .03, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
