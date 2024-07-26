import 'package:flutter/material.dart';

class ExpansionTileWid extends StatelessWidget {
  const ExpansionTileWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Web Navigation'),
      ),
      body: const Row(
        children: [
          NavigationDrawer(),
          Expanded(
            child: Center(
              child: Text('Main Content Area'),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.blue,
              childrenPadding: const EdgeInsets.only(left: 20),
              leading: const Icon(Icons.menu),
              title: const Text('Menu'),
              expansionAnimationStyle: AnimationStyle(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              trailing: const Icon(Icons.arrow_right),
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.subdirectory_arrow_right_rounded),
                  title: const Text('Submenu 1'),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () {
                    // Handle submenu1 tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.subdirectory_arrow_right),
                  title: const Text('Submenu 2'),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () {
                    // Handle submenu2 tap
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              // Handle settings tap
            },
          ),
        ],
      ),
    );
  }
}
