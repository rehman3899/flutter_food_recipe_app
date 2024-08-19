import 'package:flutter/material.dart';
import 'package:food_recipe_app/common/custom_app_bar.dart';
import 'package:food_recipe_app/common/share_recipe.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';
import 'package:hive_flutter/adapters.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    var myBox = Hive.box('saved');
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.saved1, back: false),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ValueListenableBuilder(
          valueListenable: myBox.listenable(),
          builder: (context, box, _) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var data = box.values.toList();
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
                              PopupMenuItem(
                                  value: 'share', child: Text(AppStrings.share)),
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
      ),
    );
  }

  Future<void> deleteItem(int index) async {
    var myBox = Hive.box('saved');
    await myBox.deleteAt(index);
  }
}
