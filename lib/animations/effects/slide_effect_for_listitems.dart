import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _items = List.generate(10, (index) => "Item $index");
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _addItems();
  }

  void _addItems() {
    Future.delayed(const Duration(milliseconds: 300), () {
      for (int i = 0; i < _items.length; i++) {
        Future.delayed(Duration(milliseconds: 100 * i), () {
          _listKey.currentState!.insertItem(i);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: 0,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], animation);
        },
      ),
    );
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        color: Colors.grey,
        child: Text(
          item,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
