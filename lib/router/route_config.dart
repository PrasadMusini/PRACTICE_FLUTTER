// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:practice_flutter/router/r_homepage.dart';
// import 'package:practice_flutter/router/router.dart';

// GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

// final router = GoRouter(
//   navigatorKey: _rootNavigatorKey,
//   routes: <RouteBase>[
//     ShellRoute(
//         parentNavigatorKey: _rootNavigatorKey,
//         navigatorKey: _shellNavigatorKey,
//         builder: (context, state, child) {
//           int index = 0;

//           if (state.fullPath == Routes.menu1.path) {
//             index = 0;
//           } else if (state.fullPath == Routes.menu2.path) {
//             index = 1;
//           } else if (state.fullPath == Routes.menu3.path) {
//             index = 2;
//           } else if (state.fullPath == Routes.menu4.path) {
//             index = 3;
//           }

//           return CupertinoPage(
//               child: NavigationView(
//                 selectedIndex: index,
//                 child: child,
//               ),
//             );
//         },
//         routes: <RouteBase>[
//            GoRoute(
//               path: Routes.homePage.path,
//               name: Routes.homePage.name,
//               pageBuilder: (context, state) =>
//                   const CupertinoPage(child: RHomePage()),
//             ),
//         ])
//   ],
// );

// NavigationView({required int selectedIndex, required Widget child}) {
// }
