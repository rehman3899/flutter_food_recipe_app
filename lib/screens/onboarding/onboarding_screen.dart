import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/image_string.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:food_recipe_app/screens/home.dart';

// StatelessWidget for the OnboardingScreen
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the height and width of the screen
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            // Positioned widget to place the onboarding image at the top
            Positioned(
              top: 0,
              child: Container(
                height: h * 0.79, // Set the height to 79% of the screen height
                width: w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        AppImages.onBoardingImage), // Background image
                  ),
                ),
              ),
            ),
            // Positioned widget to place the content container at the bottom
            Positioned(
              bottom: 0,
              child: Container(
                height:
                    h * 0.243, // Set the height to 24.3% of the screen height
                width: w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(40), // Rounded corners for the top left
                    topRight: Radius.circular(
                        40), // Rounded corners for the top right
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: h * 0.032), // Add padding from the top
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center align the content vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center align the content horizontally
                      children: [
                        // Title text
                        Text(
                          AppStrings.onBoardingTitle1,
                          style: TextStyle(
                            fontSize:
                                w * 0.06, // Font size based on screen width
                            fontWeight:
                                FontWeight.w600, // Semi-bold font weight
                          ),
                        ),
                        SizedBox(height: h * 0.01), // Spacer between texts
                        // Subtitle text
                        const Text(
                          AppStrings.onBoardingTitle2,
                          style: TextStyle(
                            fontSize: 14, // Fixed font size
                            fontWeight: FontWeight.w300, // Light font weight
                          ),
                        ),
                        SizedBox(
                            height:
                                h * 0.032), // Spacer between text and button
                        // Elevated button to navigate to the Home screen
                        SizedBox(
                          width: w * 0.8, // Button width based on screen width
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Home(), // Navigate to the Home screen
                                ),
                              );
                            },
                            child: const Text(
                              AppStrings.onBoardingButton,
                              style: TextStyle(
                                color: Colors.black, // Button text color
                                fontWeight: FontWeight.bold, // Bold font weight
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
