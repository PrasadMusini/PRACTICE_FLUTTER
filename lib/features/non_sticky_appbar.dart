import 'package:flutter/material.dart';

class NonStickyAppbar extends StatefulWidget {
  const NonStickyAppbar({super.key});

  @override
  State<NonStickyAppbar> createState() => _NonStickyAppbarState();
}

class _NonStickyAppbarState extends State<NonStickyAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('Non Sticky Appbar'),
          expandedHeight: 100,
          backgroundColor: Colors.grey,
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              title: Text('test $index'),
              trailing: const Icon(Icons.chevron_right),
            );
          },
        ))
      ],
    ));
  }
}
