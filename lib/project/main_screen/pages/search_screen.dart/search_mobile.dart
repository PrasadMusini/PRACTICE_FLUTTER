import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_textfield.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';

class SearchMobile extends StatelessWidget {
  const SearchMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header(context),
                const SizedBox(height: 20),
                Row(
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     context.pop();
                    //   },
                    //   child: const CircleAvatar(
                    //     radius: 26,
                    //     child: Icon(Icons.arrow_back_rounded),
                    //   ),
                    // ),
                    // const SizedBox(width: 12),
                    // searchBar(),
                    Expanded(child: searchBar())
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Recent Search',
                  style: Styles.txStyF12FWbFFpCb,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('xxxx'),
                    Icon(Icons.remove_circle_outline_rounded)
                  ],
                ),
                const SizedBox(height: 5),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('xxxx'),
                    Icon(Icons.remove_circle_outline_rounded)
                  ],
                ),
                const SizedBox(height: 20),
                menuItems('Recommanded'),
                const SizedBox(height: 20),
                //MARK: Most Ordered Items
                menuItems('Most Ordered Items'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hero searchBar22() {
  //   return const Hero(
  //       tag: 'tag-search',
  //       child: CustomField(
  //         hintText: 'What do you want to eat?',
  //         suffixIcon: Icon(Icons.search),
  //       ));
  // }

  Hero searchBar() {
    return Hero(
      tag: 'tag-search',
      child: Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  hintText: 'What do you like to eat?',
                  hintStyle: Styles.txStyF12FWbFFpCb.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  // suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            // CustomField(
            //   hintText: 'What do you want to eat?',
            //   suffixIcon: Icon(Icons.search),
            // ),
            // animatedSlideText(),
            // const Spacer(),
            const Icon(Icons.search),
            const VerticalDivider(),
            const Icon(Icons.format_align_left_sharp),
          ],
        ),
      ),
    );
  }

  Column menuItems(String title) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.txStyF12FWbFFpCb,
          ),
          const Text('See all'),
        ],
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Container(
                  width: 145,
                  height: 160,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Stack(
                    children: [
                      Positioned(
                        top: 8,
                        right: 6,
                        child: Icon(Icons.favorite_border),
                      )
                    ],
                  ),
                ),
                const Column(
                  children: [
                    Text('Item Name'),
                    Text(
                      'description',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'description',
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_border_purple500_outlined,
                              size: 14,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          '10 - 15min',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    ]);
  }

  Row header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const CircleAvatar(
                radius: 26,
                child: Icon(Icons.arrow_back_rounded),
              ),
            ),
            const SizedBox(width: 10),
            const Text('User Name'),
          ],
        ),
        CircleAvatar(
          radius: 20,
          child: Image.asset(Assets.images.googleLogo.path),
        ),
      ],
    );
  }
}
