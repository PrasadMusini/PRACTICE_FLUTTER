import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                    const SizedBox(width: 12),
                    // searchBar(),
                    Expanded(child: searchBar())
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Recent Search'),
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

  Hero searchBar() {
    return Hero(
      tag: 'tag-search',
      child: Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.grey.shade100,
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: const Row(
          children: [
            Text('Search for '),
            // animatedSlideText(),
            Spacer(),
            Icon(Icons.search),
            VerticalDivider(),
            Icon(Icons.format_align_left_sharp),
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
          Text(title),
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
}
