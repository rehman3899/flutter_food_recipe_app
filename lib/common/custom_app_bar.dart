import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.back});

  final String title;
  final bool back;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            fontSize: w * .06,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepOrangeAccent,
      leading: back ? const BackButton(color: Colors.white) : Container(),
    );
  }
}
