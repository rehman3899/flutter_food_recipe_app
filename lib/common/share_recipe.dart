import 'package:share_plus/share_plus.dart';

// handle sharing functionality for recipes.
class ShareRecipe {
  // static method to share a recipe link using the Share package.
  static share(String recipeLink) async {
    // Call the Share.share method to trigger the share dialog.
    await Share.share(recipeLink);
  }
}
