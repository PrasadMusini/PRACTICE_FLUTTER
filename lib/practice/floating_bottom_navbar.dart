import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});
  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  final List<Widget> children = [
    Expanded(
        child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.black26,
                title: Text(
                    'This is very big text, displaying on listtile $index'),
                trailing: const Icon(Icons.chevron_right),
              );
            })),
    // const Center(child: Text('Home')),
    const Center(child: Text('Profile')),
    const Center(child: Text('Settings')),
    const Center(child: Text('Order')),
    const Center(child: Text('Menu')),
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation?.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Colors.black45;
    const Color selectedColor = Colors.white;
    const Color unselectedColor = Colors.grey;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BottomBar(
        fit: StackFit.expand,
        icon: (width, height) => Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: null,
            icon: Icon(
              Icons.arrow_upward_rounded,
              color: selectedColor,
              size: width,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(500),
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.8,
        barColor: backgroundColor,
        start: 2,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 35,
        iconWidth: 35,
        reverse: false,
        barDecoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(500),
        ),
        iconDecoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(500),
        ),
        hideOnScroll: true,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children: children,
        ),
        child: TabBar(
          dividerColor: Colors.transparent,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
          controller: tabController,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: selectedColor,
              width: 4,
            ),
            insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
          ),
          tabs: [
            buildTabIcon(Icons.home, 0, selectedColor, unselectedColor),
            buildTabIcon(Icons.search, 1, selectedColor, unselectedColor),
            buildTabIcon(Icons.add, 2, selectedColor, unselectedColor),
            buildTabIcon(Icons.favorite, 3, selectedColor, unselectedColor),
            buildTabIcon(Icons.settings, 4, selectedColor, unselectedColor),
          ],
        ),
      ),
    );
  }

  Widget buildTabIcon(
      IconData icon, int index, Color selectedColor, Color unselectedColor) {
    return SizedBox(
      height: 55,
      width: 40,
      child: Center(
        child: Icon(
          icon,
          color: currentPage == index ? selectedColor : unselectedColor,
        ),
      ),
    );
  }
}
