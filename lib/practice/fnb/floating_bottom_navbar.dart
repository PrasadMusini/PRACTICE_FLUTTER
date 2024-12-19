import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreen({super.key, required this.navigationShell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
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
        width: MediaQuery.of(context).size.width * 0.5,
        barColor: backgroundColor,
        start: 2,
        end: 0,
        offset: 15,
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
        body: (context, controller) => Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(child: widget.navigationShell),
        ),

/*         PageView(
          controller: PageController(initialPage: 0),
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
              tabController.animateTo(index);
            });
          },
          children: [
            SafeArea(child: widget.navigationShell),
            SafeArea(child: widget.navigationShell),
            SafeArea(child: widget.navigationShell),
          ],
        ), */
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
          ],
          onTap: (index) {
            tabController.index = index;
            widget.navigationShell.goBranch(
              index,
              initialLocation: index == widget.navigationShell.currentIndex,
            );
          },
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
