import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FloatedNavBar extends StatefulWidget {
  const FloatedNavBar({super.key});

  @override
  State<FloatedNavBar> createState() => _FloatedNavBarState();
}

class _FloatedNavBarState extends State<FloatedNavBar> {
  int selectedItem = 0;
  bool isScrolled = true;
  final ScrollController _scrollController = ScrollController();

  // final List _navBarProps = [
  //   {
  //     "icon": const Icon(Icons.home),
  //     "text": const Text('data'),
  //   },
  //   {
  //     "icon": const Icon(Icons.home),
  //     "text": const Text('data'),
  //   },
  //   {
  //     "icon": const Icon(Icons.home),
  //     "text": const Text('data'),
  //   },
  // ];

  final List<IconData> _navIcons = [
    Icons.home,
    Icons.home,
    Icons.home,
  ];

  final List _navTitles = [
    'data',
    'data',
    'data',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
            setState(() {
              isScrolled = false;
              debugPrint('reverse');
            });
          } else if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
            setState(() {
              isScrolled = false;
              debugPrint('forward');
            });
          }
          return true;
        },
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              itemCount: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
            SingleChildScrollView(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: _floatedNavBar())),
          ],
        ),
      ),
    );
  }

  Widget _floatedNavBar() {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      height: isScrolled ? 70 : 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(_navIcons.length, (index) {
            IconData navIcon = _navIcons[index];
            bool isSelected = selectedItem == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = index;
                  debugPrint('selectedItem: $selectedItem');
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    navIcon,
                    color: isSelected
                        ? const Color.fromARGB(255, 235, 4, 4)
                        : Colors.grey,
                  ),
                  Text(
                    '${_navTitles[index]} $index',
                    style: TextStyle(
                        color: isSelected
                            ? const Color.fromARGB(255, 250, 15, 6)
                            : Colors.grey),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
