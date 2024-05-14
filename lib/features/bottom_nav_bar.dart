import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:practice_flutter/temp/page1.dart';
import 'package:practice_flutter/temp/page2.dart';
import 'package:practice_flutter/temp/page3.dart';
import 'package:practice_flutter/temp/page4.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    Page4(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.black,
        child: GNav(
            selectedIndex: currentIndex,
            onTabChange: (selectedIndex) {
              setState(() {
                currentIndex = selectedIndex;
              });
            },
            gap: 8,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            hoverColor: Colors.red,
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
              ),
              GButton(
                icon: Icons.info_outline,
                text: 'About',
              ),
              GButton(
                icon: Icons.settings_outlined,
                text: 'Settings',
              ),
            ]),
      ),
    );
  }
}
