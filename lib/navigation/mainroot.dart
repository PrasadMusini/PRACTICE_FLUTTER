import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainRoot extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainRoot({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      // body: Expanded(child: widget.navigationShell),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(context.namedLocation('settingsScreen'));
        },
        child: const Icon(Icons.settings),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        selectedItemColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person_2_rounded),
            tooltip: 'user tooltip',
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet_sharp),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.domain_verification_rounded),
            label: 'Demo',
          ),
        ],
      ),
    );
  }
}
