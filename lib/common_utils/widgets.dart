import 'package:flutter/material.dart';

class CommonWidgets {
  static AppBar appBar(String title, VoidCallback onTap,
      {IconData? icon1, IconData? icon2}) {
    return AppBar(
      leading: const Icon(Icons.arrow_back),
      title: Text(title),
      actions: [
        Icon(icon1 ?? Icons.notifications),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(onTap: onTap, child: Icon(icon2 ?? Icons.shopping_bag)),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  static navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}
