import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class FloatingNavBar extends StatefulWidget {
  const FloatingNavBar({super.key, required this.title});
  final String title;

  @override
  State<FloatingNavBar> createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.purple,
    Colors.blue,
    Colors.pink,
  ];

  final List<Widget> children = [
    const Center(child: Text('Home')),
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
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5
        ? Colors.black
        : Colors.white;
    final Color unselectedColorReverse =
        colors[currentPage].computeLuminance() < 0.5
            ? Colors.white
            : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BottomBar(
        clip: Clip.none,
        fit: StackFit.expand,
        icon: (width, height) => Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: null,
            icon: Icon(
              Icons.arrow_upward_rounded,
              color: colors[currentPage],
              size: width,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(500),
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.8,
        // barColor: Colors.grey,
        // colors[currentPage].computeLuminance() > 0.5
        //     ? Colors.black
        //     : Colors.white,
        start: 3,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 30,
        iconWidth: 30,
        reverse: false,
        barDecoration: BoxDecoration(
          color: colors[currentPage],
          borderRadius: BorderRadius.circular(500),
        ),
        iconDecoration: BoxDecoration(
          color: unselectedColor,
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

          /* colors
              .map(
                (e) => InfiniteListPage(
                  key: ValueKey('infinite_list_key#${e.toString()}'),
                  controller: controller,
                  color: e,
                ),
              )
              .toList(), */
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
              controller: tabController,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: currentPage <= 4
                        ? colors[currentPage]
                        : unselectedColor,
                    width: 4,
                  ),
                  insets: const EdgeInsets.fromLTRB(16, 0, 16, 8)),
              tabs: [
                SizedBox(
                  height: 55,
                  width: 40,
                  child: Center(
                      child: Icon(
                    Icons.home,
                    color: currentPage == 0 ? colors[0] : unselectedColor,
                  )),
                ),
                SizedBox(
                  height: 55,
                  width: 40,
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: currentPage == 1 ? colors[1] : unselectedColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 40,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: currentPage == 2 ? colors[2] : unselectedColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 40,
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: currentPage == 3 ? colors[3] : unselectedColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 40,
                  child: Center(
                    child: Icon(
                      Icons.settings,
                      color: currentPage == 4 ? colors[4] : unselectedColor,
                    ),
                  ),
                ),
              ],
            ),
            /*   Positioned(
              top: -20,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ) */
          ],
        ),
      ),
    );
  }
}

class InfiniteListPage extends StatelessWidget {
  final Color color;
  final ScrollController controller;
  const InfiniteListPage(
      {required this.color, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      // reverse: true,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          tileColor: color,
          title: Text("$index"),
        );
      },
    );
  }
}
