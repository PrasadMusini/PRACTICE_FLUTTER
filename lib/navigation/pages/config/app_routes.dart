class AppRouter {
  final String path;
  final String name;
  AppRouter({required this.path, required this.name});
}

class Routes {
  static AppRouter userScreen = AppRouter(path: '/user', name: 'User');
  static AppRouter userSub1Screen =
      AppRouter(path: 'userSub1Screen', name: 'User Sub1 Screen');
  static AppRouter userSub2Screen =
      AppRouter(path: 'userSub2Screen', name: 'User Sub2 Screen');
  static AppRouter demoScreen = AppRouter(path: '/demos', name: 'Demo');
  static AppRouter demoSub1Screen =
      AppRouter(path: 'demoSub1Screen', name: 'Demo Sub1 Screen');
  static AppRouter demoSub2Screen =
      AppRouter(path: 'demoSub2Screen', name: 'Demo Sub2 Screen');
  static AppRouter testScreen = AppRouter(path: '/tests', name: 'Test');
  static AppRouter testSub1Screen =
      AppRouter(path: 'testSub1Screen', name: 'Test Sub1 Screen');
  static AppRouter testSub2Screen =
      AppRouter(path: 'testSub2Screen', name: 'Test Sub2 Screen');
  static AppRouter profileScreen =
      AppRouter(path: '/profileScreen', name: 'profileScreen');
  static AppRouter settingsScreen =
      AppRouter(path: '/settingsScreen', name: 'settingsScreen');
}
