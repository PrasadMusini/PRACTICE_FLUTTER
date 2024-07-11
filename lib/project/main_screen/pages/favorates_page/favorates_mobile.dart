import 'package:flutter/material.dart';
import 'package:practice_flutter/imports.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';
import 'package:practice_flutter/project/main_screen/pages/orders_page/screens/item.dart';

class FavoratesMobile extends StatelessWidget {
  const FavoratesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorates',
          style: Styles.txStyF12FWbFFsCb.copyWith(
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 12),
        child: ListView.builder(
          // physics: const NeverScrollableScrollPhysics(), // Disable scrolling
          // shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Item(
              index: index,
              itemCount: 10,
            );
          },
        ),
      ),
    );
  }
}
