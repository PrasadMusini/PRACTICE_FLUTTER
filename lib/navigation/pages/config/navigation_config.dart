import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/navigation/mainroot.dart';
import 'package:practice_flutter/navigation/pages/config/app_routes.dart';
import 'package:practice_flutter/navigation/pages/demoscreen/demopage.dart';
import 'package:practice_flutter/navigation/pages/demoscreen/sub1_demopage.dart';
import 'package:practice_flutter/navigation/pages/demoscreen/sub2_demopage.dart';
import 'package:practice_flutter/navigation/pages/pagenotfound.dart';
import 'package:practice_flutter/navigation/pages/profilepage.dart';
import 'package:practice_flutter/navigation/pages/settingspage.dart';
import 'package:practice_flutter/navigation/pages/testscreen/sub1_testpage.dart';
import 'package:practice_flutter/navigation/pages/testscreen/sub2_testpage.dart';
import 'package:practice_flutter/navigation/pages/testscreen/testpage.dart';
import 'package:practice_flutter/navigation/pages/userscreen/sub1_userpage.dart';
import 'package:practice_flutter/navigation/pages/userscreen/sub2_userpage.dart';
import 'package:practice_flutter/navigation/pages/userscreen/userpage.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _userBranchNavigatorKey = GlobalKey<NavigatorState>();
final _demoBranchNavigatorKey = GlobalKey<NavigatorState>();
final _testBranchNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: Routes.userScreen.path,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const PageNotFound(),
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => MainRoot(navigationShell: child),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
            navigatorKey: _userBranchNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  path: Routes.userScreen.path,
                  name: Routes.userScreen.name,
                  builder: (context, state) => const UserPage(),
                  routes: <RouteBase>[
                    GoRoute(
                        path: Routes.userSub1Screen.path,
                        name: Routes.userSub1Screen.name,
                        pageBuilder: (context, state) => CustomTransitionPage(
                              key: state.pageKey,
                              child: const Sub1UserPage(),
                              transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) =>
                                  SlideTransition(
                                position: Tween<Offset>(
                                        begin: const Offset(-1, 0),
                                        end: Offset.zero)
                                    .animate(animation),
                                child: child,
                              ),
                            ),
                        routes: [
                          GoRoute(
                            path: 'usertestingpath',
                            name: 'usertestingpath',
                            pageBuilder: (context, state) =>
                                CustomTransitionPage(
                              child: const Scaffold(
                                body: Center(child: Text('userSub2Screen')),
                              ),
                              transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) =>
                                  SlideTransition(
                                position: Tween<Offset>(
                                        begin: const Offset(-1, 0),
                                        end: Offset.zero)
                                    .animate(animation),
                                child: child,
                              ),
                            ),
                          ),
                        ]),
                    GoRoute(
                      path: Routes.userSub2Screen.path,
                      name: Routes.userSub2Screen.name,
                      pageBuilder: (context, state) => CustomTransitionPage(
                        key: state.pageKey,
                        child: const Sub2UserPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                SlideTransition(
                          position: Tween<Offset>(
                                  begin: const Offset(-1, 0), end: Offset.zero)
                              .animate(animation),
                          child: child,
                        ),
                      ),
                    )
                  ])
            ]),
        StatefulShellBranch(
          navigatorKey: _testBranchNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.testScreen.path,
              name: Routes.testScreen.name,
              builder: (context, state) => const TestPage(),
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.testSub1Screen.path,
                  name: Routes.testSub1Screen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    // key: state.pageKey,
                    child: const Sub1TestPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(-1, 0), end: Offset.zero)
                            .animate(animation),
                        child: child,
                      );
                    },
                  ),
                ),
                GoRoute(
                  path: Routes.testSub2Screen.path,
                  name: Routes.testSub2Screen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const Sub2TestPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(-1, 0), end: Offset.zero)
                            .animate(animation),
                        child: child,
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _demoBranchNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
                path: Routes.demoScreen.path,
                name: Routes.demoScreen.name,
                builder: (context, state) => const DemoPage(),
                routes: <RouteBase>[
                  GoRoute(
                    path: Routes.demoSub1Screen.path,
                    name: Routes.demoSub1Screen.name,
                    pageBuilder: (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: const Sub1DemoPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                    ),
                  ),
                  GoRoute(
                    path: Routes.demoSub2Screen.path,
                    name: Routes.demoSub2Screen.name,
                    pageBuilder: (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: const Sub2DemoPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return ScaleTransition(
                            scale: secondaryAnimation, child: child);
                      },
                    ),
                  )
                ])
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.profileScreen.path,
      name: Routes.profileScreen.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const ProfilePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.settingsScreen.path,
      name: Routes.settingsScreen.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SettingsPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/sub1user',
      name: 'Sub1user',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const Sub1UserPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                    .animate(animation),
            child: child,
          );
        },
      ),
    )
  ],
);
