import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/home/widgets/tab_bar_widget.dart';
import 'package:food_recipe_app/common/text_field_widget.dart';
import 'package:food_recipe_app/utils/constants/image_string.dart';
import 'package:food_recipe_app/screens/home/widgets/home_app_bar.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                SizedBox(height: h * 0.022),
                const TextFieldWidget(),
                SizedBox(height: h * 0.022),
                Container(
                  height: h * 0.25,
                  width: w,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(AppImages.homeScreenBanner),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: h * 0.023),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.categories,
                      style: TextStyle(
                        fontSize: w * .045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(AppStrings.seeAll)
                  ],
                ),
                SizedBox(height: h * 0.022),
                const TabBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
