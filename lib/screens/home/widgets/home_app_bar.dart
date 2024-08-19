import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    //final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(
          AppStrings.homeAppBarTxt,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: w * 0.07,
            height: 1,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
