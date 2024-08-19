import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/image_string.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:food_recipe_app/screens/home.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: h * 0.79,
                width: w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.onBoardingImage),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: h * 0.243,
                width: w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: h * 0.032),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.onBoardingTitle1,
                          style: TextStyle(
                            fontSize: w * 0.06,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: h * 0.01),
                        const Text(
                          AppStrings.onBoardingTitle2,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: h * 0.032),
                        SizedBox(
                          width: w * 0.8,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                              );
                            },
                            child: const Text(
                              AppStrings.onBoardingButton,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
