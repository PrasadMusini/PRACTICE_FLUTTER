import 'package:flutter/material.dart';
import 'package:auto_animated/auto_animated.dart';

class AnimatedListAndGrid extends StatelessWidget {
  const AnimatedListAndGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animated List & Grid'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'List'),
              Tab(text: 'Grid'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AnimatedListExample(),
            AnimatedGridExample(),
          ],
        ),
      ),
    );
  }
}

class AnimatedListExample extends StatelessWidget {
  const AnimatedListExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listItems = List.generate(20, (index) => 'List Item $index');
    return LiveList.options(
      options: const LiveOptions(
        delay: Duration(milliseconds: 100), // Delay before animation starts
        showItemInterval:
            Duration(milliseconds: 100), // Interval between item animations
        showItemDuration:
            Duration(milliseconds: 250), // Duration of animation per item
        reAnimateOnVisibility: false, // Do not re-animate items when scrolling
      ),
      itemCount: listItems.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: Offset.zero,
            ).animate(animation),
            child: Card(
              child: ListTile(
                title: Text(listItems[index]),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedGridExample extends StatelessWidget {
  const AnimatedGridExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gridItems = List.generate(20, (index) => 'Grid Item $index');
    return LiveGrid.options(
      options: const LiveOptions(
        delay: Duration(milliseconds: 100),
        showItemInterval: Duration(milliseconds: 100),
        showItemDuration: Duration(milliseconds: 250),
        reAnimateOnVisibility: false,
      ),
      itemCount: gridItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: Card(
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  gridItems[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
