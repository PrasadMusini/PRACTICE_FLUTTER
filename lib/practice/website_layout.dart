import 'package:flutter/material.dart';

class WebSiteLayout extends StatefulWidget {
  const WebSiteLayout({Key? key}) : super(key: key);

  @override
  State<WebSiteLayout> createState() => _WebSiteLayoutState();
}

class _WebSiteLayoutState extends State<WebSiteLayout> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _sectionOneKey = GlobalKey();
  final GlobalKey _sectionTwoKey = GlobalKey();
  final GlobalKey _sectionThreeKey = GlobalKey();
  final GlobalKey _sectionFourKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll to Section'),
        actions: <Widget>[
          HoverButton(
            onPressed: () => scrollToSection(_sectionOneKey),
            child: const Text('Section1'),
          ),
          const SizedBox(width: 20),
          HoverButton(
            onPressed: () => scrollToSection(_sectionTwoKey),
            child: const Text('Section2'),
          ),
          const SizedBox(width: 20),
          HoverButton(
            onPressed: () => scrollToSection(_sectionThreeKey),
            child: const Text('Section3'),
          ),
          const SizedBox(width: 20),
          HoverButton(
            onPressed: () => scrollToSection(_sectionFourKey),
            child: const Text('Section4'),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            Section1(key: _sectionOneKey),
            Section2(key: _sectionTwoKey),
            Section3(key: _sectionThreeKey),
            Section4(key: _sectionFourKey),
          ],
        ),
      ),
    );
  }
}

// class _WebSiteLayoutState extends State<WebSiteLayout> {
//   final ScrollController _scrollController = ScrollController();
//   final GlobalKey _sectionOneKey = GlobalKey();
//   final GlobalKey _sectionTwoKey = GlobalKey();
//   final GlobalKey _sectionThreeKey = GlobalKey();
//   final GlobalKey _sectionFourKey = GlobalKey();

//   @override
//   void dispose() {
//     super.dispose();
//     _scrollController.dispose();
//   }

//   void scrollToSection(GlobalKey key) {
//     final context = key.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(seconds: 1),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scroll to Section'),
//         actions: <Widget>[
//           HoverButton(
//             onPressed: () => scrollToSection(_sectionOneKey),
//             child: const Text(
//               'Section1',
//             ),
//           ),
//           const SizedBox(width: 20),
//           HoverButton(
//             onPressed: () => scrollToSection(_sectionTwoKey),
//             child: const Text(
//               'Section2',
//             ),
//           ),
//           const SizedBox(width: 20),
//           HoverButton(
//             onPressed: () => scrollToSection(_sectionThreeKey),
//             child: const Text(
//               'Section3',
//             ),
//           ),
//           const SizedBox(width: 20),
//           HoverButton(
//             onPressed: () => scrollToSection(_sectionFourKey),
//             child: const Text(
//               'Section4',
//             ),
//           ),
//           const SizedBox(width: 20),
//         ],
//       ),
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         child: Column(
//           children: <Widget>[
//             Section1(key: _sectionOneKey),
//             Section2(key: _sectionTwoKey),
//             Section3(key: _sectionThreeKey),
//             Section4(key: _sectionFourKey),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HoverButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const HoverButton({required this.onPressed, required this.child, Key? key})
      : super(key: key);

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              color: _isHovered ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _isHovered = hover;
    });
  }
}

class Section1 extends StatelessWidget {
  const Section1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      key: key,
      width: size.width,
      padding: const EdgeInsets.all(30),
      color: Colors.greenAccent.shade200,
      child: Column(
        children: List.generate(3, (index) {
          return Container(
            width: size.width,
            height: 200,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Empty Box $index')),
          );
        }),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      key: key,
      width: size.width,
      padding: const EdgeInsets.all(30),
      color: Colors.blueAccent.shade200,
      child: Column(
        children: List.generate(3, (index) {
          return Container(
            width: size.width,
            height: 200,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Empty Box $index')),
          );
        }),
      ),
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      key: key,
      width: size.width,
      padding: const EdgeInsets.all(30),
      color: Colors.pinkAccent.shade200,
      child: Column(
        children: List.generate(3, (index) {
          return Container(
            width: size.width,
            height: 200,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Empty Box $index')),
          );
        }),
      ),
    );
  }
}

class Section4 extends StatelessWidget {
  const Section4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      key: key,
      width: size.width,
      padding: const EdgeInsets.all(30),
      color: Colors.yellowAccent.shade200,
      child: Column(
        children: List.generate(3, (index) {
          return Container(
            width: size.width,
            height: 200,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Empty Box $index')),
          );
        }),
      ),
    );
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   int myCurrentIndex = 0;
//   List pages = const [
//     Test1(),
//     Test2(),
//     Test1(),
//     Test2(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Bottom Navigation Bar"),
//       ),
//       bottomNavigationBar: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.5),
//               blurRadius: 25,
//               offset: const Offset(8, 20))
//         ]),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: BottomNavigationBar(
//               // backgroundColor: Colors.transparent,
//               selectedItemColor: Colors.redAccent,
//               unselectedItemColor: Colors.black,
//               currentIndex: myCurrentIndex,
//               onTap: (index) {
//                 setState(() {
//                   myCurrentIndex = index;
//                 });
//               },
//               items: const [
//                 BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.favorite), label: "Favorite"),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.settings), label: "Setting"),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.person_outline), label: "Profile"),
//               ]),
//         ),
//       ),
//       body: pages[myCurrentIndex],
//     );
//   }
// }

// class Test2 extends StatelessWidget {
//   const Test2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text("Test 2"),
//       ),
//     );
//   }
// }

// class Test1 extends StatelessWidget {
//   const Test1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text("Test 1"),
//       ),
//     );
//   }
// }
