import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/project/auth/signin/signin_mobile.dart';
import 'package:practice_flutter/project/auth/signup/signup_mobile.dart';
import 'package:practice_flutter/project/launch/onboarding/onboarding_mobile.dart';
import 'package:practice_flutter/project/launch/splash/splash_mobile.dart';
import 'package:practice_flutter/project/main_screen/pages/notification_screen.dart';
import 'package:practice_flutter/project/main_screen/pages/profile_page/profile_option.dart';
import 'package:practice_flutter/project/main_screen/pages/story/story.dart';
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
  initialLocation: Routes.screenSplash.path,
  // initialLocation: Routes.screenHome.path,
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
                      key: state.pageKey,
                      child: const SearchMobile(),
                    ),
                  ),
                ],
              ),
            ]),
        //MARK: Branch 2
        StatefulShellBranch(
          navigatorKey: _favoratesBranchNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.screenFavorates.path,
              name: Routes.screenFavorates.name,
              builder: (context, state) => const FavoratesMobile(),
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
              routes: <RouteBase>[
                GoRoute(
                    path: '${Routes.screenProfileOption.path}/:title',
                    name: Routes.screenProfileOption.name,
                    pageBuilder: (context, state) {
                      final title = state.pathParameters['title']!;
                      return CupertinoPage(
                        key: state.pageKey,
                        child: ProfileOption(
                          title: title,
                        ),
                      );
                    }),
              ],
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
        child: const Testscreen(
          index: 1,
          itemCount: 1,
        ),
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
    GoRoute(
      path: Routes.screenStory.path,
      name: Routes.screenStory.name,
      pageBuilder: (context, state) =>
          CupertinoPage(key: state.pageKey, child: const Story()),
    ),
    GoRoute(
      path: Routes.screenSplash.path,
      name: Routes.screenSplash.name,
      pageBuilder: (context, state) =>
          CupertinoPage(key: state.pageKey, child: const SplashMobile()),
    ),
    GoRoute(
      path: Routes.screenOnBoarding.path,
      name: Routes.screenOnBoarding.name,
      pageBuilder: (context, state) =>
          CupertinoPage(key: state.pageKey, child: const OnboardingMobile()),
    ),
    GoRoute(
      path: Routes.screenSignin.path,
      name: Routes.screenSignin.name,
      pageBuilder: (context, state) =>
          CupertinoPage(key: state.pageKey, child: const SigninMobile()),
    ),
    GoRoute(
      path: Routes.screenSignup.path,
      name: Routes.screenSignup.name,
      pageBuilder: (context, state) =>
          CupertinoPage(key: state.pageKey, child: const SignupMobile()),
    ),
    GoRoute(
      path: Routes.screenNotifications.path,
      name: Routes.screenNotifications.name,
      pageBuilder: (context, state) =>
          CupertinoPage(key: state.pageKey, child: const NotificationScreen()),
    ),
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
  ],
);
