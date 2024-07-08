import 'package:flutter/material.dart';

class AnimatedListItems extends StatefulWidget {
  final Widget child;
  final int listlength;
  final double delayInMilliseconds;
  const AnimatedListItems(
      {super.key,
      required this.child,
      this.listlength = 10,
      this.delayInMilliseconds = 300});

  @override
  State<AnimatedListItems> createState() => _AnimatedListItemsState();
}

class _AnimatedListItemsState extends State<AnimatedListItems>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _addItems();
  }

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _addItems() {
    Future.delayed(Duration(milliseconds: widget.delayInMilliseconds.toInt()),
        () {
      for (int i = 0; i < widget.listlength; i++) {
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
          return _buildItem(index, animation);
        },
      ),
    );
  }

  Widget _buildItem(int item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: widget.child,
      // Container(
      //   margin: const EdgeInsets.symmetric(vertical: 10),
      //   padding: const EdgeInsets.all(20),
      //   color: Colors.grey,
      //   child: Text(
      //     item,
      //     style: const TextStyle(fontSize: 18),
      //   ),
      // ),
    );
  }
}
