import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/navigation/pages/pagenotfound.dart';
import 'package:practice_flutter/practice/fnb/floating_bottom_navbar.dart';
import 'package:practice_flutter/practice/fnb/members_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
//MARK: Branches
final _homeBranchNavigatorKey = GlobalKey<NavigatorState>();
final _favoratesBranchNavigatorKey = GlobalKey<NavigatorState>();
final _ordersBranchNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: Routes.screen1.path,
  // initialLocation: Routes.screenHome.path,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  errorPageBuilder: (context, state) {
    return const CupertinoPage(child: PageNotFound());
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => MainScreen(navigationShell: child),
      branches: <StatefulShellBranch>[
        //MARK: Branch 1
        StatefulShellBranch(
            navigatorKey: _homeBranchNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  path: Routes.screen1.path,
                  name: Routes.screen1.name,
                  builder: (context, state) => const HomeScreen()),
            ]),
        //MARK: Branch 2
        StatefulShellBranch(
          navigatorKey: _favoratesBranchNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.screen2.path,
              name: Routes.screen2.name,
              builder: (context, state) => const MembersScreen(),
            ),
          ],
        ),

        //MARK: Branch 3
        StatefulShellBranch(
          navigatorKey: _ordersBranchNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.screen3.path,
              name: Routes.screen3.name,
              builder: (context, state) => const Scaffold(
                body: Center(child: Text('Screen 3')),
              ),
            )
          ],
        ),
      ],
    ),
  ],
);

class AppRouter {
  final String path;
  final String name;
  AppRouter({required this.path, required this.name});
}

class Routes {
  static AppRouter screen1 = AppRouter(path: '/screen1', name: 'screen1');
  static AppRouter screen2 = AppRouter(path: '/screen2', name: 'screen2');
  static AppRouter screen3 = AppRouter(path: '/screen3', name: 'screen3');
  static AppRouter screen4 = AppRouter(path: '/screen4', name: 'screen4');
  static AppRouter screen5 = AppRouter(path: '/screen5', name: 'screen5');
}
