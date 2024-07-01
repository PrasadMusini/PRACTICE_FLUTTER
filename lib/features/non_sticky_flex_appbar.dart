import 'package:flutter/material.dart';
import 'package:practice_flutter/gen/assets.gen.dart';

class NonStickyAppBarFlexible extends StatelessWidget {
  const NonStickyAppBarFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            excludeHeaderSemantics: true,
            // expandedHeight: 200.0,
            expandedHeight: kToolbarHeight,
            floating: true,
            pinned: false,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Title'),
              background:
                  Image.asset(Assets.images.dragon.path, fit: BoxFit.cover),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item #$index'),
                subtitle: Text('Subtitle #$index'),
              ),
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
