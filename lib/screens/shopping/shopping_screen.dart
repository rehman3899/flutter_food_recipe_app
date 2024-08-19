import 'package:flutter/material.dart';
import 'package:food_recipe_app/common/custom_app_bar.dart';
import 'package:food_recipe_app/common/share_recipe.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:hive_flutter/adapters.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    var myBox = Hive.box('shopping');
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.shopping, back: false),
      body: ValueListenableBuilder(
        valueListenable: myBox.listenable(),
        builder: (context, box, _) {
          var data = box.values.toList();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  height: h * .085,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(data[index]),
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return const [
                            PopupMenuItem(value: 'share', child: Text(AppStrings.share)),
                            PopupMenuItem(
                                value: 'delete', child: Text(AppStrings.delete)),
                          ];
                        },
                        onSelected: (String value) async {
                          if (value == 'delete') {
                            deleteItem(index);
                          } else if (value == 'share') {
                            ShareRecipe.share(data[index]);
                          }
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> deleteItem(int index) async {
    var myBox = Hive.box('shopping');
    await myBox.deleteAt(index);
  }
}
