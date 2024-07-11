import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/project/main_screen/main_screen_mobile.dart';
import 'package:practice_flutter/project/main_screen/pages/favorates_page/favorates_mobile.dart';
import 'package:practice_flutter/project/main_screen/pages/home_page/home_mobile.dart';
import 'package:practice_flutter/project/main_screen/pages/not_found.dart';
import 'package:practice_flutter/project/main_screen/pages/orders_page/screens/order_item_mobile.dart';
import 'package:practice_flutter/project/main_screen/pages/orders_page/orders_mobile.dart';
import 'package:practice_flutter/project/main_screen/pages/profile_page/profile_mobile.dart';
import 'package:practice_flutter/project/main_screen/pages/search_screen.dart/search_mobile.dart';
import 'package:practice_flutter/project/main_screen/pages/test_screen.dart';
import 'package:practice_flutter/project/navigation/router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
//MARK: Branches
final _homeBranchNavigatorKey = GlobalKey<NavigatorState>();
final _favoratesBranchNavigatorKey = GlobalKey<NavigatorState>();
final _ordersBranchNavigatorKey = GlobalKey<NavigatorState>();
final _profileBranchNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: Routes.screenHome.path,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  errorPageBuilder: (context, state) {
    return const CupertinoPage(child: PageNotFound());
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) =>
          MainScreenMobile(navigationShell: child),
      branches: <StatefulShellBranch>[
        //MARK: Branch 1
        StatefulShellBranch(
            navigatorKey: _homeBranchNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  path: Routes.screenHome.path,
                  name: Routes.screenHome.name,
                  builder: (context, state) => const HomeMobile(),
                  routes: <RouteBase>[
                    GoRoute(
                      path: Routes.screenSearch.path,
                      name: Routes.screenSearch.name,
                      pageBuilder: (context, state) => CupertinoPage(
                          key: state.pageKey, child: const SearchMobile()),

                      // pageBuilder: (context, state) => CustomTransitionPage(
                      //   key: state.pageKey,
                      //   child: const SearchMobile(),
                      //   transitionsBuilder:
                      //       (context, animation, secondaryAnimation, child) =>
                      //           SlideTransition(
                      //     position: Tween<Offset>(
                      //             begin: const Offset(-1, 0), end: Offset.zero)
                      //         .animate(animation),
                      //     child: child,
                      //   ),
                      // ),
                    ),

                    /* GoRoute(
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
                        ]), */
                  ])
            ]),
        //MARK: Branch 2
        StatefulShellBranch(
          navigatorKey: _favoratesBranchNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.screenFavorates.path,
              name: Routes.screenFavorates.name,
              builder: (context, state) => const FavoratesMobile(),
              /* routes: <RouteBase>[
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
              ], */
            ),
          ],
        ),

        //MARK: Branch 3
        StatefulShellBranch(
          navigatorKey: _ordersBranchNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.screenOrders.path,
              name: Routes.screenOrders.name,
              builder: (context, state) => const OrdersMobile(),
              /* routes: <RouteBase>[
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
                ], */
            )
          ],
        ),

        //MARK: Branch 4
        StatefulShellBranch(
          navigatorKey: _profileBranchNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.screenProfile.path,
              name: Routes.screenProfile.name,
              builder: (context, state) => const ProfileMobile(),
              /* routes: <RouteBase>[
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
                ], */
            )
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.screenTest.path,
      name: Routes.screenTest.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const Testscreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.screenOrderItem.path,
      name: Routes.screenOrderItem.name,
      pageBuilder: (context, state) =>
          CupertinoPage(key: state.pageKey, child: const OrderItemMobile()),
    ),

    /* 
    GoRoute(
      path: Routes.screen404.path,
      name: Routes.screen404.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PageNotFound(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
 */
    /* GoRoute(
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
   */
  ],
);
