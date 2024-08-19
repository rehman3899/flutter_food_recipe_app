import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/api_constants.dart';
import 'package:food_recipe_app/screens/detail/detail_screen.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          SizedBox(
            height: h * .05,
            child: TabBar(
              tabs: const [
                TabItems(title: AppStrings.breakFast),
                TabItems(title: AppStrings.lunch),
                TabItems(title: AppStrings.dinner),
                TabItems(title: AppStrings.quick),
              ],
              unselectedLabelColor: Colors.red,
              labelColor: Colors.white,
              dividerColor: Colors.white,
              indicator: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              labelPadding: EdgeInsets.symmetric(horizontal: w * .012),
            ),
          ),
          SizedBox(height: h * 0.030),
          SizedBox(
            height: h * .3,
            child: const TabBarView(
              children: [
                HomeTabBarView(recipe: 'breakfast'),
                HomeTabBarView(recipe: 'lunch'),
                HomeTabBarView(recipe: 'dinner'),
                HomeTabBarView(recipe: 'quick'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabItems extends StatelessWidget {
  const TabItems({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 9.8),
          ),
        ),
      ),
    );
  }
}

class HomeTabBarView extends StatelessWidget {
  const HomeTabBarView({super.key, required this.recipe});

  final String recipe;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: ConstantFunction.getRecipeApi(recipe),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text(AppStrings.noData),
          );
        }
        return SizedBox(
          height: h * .28,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Map<String, dynamic> snap = snapshot.data![index];
              int time = snap['totalTime'].toInt();
              int calories = snap['calories'].toInt();
              return Container(
                margin: EdgeInsets.only(right: w * .02),
                width: w * .5,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(items: snap),
                              ),
                            );
                          },
                          child: Container(
                            width: w,
                            height: h * .17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(snap['image']),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        SizedBox(height: h * .01),
                        Text(
                          snap['label'],
                          style: TextStyle(
                              fontSize: w * .035, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "calories ${calories.toString()}, ${time.toString()} min",
                          style: TextStyle(
                            fontSize: w * .03,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
            itemCount: snapshot.data!.length,
          ),
        );
      },
    );
  }
}
