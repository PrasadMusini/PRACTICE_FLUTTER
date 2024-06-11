import 'package:flutter/material.dart';

class TabsBar extends StatefulWidget {
  const TabsBar({super.key});

  @override
  State<TabsBar> createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultTabController(
          length: 4,
          child: TabBar(
            onTap: (value) {},
            indicatorColor: Colors.red,
            isScrollable: false,
            tabs: const [
              Tab(
                text: 'Tab1',
              ),
              Tab(
                text: 'Tab2',
              ),
              Tab(
                text: 'Tab3',
              ),
              Tab(
                text: 'Tab4',
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
