import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/imports.dart';
import 'package:practice_flutter/project/navigation/router.dart';

class MainScreenMobile extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreenMobile({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      // body: Expanded(child: widget.navigationShell),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(context.namedLocation(Routes.screenTest.name));
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
        elevation: 5,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 8,
        selectedFontSize: 12,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 27,
            ),
            activeIcon: Icon(Icons.home),
            tooltip: 'Home tooltip',
            label: 'Home',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorates', // Wish List
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag_rounded),
            label: 'Orders',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
              size: 27,
            ),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Profile',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}


/*   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          IconButton(
            onPressed: () {
              SharedPrefsHelper.setLoginStatus();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SigninMobile()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: const Center(
        child: Text('Main Screen'),
      ),
    );
  }
 */


